class Impact < ActiveRecord::Base
  has_many :questions
  
  
  def humanize
    self.title
  end
end
