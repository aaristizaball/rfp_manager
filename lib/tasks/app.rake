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
       {:email =>'aaristizaball@gmail.com', :name => 'alejandro', :password => 'alejandro'},
       {:name => 'ernesto', :password => 'ernesto', :email =>'ecarrion@gmail.com'},
       {:name => 'manager', :password => 'manager', :email =>'aaristizaball@gmail.com'},
       {:name => 'developer', :password => 'developer', :email =>'ecarrion@gmail.com'}
     ].each do |attributes|
       User.find_or_create_by_name(attributes)
    end
    
     [
       {:title => 'Sugestion 1', :component_id => 1},
       {:title => 'Sugestion 2', :component_id => 1},
       {:title => 'Sugestion 3', :component_id => 2},
       {:title => 'Sugestion 4', :component_id => 2},
     ].each do |attributes|
       Sugestion.find_or_create_by_title(attributes)
    end
    
    [
       {:title => 'Pregunta 1?', :component_id => 1, :impact_id => 1, :sugestion_id => 1},
       {:title => 'Pregunta 2?', :component_id => 1, :impact_id => 2, :sugestion_id => 2},
       {:title => 'Pregunta 3?', :component_id => 2, :impact_id => 3, :sugestion_id => 3},
       {:title => 'Pregunta 4?', :component_id => 2, :impact_id => 2, :sugestion_id => 4},
       {:title => 'Pregunta 5?', :component_id => 3, :impact_id => 2, :sugestion_id => 4},
     ].each do |attributes|
       Question.find_or_create_by_title(attributes)
    end
    
     [
       {:title => 'Requerimiento 1', :component_id => 1},
       {:title => 'Requerimiento 2', :component_id => 1},
       {:title => 'Requerimiento 3', :component_id => 2},
       {:title => 'Requerimiento 4', :component_id => 2},
       {:title => 'Requerimiento 5', :component_id => 3},
     ].each do |attributes|
       Requirement.find_or_create_by_title(attributes)
    end
    
    
    
  end

end
