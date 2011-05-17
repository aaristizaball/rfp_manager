class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.xml
  
  respond_to :html, :xml
  def index
    @projects = Project.paginate :page => params[:page]
    respond_with @projects
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_with @project
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_with @project
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
    
    new_was_successful = @project.save

      respond_with(@project) do |format|
        format.html {
          if new_was_successful
            components = Component.all
            components.each do |c|
              pc = Pcomponent.new
              pc.project = @project
              pc.component = c
              pc.save
            end
            
            questions = Question.all
            questions.each do |q|
              pq = Pquestion.new
              pq.project = @project
              pq.question = q
              pq.save
            end
            
            
            requirements = Requirement.all
            requirements.each do |r|
              pr = Prequirement.new
              pr.project = @project
              pr.requirement = r
              pr.save
            end
            
            redirect_to(project_path(@project), :notice => "The project was successfully created")
          else
            render 'new'
          end
        }
      end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])
    
     updated_was_successful = @project.update_attributes(params[:project])

      respond_with(@project) do |format|
        format.html {
          if updated_was_successful
            redirect_to(project_path(@project), :notice => "The project was successfully updated")
          else
            render 'edit'
          end
        }
      end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_with @project
  end
end
