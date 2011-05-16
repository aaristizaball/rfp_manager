class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.authenticate(params[:session][:name], params[:session][:password])
    
    if user
      sign_in user
      flash[:success] = "Successfuly signed in."
      redirect_back_or :projects
    elsif
      flash.now[:error] = "Invalid Name/Password combination."
      render :new
    end
  end

end
