namespace :app do
  
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)"
    end
  end


  desc "restart DB"
  task :reset => ["db:drop", "db:create", "db:migrate", "db:seed", "app:populate"]

  desc "Populate de database with development data"
  task :populate => :environment do
    [
       {:email =>'aaristizaball@gmail.com', :name => 'alejandro', :password => 'alejandro'},
       {:name => 'ernesto', :password => 'ernesto', :email =>'ecarrion@gmail.com'},
       {:name => 'manager', :password => 'manager', :email =>'aaristizaball@gmail.com'},
       {:name => 'developer', :password => 'developer', :email =>'ecarrion@gmail.com'}
     ].each do |attributes|
       User.find_or_create_by_name(attributes)
    end
    
  end

end
