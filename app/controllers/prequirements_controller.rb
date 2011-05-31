class PrequirementsController < ApplicationController
  
   respond_to :html, :xml
   
  def index
    @prequirements = Prequirement.paginate(:conditions => ["project_id = #{params[:project_id]}"], :page => params[:page],
    :joins => " inner join requirements on prequirements.requirement_id = requirements.id  and requirements.component_id = #{params[:component_id]}")    
    
    respond_with @prequirements
  end
   
  def edit
    @prequirement = Prequirement.find(params[:id])

    respond_with @prequirement
  end
  
   def update
    @prequirement = Prequirement.find(params[:id])

    update_was_successful = @prequirement.update_attributes(params[:prequirement])

    respond_with @prequirement do |format|
      format.html {
        if update_was_successful
          redirect_to(prequirements_path(:project_id =>@prequirement.project, :component_id => @prequirement.requirement.component), :notice => 'The update was succesfull')
        else
          render "edit"
        end
      }
    end
  end

end