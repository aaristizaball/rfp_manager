module PcomponentsHelper
  
  def get_requirements_aproved(type, pcomponent)
      if type == '2'
          if !pcomponent.requirements_aproved.nil?
           content_tag(:div, 'Requiriment: '+pcomponent.requirements_aproved.to_s, :class => 'requirement-score')
          end
      end
   end
  
   def get_questions_score(type, pcomponent)
      if type == '2'
          if !pcomponent.questions_score.nil?
            content_tag(:div, 'Score: '+ "%.2f"%(pcomponent.questions_score.to_s), :class => 'question-score')
          end
      end
   end
   
    
   
   def get_comments(type, pcomponent)
      
     if type == '2'
         content_tag :div, :class => "comments" do
             [ (
               comments = pcomponent.get_requirements_comments
               if !comments.empty?
                  [content_tag(:h5, "Requirements comments"),
                  (
                   content_tag :ul, :class => "requirements-comment" do
                        comments.each do |c|
                          concat(content_tag(:li, c))
                        end
                   end
                  )].join(' ').html_safe 
               end),
               (
               comments = pcomponent.get_questions_comments
               if !comments.empty?
                  [content_tag(:h5, "Questions comments"),
                  (
                   content_tag :ul, :class => "questions-comment" do
                        comments.each do |c|
                          concat(content_tag(:li, c))
                        end
                   end
                  )].join(' ').html_safe 
               end)
             ].join(' ').html_safe 
         end
     end
   end
   
   def get_sugestions(type, pcomponent)
     if type == '2'
         content_tag :div, :class => "comments" do
           
             sugestions = pcomponent.get_sugestions
             if !sugestions.empty?
                [content_tag(:h5, "sugestions"),
                (
                 content_tag :ul, :class => "questions-sugestion" do
                      !sugestions.each do |c|
                        concat(content_tag(:li, c.title))
                      end
                 end
                )].join(' ').html_safe 
             end
         end
     end
   end
   
   def check_dates(pcomponent)
       if Date.today > pcomponent.project.due_date
         if pcomponent.chief_reminded == false
           
            if(pcomponent.user != nil)
             UserMailer.reminder_chief(pcomponent.user).deliver
             pcomponent.chief_reminded = true
           end
           pcomponent.status_id = 5
           pcomponent.save
          elsif pcomponent.reminded == false
             if(pcomponent.user != nil)
               UserMailer.reminder(pcomponent.user).deliver
               pcomponent.reminded = true
              pcomponent.save
             end
          end
        elsif pcomponent.project.due_date + 1.day == Date.today
          if pcomponent.reminded == false
            if(pcomponent.user != nil)
               UserMailer.reminder(pcomponent.user).deliver
               pcomponent.reminded = true
               pcomponent.save
             end
            
          end
        end
   end

end
