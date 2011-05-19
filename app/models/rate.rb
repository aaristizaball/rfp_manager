class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "Pquestion"
  belongs_to :rateable, :polymorphic => true
  
  attr_accessible :rate, :dimension
end
