# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'
config.gem 'redis'
# Initialize the Rails application.
Rails.application.initialize!
