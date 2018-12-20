class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login(user)
      redirect_to jobs_url
    else
      flash.now[:errors] = ['Unable to create session']
      render :new
    end
  end

  def new
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
