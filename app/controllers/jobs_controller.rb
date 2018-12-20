class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_url
      else
      flash[:errors] = @job.errors.full_messages
      redirect_to jobs_url
    end
  end

  def job_params
    params.require(:job).permit(:title, :description, :employer_id)
  end
end
