require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the default gems, the ones in the
# current environment and also include :assets gems if in development
# or test environments.
Bundler.require(:default, Rails.env) if defined?(Bundler)
Bundler.require *Rails.groups(:assets) if defined?(Bundler)

module Portfolio
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Bern'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.fallbacks = [:'de-CH', :de, :en]
    config.i18n.default_locale = 'de-CH'

    # Configure generators values. Many other options are available, be sure to check the documentation.
    config.generators do |g|
      g.stylesheets false
      g.stylesheet_engine = :sass
    end

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Enable the asset pipeline
    config.assets.enabled = true
    # Google analytics middle ware.
    if Rails.env == "production"
      config.middleware.use("Rack::GoogleAnalytics", :web_property_id => 'UA-5470392-3') # Cause in the end the code is public viewble. I added it hardcoded.
    end
  end
end