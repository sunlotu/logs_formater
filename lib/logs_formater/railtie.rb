require 'rails/railtie'
module LogsFormater
  class Railtie < Rails::Railtie
    config.logs_formater = ActiveSupport::OrderedOptions.new
    config.logs_formater.enable = true
    config.app_middleware.use LogsFormater::Bomb

    initializer "details parser second" do
      p 'second'
    end

    initializer "details parser first", :before => "details parser second" do
      p 'first'
    end

    rake_tasks do
      load 'tasks/details_parse.rake'
    end

  end
end