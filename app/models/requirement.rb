class Requirement < ActiveRecord::Base
  
   belongs_to :component
   has_many :prequirements
   
  validates :title, :presence =>true
  validates :component_id, :presence =>true

end
