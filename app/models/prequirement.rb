class Prequirement < ActiveRecord::Base
  
  belongs_to :requirement
  belongs_to :project
  
  cattr_reader :per_page
  @@per_page = 5 #It's the number of projects for page
  
end
