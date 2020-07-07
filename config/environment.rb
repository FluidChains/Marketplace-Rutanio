# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :api_key =>   ENV['SENDGRID_API_KEY'] ,
  :domain => 'http://localhost:4000',
  :address => 'smtp.sendgrid.net',
  :port => 465,
  :authentication => :plain,
  :enable_starttls_auto => true
}
