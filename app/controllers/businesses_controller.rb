class BusinessesController < ApplicationController
  
  respond_to :html, :xml
  
  def index
    b = Business.new
    @requirements = b.get_worst_requirements
  end
end