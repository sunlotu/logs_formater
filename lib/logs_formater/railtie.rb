require 'rails/railtie'
require 'logs_formater/bomb'
module LogsFormater
  class Railtie < Rails::Railtie
    config.logs_formater = ActiveSupport::OrderedOptions.new
    config.logs_formater.enable = true
    # config.app_middleware.use LogsFormater::Bomb

    initializer "test second" do
      p 'second'
    end

    initializer "test first", :before => "test second" do
      p 'first'
    end

    initializer "config.middleware" do |app|
      app.middleware.use LogsFormater::Bomb
    end

    rake_tasks do
      load 'tasks/logs_formater.rake'
    end

  end
end