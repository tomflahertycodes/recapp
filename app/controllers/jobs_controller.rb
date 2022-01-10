class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.save
    if @job.save
      redirect_to jobs_path(@job)
    else
      render :new
    end
  end

  private

  def job_params
    params.require(:job).permit(:role, :location, :rate, :contract, :sector)
  end
end
