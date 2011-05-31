class BusinessesController < ApplicationController
  
  respond_to :html, :xml
  
  def index
    @requirements = Business.get_worst_requirements
  end
end