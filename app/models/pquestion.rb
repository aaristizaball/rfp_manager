class Pquestion < ActiveRecord::Base
  
  belongs_to :question
  belongs_to :project
end
