desc "This task is called by the Heroku scheduler add-on"

task :send_email => :environment do
  .send_email
end
