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
  @job = Job.new(params[:job])
  @job.save
  redirect_to job_path(@job)
  end

  private

  def job_params
    params.require(:job).permit(:role, :location, :rate, :contract, :rate, :sector)
  end
end
