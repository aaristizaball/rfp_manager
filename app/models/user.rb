class User < ActiveRecord::Base
  
  #has_many :project_component
  
  attr_accessible :name, :password
  
  def self.authenticate (submitted_name, submitted_passwd)
    auth_user = User.find_by_name(submitted_name)
    return nil if auth_user.nil?
    return auth_user if submitted_passwd == auth_user.password
  end
  
  def self.from_remember_token(remembered_id, remembered_name)
    remembered_user = User.find_by_id(remembered_id)
    return nil if remembered_user.nil?
    return remembered_user if remembered_user.name = remembered_name
  end
  
end
