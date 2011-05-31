module PcomponentsHelper
  
   def get_scores(type, pcomponent)

      if type == '2'
        [
          content_tag(:div, 'Requiriment: '+pcomponent.get_requirements_score , :class => 'requirement-score'),
          content_tag(:div, 'Score: '+ pcomponent.get_questions_score.to_s, :class => 'question-score')
        ].join(' ').html_safe
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

end
