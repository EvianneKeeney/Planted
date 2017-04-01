require_relative 'boot'
require 'fog/aws'
require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module Planted
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_job.queue_adapter = :sidekiq
  end
end

Sidekiq.configure_server do |config|
  config.redis = {:url => url}
end

Sidekiq.configure_client do |config|
  config.redis = {:url => url, :size => 30}
end
