class JobsController < ApplicationController
  before_action :authenticate_company!, except: [:show]
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = current_company.jobs
  end

  # GET /jobs/1
  def show

  end

  # GET /jobs/new
  def new
    @job = current_company.jobs.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  def create
    @job = current_company.jobs.new(job_params)
    
    if verify_recaptcha(model: @job) && @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /jobs/1
  def update
    authorize @job
    if @job.update(job_params)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /jobs/1
  def destroy
    authorize @job
    @job.destroy
    redirect_to root_url, notice: 'Job was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:title, :job_type, :salary, :salary_type, :description, :publish_job, :location_job, :salary_negotiable)
    end
end
