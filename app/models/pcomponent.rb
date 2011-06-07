class Pcomponent < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :component
  belongs_to :user
  belongs_to :status
  
  def get_requirements_score
    state = 'Yes'
    
    prequirements = self.project.prequirements.joins(:requirement).where(:requirements => {:component_id => self.component_id})
    

      prequirements.each do |r|
         if r.state == 0 && state != nil
           state = 'No'
         elsif r.state == nil
           state = '--'
         end
      end
    
    state
  end
  
  
  def get_questions_score
    total = 0.0
    cont = 0
     self.project.pquestions.joins(:question).where(:questions =>{:component_id => self.component_id}).each do |q|
       impact = q.question.impact.value
       qrate = 0.0
       if !q.rates.empty?
         qrate = q.rates[0].stars
         total += qrate * impact
         cont += impact
       end
       
     end
     if cont == 0
       score = '--'
     else
       score = total/cont
     end
     return score
  end
  
  def get_questions_comments
    comments = Array.new
    self.project.pquestions.joins(:question).where(:questions =>{:component_id => self.component_id}).each do |q|
      if q.comment != nil && q.comment != ''
        comments << q.comment
      end
    end
    return comments
  end
  
   def get_requirements_comments
    comments = Array.new
    self.project.prequirements.joins(:requirement).where(:requirements => {:component_id => self.component_id}).each do |r|
      if r.comment != nil && r.comment != ''
        comments << r.comment
      end
    end
    return comments
  end
  
  def get_sugestions
    sugestions = Array.new
    self.project.pquestions.joins(:question).where(:questions =>{:component_id => self.component_id}).each do |q|
       if !q.rates.empty?
         qrate = 0.0
         q.rates.each do |r|
           qrate += r.stars
         end
         if q.question.sugestion != nil && qrate < 3
            sugestions << q.question.sugestion
         end
       end
    end
    return sugestions
  end
  
end
