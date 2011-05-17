class Project < ActiveRecord::Base
  
  has_many :pcomponents, :dependent => :destroy
  has_many :pquestions, :dependent => :destroy
  
  cattr_reader :per_page
  @@per_page = 1 #It's the number of projects for page
end
