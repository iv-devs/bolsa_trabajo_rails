class PostulationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_postulation, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /postulations
  def index
    @postulations = current_user.postulations.all
  end

  # GET /postulations/1
  def show
  end

  # GET /postulations/new
  def new
    @postulation = current_user.postulations.new
  end

  # GET /postulations/1/edit
  def edit
  end

  # POST /postulations
  def create
    @postulation = current_user.postulations.new(postulation_params)

    if @postulation.save
      redirect_to @postulation, notice: 'Postulation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /postulations/1
  def update
    if @postulation.update(postulation_params)
      redirect_to @postulation, notice: 'Postulation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /postulations/1
  def destroy
    @postulation.destroy
    redirect_to postulations_url, notice: 'Postulation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulation
      @postulation = Postulation.find(params[:id])
    end

    def set_job
      @job = Job.friendly.find(params[:job_id])
    end

    # Only allow a trusted parameter "white list" through.
    def postulation_params
      params.require(:postulation).permit(:user_id, :job_id, :professional_profile, :academic_profile, :interest)
    end
end
