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
    project = @prequirement.project


    prs = project.prequirements.joins(:requirement).where(:requirements =>{:component_id => @prequirement.requirement.component_id})
    
    countPRS = 0
    requirements_aproved = true
    
    prs.each do |pr|
      if (!pr.state.nil?)
        countPRS = countPRS + 1
         if pr.state == 0
           requirements_aproved = false
         end
      end
    end
    
    if (countPRS == prs.count)
      pc = project.pcomponents.where(:component_id => @prequirement.requirement.component_id)
      pc[0].status_id = pc[0].status_id + 1
      pc[0].requirements_finished = true
      pc[0].requirements_aproved = requirements_aproved
      pc[0].save
    end

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
