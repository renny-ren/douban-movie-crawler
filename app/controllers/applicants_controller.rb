class ApplicantsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = 'Successfully registered.'
      redirect_to new_sessions_path
    else
      redirect_to new_applicant_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
