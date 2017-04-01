web: bundle exec puma start -p $PORT $RAILS_ENV -C config/puma.rb
web: bundle exec thin start -p $PORT
worker: bundle exec sidekiq -e production -c 3
