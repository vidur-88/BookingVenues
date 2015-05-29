module VizDoc
  @logfile = File.open(File.expand_path('../../../log/vizdoc.log', __FILE__), 'a')

  @logger = ActiveSupport::BufferedLogger.new("/tmp/vizdoc.log")
  @logger.level = Logger::INFO
  @logger.info "VizDoc Logger Initialized!"

  @bindings_map = {}

  class << self
    attr_accessor :logger, :bindings_map, :debug
  end

  files = Dir["app/**/*.rb"]
  classes = files.reduce([]) do |acc, f|
    # "app/controllers/application_controller.rb" => "application_controller"
    only_file_name = f.split('/').last[0..-4]

    # application_controller => ApplicationController
    acc << only_file_name.split('_').map{|o| o.capitalize}.join
  end

  set_trace_func proc { |event, file, line, id, binding, classname|
    begin
      if ['call', 'return'].include?(event) and classes.include?(classname.name.split("::").first)


        #if VizDoc.bindings_map[classname.to_s].nil?
          VizDoc.bindings_map[classname.to_s] = (classname.methods(false) + classname.instance_methods(false) - ActiveRecord::Base.methods).reject { |x| x.to_s =~ /(after|before|autosave|validate|_one|_run)_/}
        #end

        allowed_bindings = VizDoc.bindings_map[classname.to_s]

        if allowed_bindings.include?(id)
          VizDoc.logger.info(sprintf "%8s %s:%-2d %10s %8s\n", event, file, line, id, classname )
        end
      end
    rescue Exception => e
      # VizDoc.logger.error(e.message)
    end
  }

end
