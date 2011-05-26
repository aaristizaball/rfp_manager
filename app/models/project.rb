class Project < ActiveRecord::Base
  
  has_many :pcomponents, :dependent => :destroy
  has_many :pquestions, :dependent => :destroy
  has_many :prequirements, :dependent => :destroy
  

  cattr_reader :per_page
  @@per_page =  2
end
