class PquestionsController < ApplicationController
  
   respond_to :html, :xml
   
  def index
    @questions = Pquestion.paginate(:conditions => ["project_id = #{params[:project_id]}"], :page => params[:page],
    :joins => " inner join questions on pquestions.question_id = questions.id  and questions.component_id = #{params[:component_id]}")
    
    respond_with @questions
  end
   
  def edit
    @pquestion = Pquestion.find(params[:id])

    respond_with @pquestion
  end
  
   def update
     
    @pquestion = Pquestion.find(params[:id])

    update_was_successful = @pquestion.update_attributes(params[:pquestion])
        
    respond_with @pquestion do |format|
      format.html {
      
        if update_was_successful
          redirect_to(pquestions_path(:project_id =>@pquestion.project, :component_id => @pquestion.question.component), :notice => 'The update was succesfull')
        else
          render "edit"
        end
      }
    end
  end
  
  def rate
    
    @pquestion = Pquestion.find(params[:id])
    @pquestion.rate(params[:stars], @pquestion, params[:dimension])
    
    pqs = @pquestion.project.pquestions.joins(:question).where(:questions =>{:component_id => @pquestion.question.component_id})
 
    
    countPQS = 0
    questions_score = 0.0
    cont = 0
    
    pqs.each do |pq|
      if (pq.rates.count > 0)
        countPQS = countPQS + 1
        impact = pq.question.impact.value
        questions_score += pq.rates[0].stars * impact
        cont += impact
      end
    end
    
    if (countPQS == pqs.count)
      pc = @pquestion.project.pcomponents.where(:component_id => @pquestion.question.component_id)
      pc[0].status_id = pc[0].status_id + 1
      pc[0].questions_finished = true
      pc[0].questions_score = (questions_score/cont)
      pc[0].save
      @pquestion.project.did_finish
    end
      
    render :update do |page|
      page.replace_html @pquestion.wrapper_dom_id(params), ratings_for(@pquestion, params.merge(:wrap => true))
      page.visual_effect :highlight, @pquestion.wrapper_dom_id(params)
    end
      
 end
end
