class JobsController < ApplicationController
    before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
  @job = Job.new(params[:job])
  @job.save
  redirect_to job_path(@job)
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path(@job)
    else
      render :new
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path(@job)
  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:role, :location, :rate, :contract, :rate, :sector)
  end
end
