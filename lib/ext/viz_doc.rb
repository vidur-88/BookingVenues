module VizDoc
  @logger = Rails.logger
  @logger.level = Logger::INFO
  @logger.info "VizDoc Logger Initialized!"

  @bindings_map = {}
  @active_record_public_functions = [:find_by_sql]

  files = Dir["app/**/*.rb"]
  files = files.map {|f| f.gsub(/app\/[a-zA-Z]*\//,"")}
  files = files.map {|f| f.gsub(/\.rb/,"")}

  @classes = files.reduce([]) do |acc, f|
    parts = f.split('/')
    if parts.size > 1
      ## inside a module. join with ::
      x = parts.map do |part|
        part.split('_').map{|o| o.capitalize}.join
      end
      acc << x.join('::')
    else
      acc << parts.first.split('_').map{|o| o.capitalize}.join
    end
  end

  @classes.push("ActiveRecord::Querying")

  class << self
    attr_accessor :logger, :bindings_map, :active_record_public_functions, :classes
  end
end

set_trace_func proc { |event, file, line, method, binding, classname|
  begin
    if ['call', 'return'].include?(event) and VizDoc.classes.include?(classname.name)

      #if VizDoc.bindings_map[classname.to_s].nil?
      VizDoc.bindings_map[classname.to_s] = (classname.methods(false) + classname.instance_methods(false) - ActiveRecord::Base.methods + VizDoc.active_record_public_functions).reject { |x| x.to_s =~ /(after|before|autosave|validate|_one|_run|middleware)_/ or x.to_s =~ /\A_.*/ or x.to_s =~ /_path\Z/}
      #end
      vars = binding.local_variables
      params = {}
      vars.each do |var|
        params[var] = binding.local_variable_get(var)
      end

      allowed_bindings = VizDoc.bindings_map[classname.to_s]

      if allowed_bindings.include?(method)
        if classname.to_s == "ActiveRecord::Querying" and method.to_s == "find_by_sql"
          # VizDoc.logger.info(binding.local_variable_get(:sql).to_sql(binding.local_variable_get(:binds)))
          #arel = binding.local_variable_get(:sql)
          #binds = binding.local_variable_get(:binds)
          #VizDoc.logger.info(eval(methods, binding).to_s)
          #arel, binds = eval(binds_from_relation(arel, binds), binding)
          #sql = evan(to_sql(arel, binds), binding)
          #VizDoc.logger.info(sql)
          #VizDoc.logger.info(binding.local_variable_get(:sql).instance_variable_get(:@ast))
          params = {}
          params[:sql] = binding.local_variable_get(:sql).to_sql
          #VizDoc.logger.info(binding.local_variable_get(:sql).to_dot)
          classname = binding.local_variable_get(:sql).instance_variable_get(:@engine)
        end

        VizDoc.logger.info(sprintf "%8s %10s %8s %s", event, method, classname, params)
      else
        # VizDoc.logger.info("not found : #{method}")
      end
    end
  rescue Exception => e
    # VizDoc.logger.error(sprintf "%s %s %s", e.message, event, method)
  end
}
