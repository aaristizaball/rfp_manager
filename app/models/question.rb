class Question < ActiveRecord::Base
  
  belongs_to :component
  belongs_to :impact
  has_many :pquestions
end
