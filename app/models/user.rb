class User < ActiveRecord::Base
  
  #has_many :project_component
  
  attr_accessible :name, :password
  
  def self.authenticate (submitted_name, submitted_passwd)
    auth_user = User.find_by_name(submitted_name)
    return nil if auth_user.nil?
    return auth_user if submitted_passwd == auth_user.password
  end
  
  
  
end
