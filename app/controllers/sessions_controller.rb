class SessionsController < ApplicationController
    skip_before_action :auth_user

  def new

  end

  def create
  	if login(params[:email], params[:password])
  		redirect_to root_path
  	else
  		redirect_to new_session_path
  	end
  end

  def destroy
  	logout
  	redirect_to root_path
  end
end
