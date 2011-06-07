class Sugestion < ActiveRecord::Base
  belongs_to :component
  
  validates :title, :presence =>true
  validates :component_id, :presence =>true
end
