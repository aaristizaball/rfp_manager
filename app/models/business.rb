class Business < ActiveRecord::Base

  def get_worst_requirements
    requirements = Array.new
    rq = Prequirement.group(:requirement_id, :state).where(:state =>[0]).order("1 DESC").count
    rq.each_key do |key| 
       requirements << Requirement.find(key[0]).title
    end
     requirements
  end
  
end
