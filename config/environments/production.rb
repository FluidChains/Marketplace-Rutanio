Rails.application.configure do
  # Settings specified here will take precedence over those in config/applicati$

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in either ENV["RAILS_MAST$
  # or in config/master.key. This key is used to decrypt credentials (and other$
  # config.require_master_key = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress CSS using a preprocessor.
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Store uploaded files on the local file system (see config/storage.yml for o$
  config.active_storage.service = :cloudinary_production

  # Mount Action Cable outside main process or domain.
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http$

  # Force all access to the app over SSL, use Strict-Transport-Security, and us$
  # config.force_ssl = true

  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false

 # Ignore bad email addresses and do not raise email delivery errors.
 # Set this to true and configure the email server for immediate delivery to r$
 # config.action_mailer.raise_delivery_errors = false

 # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
 # the I18n.default_locale when a translation cannot be found).
 config.i18n.fallbacks = true

 # Send deprecation notices to registered listeners.
 config.active_support.deprecation = :notify

 # Use default logging formatter so that PID and timestamp are not suppressed.
 config.log_formatter = ::Logger::Formatter.new


   if ENV["RAILS_LOG_TO_STDOUT"].present?
     logger           = ActiveSupport::Logger.new(STDOUT)
     logger.formatter = config.log_formatter
     config.logger    = ActiveSupport::TaggedLogging.new(logger)
   end
   ActionMailer::Base.smtp_settings = {
      :domain => 'https://marketplace.rutanio.com',

   }

     config.action_mailer.delivery_method = :smtp
     config.action_mailer.default_url_options = { :host => 'marketplace.rutanio.com' }


   config.active_record.dump_schema_after_migration = false


end
