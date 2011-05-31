class Business < ActiveRecord::Base

  def self.get_worst_requirements
    requirements = Array.new
    rq = Prequirement.group(:requirement_id, :state).where(:state =>[0]).order("1 DESC").count
    rq.each_key do |key|
       requirement_id = key[0]
       pr = Prequirement.where("requirement_id = #{requirement_id} and comment is not null and comment != ''").order("updated_at DESC")
       comments = Array.new
       cont = 0
       pr.each do |p|
         if cont < 5 
            comments << p.comment
            cont = cont + 1
         end
       end
       requirements << [Requirement.find(requirement_id).title, comments]
    end
     return requirements
  end
  
end
