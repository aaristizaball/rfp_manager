class Question < ActiveRecord::Base
  
  belongs_to :component
  belongs_to :impact
  belongs_to :sugestion
  has_many :pquestions
end
