module VizDoc
  @logfile = File.open(File.expand_path('../../../log/vizdoc.log', __FILE__), 'a')

  @logger = ActiveSupport::BufferedLogger.new("/tmp/vizdoc.log")
  @logger.level = Logger::INFO
  @logger.info "VizDoc Logger Initialized!"

  @bindings_map = {}
  @active_record_public_functions = [:find, :first, :first!, :last, :last!, :all, :first_or_create, :first_or_create!, :first_or_initialize, :destroy, :destroy_all, :delete, :delete_all, :update, :update_all, :find_each, :find_in_batches, :select, :group, :order, :except, :limit, :offset, :joins, :where, :includes, :create_with, :uniq, :count, :average, :minimum, :maximum, :sum, :calculate, :pluck, :find_by_sql, :create, :new]

  class << self
    attr_accessor :logger, :bindings_map, :active_record_public_functions
  end

  files = Dir["app/**/*.rb"]
  files = files.map {|f| f.gsub(/app\/[a-zA-Z]*\//,"")}
  files = files.map {|f| f.gsub(/\.rb/,"")}

  classes = files.reduce([]) do |acc, f|
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

  classes.push("ActiveRecord::Querying")

  set_trace_func proc { |event, file, line, id, binding, classname|
    begin
      if ['call', 'return'].include?(event) and classes.include?(classname.name)


        #if VizDoc.bindings_map[classname.to_s].nil?
        VizDoc.bindings_map[classname.to_s] = (classname.methods(false) + classname.instance_methods(false) - ActiveRecord::Base.methods + VizDoc.active_record_public_functions).reject { |x| x.to_s =~ /(after|before|autosave|validate|_one|_run)_/}
        #end

        allowed_bindings = VizDoc.bindings_map[classname.to_s]

        if allowed_bindings.include?(id)
          VizDoc.logger.info(sprintf "%8s %s:%-2d %10s %8s\n", event, file, line, id, classname )
        else
          # VizDoc.logger.info("not found : #{id}")
        end
      end
    rescue Exception => e
      # VizDoc.logger.error(sprintf "%s %s %s", e.message, event, id)
    end
  }

end
