web: bundle exec puma start -p $PORT $RAILS_ENV -C config/puma.rb
worker: bundle exec sidekiq -C config/sidekiq.yml -e production
