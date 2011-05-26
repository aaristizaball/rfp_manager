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
      render :update do |page|
        page.replace_html @pquestion.wrapper_dom_id(params), ratings_for(@pquestion, params.merge(:wrap => true))
        page.visual_effect :highlight, @pquestion.wrapper_dom_id(params)
      end
      
 end
end