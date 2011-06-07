class Project < ActiveRecord::Base
  
  has_many :pcomponents, :dependent => :destroy
  has_many :pquestions, :dependent => :destroy
  has_many :prequirements, :dependent => :destroy
  

  cattr_reader :per_page
  @@per_page =  2
  
  
  def did_finish
    components_finished = 0
    score = 0.0
    requirement_aproved = true
    
      self.pcomponents.each do |pc|
        if pc.questions_finished
           components_finished++
           score += pc.questions_score
        end
        if !pc.requirements_aproved
          requirement_aproved = false
        end
      end
      if pcomponents.count == components_finished
        score /= components
        if requirement_aproved && score >= 3.0
          self.state = 'Aproved'
        else
          self.state = 'Unaproved'
        end
      else
        self.state = 'In process'
      end
  end
end
