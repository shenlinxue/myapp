class UsersController < ApplicationController
  skip_before_action :auth_user
  def new
  	@user = User.new

  end

  def create
  		@user = User.new(user_params)
  	if @user.save
      flash[:notice] = "create new user succeed!"
  		redirect_to new_session_path
  	else
      flash[:notice] = "create new user failed!"
  		render :new
  	end
  end


  private
  def user_params
  	params.require(:user).permit(:email,:password, :password_confirmation)
  end
end
