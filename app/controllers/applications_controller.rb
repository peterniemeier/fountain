class ApplicationsController < ApplicationController
  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to jobs_url
      else
      flash[:errors] = @job.errors.full_messages
      redirect_to jobs_url
    end
  end
  
  def application_params
    params.require(:application).permit(:user_id, :job_id)
  end
end
