class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :auth_user

  def auth_user
  	unless logged_in?
  		redirect_to new_session_path
  	end
  end


end
