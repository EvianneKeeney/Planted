web: bundle exec puma start -p $PORT $RAILS_ENV -C config/puma.rb
worker: bundle exec sidekiq -q default -q mailers
