class UsersController < ApplicationController

  skip_before_action :check_for_logged_in, only: [:new, :create]
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save

      session[:user_id] = @user.id
      redirect_to teachers_path
    else
      render "new"
    end
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
