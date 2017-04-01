desc "This task is called by the Heroku scheduler add-on"

task :send_email => :environment do
  PlantMailer.new_plant(@plant).deliver
end
