class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "role ILIKE :query OR location ILIKE :query"
      @jobs = Job.where(sql_query, query: "%#{params[:query]}%")
    else
      @jobs = Job.all
    end
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    @job.save!
    redirect_to jobs_path(@job)
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
    params.require(:job).permit(:role, :location, :rate, :contract, :sector)
  end
end
