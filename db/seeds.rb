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
  {:title => 'Preste especial atencion a las actividades de la ruta critica', :component_id => 5},
  {:title => 'Recuerde brindar capacitacion necesario a los integrantes del equipo', :component_id => 1},
  {:title => 'Recuerde discutir los supuestos con el cliente', :component_id => 4},
  {:title => 'Solicitar la revision del contrato', :component_id => 4},
  {:title => 'Revisar la estimacion de tiempos', :component_id => 5}
  
].each do |att|
  Sugestion.find_or_create_by_title(att)
end


[
  {:title => 'Nivel de conocimientos internos?', :component_id => 1, :impact_id => 3, :sugestion_id => 2},
  {:title => 'Que experiencia tiene en el negocio', :component_id => 1, :impact_id => 3, :sugestion_id => 2},
  {:title => 'Nivel de herramientas disponible?', :component_id => 1, :impact_id => 3},
  
  {:title => 'Margen de utilidad de la migracion? ', :component_id => 2, :impact_id => 3, :sugestion_id => 1},
  {:title => 'Capital para la migracion? ', :component_id => 2, :impact_id => 2},
  
  {:title => 'Que nivel de confidencialidad podemos proporcionar?', :component_id => 3, :impact_id => 2},
  
  {:title => 'Nivel de formalidad del contrato?', :component_id => 4, :impact_id => 2, :sugestion_id => 4},
  {:title => 'Supuestos definidos y claros?', :component_id => 4, :impact_id => 2, :sugestion_id => 3},
  {:title => 'Reglas del cliente acorde a la filosofia de la empresa?', :component_id => 4, :impact_id => 1},
  
  {:title => 'Probabilidad de cumplir con las fechas de entrega?', :component_id => 5 , :impact_id => 2, :sugestion_id => 5},
  {:title => 'Tiempos de soporte adecuados?', :component_id => 5, :impact_id => 2},  
  
  {:title => 'Nivel de madurez de la metodoligia en el equipo de trabajo?', :component_id => 6, :impact_id => 2},
  {:title => 'Que tan reconocida es la metodologia utilizada en el medio', :component_id => 6, :impact_id => 1}
  
].each do |att|
  Question.find_or_create_by_title(att)
end

[
  {:title => 'Cumple con los conocimientos tecnicos exigidos?', :component_id => 1},
  {:title => 'Cuenta con el equipo de trabajo requerido?', :component_id => 1},
  {:title => 'Cuenta con las certificaciones requeridas?', :component_id => 1},
  
  {:title => 'Cuenta con el suficiente capital para afrontar la migracion?', :component_id => 2},
  {:title => 'Puede usted asumir sobrecosto por la no entrega a tiempo de la migracion?', :component_id => 2},
  
  {:title => 'Cuenta con los estandares de seguridad exigidos?', :component_id => 3},
  {:title => 'Puede garantizar la confidencialidad de los datos?', :component_id => 3},
  
  {:title => 'Esta la empresa legalmente constituida en colombia?', :component_id => 4},
  {:title => 'Las herramientas de trabajo a utilizar estan legalizadas?', :component_id => 4},
  {:title => 'Los datos a migrar estan libres de compromiso con la justicia?', :component_id => 4},
  
  {:title => 'Esta de acuerdo con el tiempo de entrega propuesto?', :component_id => 5},
  
  {:title => 'Conoce usted la metodologia de trabajo exigida por el cliente?', :component_id => 6},
  
].each do |att|
  Requirement.find_or_create_by_title(att);
end

