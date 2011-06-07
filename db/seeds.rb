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
  {:title => 'Financial'}#,
  #{:title => 'Technical'},
  #{:title => 'Law'}
].each do |attributes|
  Component.find_or_create_by_title(attributes)
end

