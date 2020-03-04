source 'https://rubygems.org'


git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'foundation-rails'
gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'sidekiq'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'turbolinks'
gem 'faker'
gem 'carrierwave'
gem 'fog'
gem 'fog-aws'
gem 'sendgrid-ruby'
gem 'puma', '~> 3.12'
gem 'sinatra', github: 'sinatra/sinatra'
gem 'redis'
gem 'delayed_job_active_record'
gem 'daemons'
gem "dotenv-rails"
gem 'geocoder'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl'
  gem 'valid_attribute'
  gem 'shoulda-matchers', require: false
  gem "dotenv-rails"
end

group :test do
  gem 'coveralls', require: false
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'simplecov', :require => false, :group => :test
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
