class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:username] == 'admin' && params[:password] == 'admin' # 验证是否管理员登陆
      session[:admin] = true
      redirect_to pages_path
    else
      @user = User.authenticated?(params[:username], params[:password])
      if @user
        redirect_to pages_path
        flash[:notice] = "Welcome, #{@user.username}"
      else
        redirect_to new_sessions_path
        flash[:notice] = 'Invalid username or password!'
      end
    end
  end

  def destroy
    session.delete(:admin)
    redirect_to new_sessions_path
  end
end
