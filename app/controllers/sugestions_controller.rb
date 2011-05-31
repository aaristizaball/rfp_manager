class SugestionsController < ApplicationController
  # GET /sugestions
  # GET /sugestions.xml
  def index
    @sugestions = Sugestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sugestions }
    end
  end

  # GET /sugestions/1
  # GET /sugestions/1.xml
  def show
    @sugestion = Sugestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sugestion }
    end
  end

  # GET /sugestions/new
  # GET /sugestions/new.xml
  def new
    @sugestion = Sugestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sugestion }
    end
  end

  # GET /sugestions/1/edit
  def edit
    @sugestion = Sugestion.find(params[:id])
  end

  # POST /sugestions
  # POST /sugestions.xml
  def create
    @sugestion = Sugestion.new(params[:sugestion])

    respond_to do |format|
      if @sugestion.save
        format.html { redirect_to(@sugestion, :notice => 'Sugestion was successfully created.') }
        format.xml  { render :xml => @sugestion, :status => :created, :location => @sugestion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sugestion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sugestions/1
  # PUT /sugestions/1.xml
  def update
    @sugestion = Sugestion.find(params[:id])

    respond_to do |format|
      if @sugestion.update_attributes(params[:sugestion])
        format.html { redirect_to(@sugestion, :notice => 'Sugestion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sugestion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sugestions/1
  # DELETE /sugestions/1.xml
  def destroy
    @sugestion = Sugestion.find(params[:id])
    @sugestion.destroy

    respond_to do |format|
      format.html { redirect_to(sugestions_url) }
      format.xml  { head :ok }
    end
  end
end
