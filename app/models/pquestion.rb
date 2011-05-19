class Pquestion < ActiveRecord::Base
  
  belongs_to :question
  belongs_to :project
  
  ajaxful_rateable :stars => 5, :dimensions => [:calification], :allow_update => true
  cattr_reader :per_page
  @@per_page = 2 #It's the number of projects for page
  

end
