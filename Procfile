web: bundle exec puma start -p $PORT $RAILS_ENV -C config/puma.rb
worker: bundle exec sidekiq -e production -c 3
worker: rake jobs:work
