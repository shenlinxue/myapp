class Admin::SessionsController < Admin::AdminController
  skip_before_action :admin_login
  def new

  end

  def create
  	if login(params[:email], params[:password]) && current_user.is_admin?
      flash[:notice] = "登录成功！"
  		redirect_to admin_root_path
  	else
      logout
      flash[:notice]= "用户名或密码错误！"
  		redirect_to new_admin_session_path
  	end
  end

  def destroy
  	logout
  	redirect_to admin_root_path
  end
end
