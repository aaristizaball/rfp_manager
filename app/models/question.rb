class Question < ActiveRecord::Base
  
  belongs_to :component
  belongs_to :impact
end
