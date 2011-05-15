class Pcomponent < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :component
  belongs_to :user
  belongs_to :status
  
end
