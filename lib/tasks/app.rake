namespace :app do
  
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)"
    end
  end


  desc "restart DB"
  task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:seed", "app:populate"]

  desc "Populate de database with development data"
  task :populate => :environment do
    [
       {:name => 'alejandro', :password => 'alejandro'},
       {:name => 'ernesto', :password => 'ernesto'},
       {:name => 'manager', :password => 'manager'},
       {:name => 'developer', :password => 'developer'}
     ].each do |attributes|
       User.find_or_create_by_name(attributes)
    end
  end

end
