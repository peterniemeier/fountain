class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to jobs_url
      else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  def user_params
    params.require(:user).permit(:username, :email, :password, :type)
  end
end
