class Question < ActiveRecord::Base
  
  belongs_to :component
  belongs_to :impact
  belongs_to :sugestion
  has_many :pquestions, :dependent => :destroy
  
  validates :title, :presence =>true
  validates :component_id, :presence =>true
  validates :impact_id, :presence =>true
  #validates :sugestion_id, :presence =>true
end
