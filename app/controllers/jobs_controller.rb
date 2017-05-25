class JobsController < ApplicationController
  before_action :authenticate_company!, except: [:show]
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :autorizacion, only: [:edit, :update]

  def index
    @jobs = current_company.jobs
  end


  def show

  end


  def new
    @job = current_company.jobs.new
  end


  def edit
  end


  def create
    @job = current_company.jobs.new(job_params)
    
    if verify_recaptcha(model: @job) && @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end


  def update
    if @job.update(job_params)
      redirect_to company_path(current_company.slug), notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    authorize @job
    @job.destroy
    redirect_to root_url, notice: 'Job was successfully destroyed.'
  end

  private

    def set_job
      @job = Job.includes(:tags).friendly.find(params[:id])
    end

    def autorizacion
      job = Job.friendly.find(params[:id])
      unless job.company == current_company 
        user_not_authorized
      end
    end

    def job_params
      params.require(:job).permit(:title, :job_type, :salary, :salary_type, :description, :publish_job, :location_job, :salary_negotiable, :category_job, :find_worker, :tag_ids => [])
    end
end
