class Admin::AdminController < ActionController::Base
	before_action :admin_login
	layout 'admin/layouts/admin_application'

	private
  def admin_login
  	unless logged_in? && current_user.is_admin?
  		redirect_to new_admin_session_path
  	end
  end
end
