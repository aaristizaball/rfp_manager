# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

[{:title => 'Unassigned', :position => 1},
  {:title => 'In Requirements', :position => 2},
  {:title => 'In Questions', :position => 3},
  {:title => 'Completed', :position => 4},
  {:title => 'Overdue', :position => 5}
  ].each do |attributes|
    Status.find_or_create_by_title(attributes)
  end
  
  [{:title => 'Low', :value => 1},
  {:title => 'Medium', :value => 2},
  {:title => 'High', :value => 3}
  ].each do |attributes|
    Impact.find_or_create_by_title(attributes)
  end

[
  {:title => 'Technical'},
  {:title => 'Financial'},
  {:title => 'Security'},
  {:title => 'Legal'}, 
  {:title => 'Time'},
  {:title => 'Methodology'}
].each do |attributes|
  Component.find_or_create_by_title(attributes)
end

[
  {:title => 'Nivel de conocimientos internos?', :component_id => 1, :impact_id => 3},
  {:title => 'Que experiencia tiene en el negocio', :component_id => 1, :impact_id => 3},
  {:title => 'Nivel de herramientas disponible?', :component_id => 1, :impact_id => 3},
  
  {:title => 'Margen de utilidad de la migracion? ', :component_id => 2, :impact_id => 3},
  {:title => 'Capital para la migracion? ', :component_id => 2, :impact_id => 2},
  
  {:title => 'Que nivel de confidencialidad podemos proporcionar?', :component_id => 3, :impact_id => 2},
  
  {:title => 'Nivel de formalidad del contrato?', :component_id => 4, :impact_id => 2},
  {:title => 'Supuestos definidos y claros?', :component_id => 4, :impact_id => 2},
  {:title => 'Reglas del cliente acorde a la filosofia de la empresa?', :component_id => 4, :impact_id => 1},
  
  {:title => 'Probabilidad de cumplir con las fechas de entrega?', :component_id => 5 , :impact_id => 2},
  {:title => 'Tiempos de soporte adecuados?', :component_id => 5, :impact_id => 2},  
  
  {:title => 'Nivel de madurez de la metodoligia en el equipo de trabajo?', :component_id => 6, :impact_id => 2},
  {:title => 'Que tan reconocida es la metodologia utilizada en el medio', :component_id => 6, :impact_id => 1}
  
].each do |att|
  Question.find_or_create_by_title(att)
end

[
  {:title => 'Cumple con los conocimientos tecnicos exigidos?', :component_id => 1},
  {:title => 'Cuenta con el equipo de trabajo requerido?', :component_id => 1},
  
  {:title => 'Nivel de conocimientos internos?', :component_id => 2},
  {:title => 'Nivel de conocimientos internos?', :component_id => 2},
  
  {:title => 'Nivel de conocimientos internos?', :component_id => 3},
  {:title => 'Nivel de conocimientos internos?', :component_id => 3},
  
  {:title => 'Nivel de conocimientos internos?', :component_id => 4},
  {:title => 'Nivel de conocimientos internos?', :component_id => 4},
  
  {:title => 'Nivel de conocimientos internos?', :component_id => 5},
  {:title => 'Nivel de conocimientos internos?', :component_id => 5},
  
  {:title => 'Nivel de conocimientos internos?', :component_id => 6},
  {:title => 'Nivel de conocimientos internos?', :component_id => 6},
  
].each do |att|
  Requirement.find_or_create_by_title(att);
end

