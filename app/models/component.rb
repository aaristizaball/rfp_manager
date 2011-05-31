class Component < ActiveRecord::Base
  
    def humanize
      self.title
    end
end
