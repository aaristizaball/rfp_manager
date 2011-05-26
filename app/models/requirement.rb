class Requirement < ActiveRecord::Base
  
   belongs_to :component
   has_many :prequirementsr
end
