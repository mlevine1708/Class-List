class SessionsController < ApplicationController

  skip_before_action :check_for_logged_in, only: [:home, :new, :create, :fbcreate]
  def new
    @user = User.new
    render :login
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to teachers_path
    else
      flash[:error] = "Sorry, your username or password was incorrect"
      redirect_to '/login'
    end
  end

  #omniauth login
  def fbcreate
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = auth['uid']
    end

    session[:user_id] = @user.id

    redirect_to teachers_path
  end

  def home
  end

  #logout
  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
