class Project < ActiveRecord::Base
  
  has_many :pcomponents, :dependent => :destroy
  
end
