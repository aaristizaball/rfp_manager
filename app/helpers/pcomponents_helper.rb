module PcomponentsHelper
  
   def ger_scores(type, pcomponent)

      if type == '2'
        [
          content_tag(:div, 'Requiriment: '+pcomponent.get_requirements_score , :class => 'requirement-score'),
          content_tag(:div, 'Score: '+ pcomponent.get_questions_score.to_s, :class => 'question-score')
        ].join(' ').html_safe
      end
   end
   
   def ger_comments(type, pcomponent)
      
     if type == '2'
         content_tag :div, :class => "comments" do
           
             [ (
               comments = pcomponent.get_requirements_comments
               if !comments.empty?
                  [content_tag(:h5, "Requirements comments"),
                  (
                   content_tag :ul, :class => "requirements-comments" do
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
                   content_tag :ul, :class => "questions-comments" do
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

end
