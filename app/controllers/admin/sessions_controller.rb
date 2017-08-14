class Admin::SessionsController < Admin::AdminController
  skip_before_action :admin_login
  def new

  end

  def create
  	if login(params[:email], params[:password]) && current_user.is_admin?

  		redirect_to admin_root_path
  	else
      logout
  		redirect_to new_admin_session_path
  	end
  end

  def destroy
  	logout
  	redirect_to admin_root_path
  end
end
