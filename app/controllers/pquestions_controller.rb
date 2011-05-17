class PquestionsController < ApplicationController
  
   respond_to :html, :xml
   
  def edit
    @pcomponent = Pcomponent.find(params[:id])

    respond_with @pcomponent
  end
  
   def update
    @pcomponent = Pcomponent.find(params[:id])

    update_was_successful = @pcomponent.update_attributes(params[:pcomponent])

    respond_with @pcomponent do |format|
      format.html {
        if update_was_successful
          redirect_to(project_path(@pcomponent.project), :notice => 'The update was succesfull')
          @pcomponent.status_id = @pcomponent.status_id + 1
          @pcomponent.save
        else
          render "edit"
        end
      }
    end
  end
end