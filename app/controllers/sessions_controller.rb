class SessionsController < ApplicationController
    skip_before_action :auth_user

  def new

  end

  def create
  	if login(params[:email], params[:password])
      flash[:notice] = "sign in succeed!"
  		redirect_to root_path
  	else
      flash[:notice] = "sign in failed!"
  		redirect_to new_session_path
  	end
  end

  def destroy
  	logout
    flash[:notice] = "sign out succeed!"
  	redirect_to root_path
  end
end
