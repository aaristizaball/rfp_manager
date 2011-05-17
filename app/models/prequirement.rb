class Prequirement < ActiveRecord::Base
  
  belongs_to :requirement
  belongs_to :project
  
end
