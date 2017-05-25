class PostulationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_postulation, only: [:show, :edit, :update, :destroy]
  before_action :set_job
  before_action :postulacion, only: [:new, :create]

  # GET /postulations
  def index
    @postulations = current_user.postulations.all
  end

  # GET /postulations/1
  def show
  end

  # GET /postulations/new
  def new
    ultima_postulacion = current_user.postulations.last.dup
    @postulation = ultima_postulacion || current_user.postulations.new
  end

  # GET /postulations/1/edit
  def edit
  end

  # POST /postulations
  def create
    @postulation = @job.postulations.new(postulation_params)
    @postulation.user_id = current_user.id

    if @postulation.save
      #enviamos correo para informar de postulacion
      PostulationMailer.notification_postulation(current_user, @job).deliver_later
      redirect_to user_path(current_user.slug), notice: 'Postulation was successfully created.'
    else
      puts @postulation.errors.messages
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

    def postulacion
      job = Job.friendly.find(params[:job_id])
      if Postulation.exists?(job_id: job.id, user_id:current_user.id) 
        redirect_to user_path(current_user.slug), notice: 'Ya postulaste'
      end
    end

    # Only allow a trusted parameter "white list" through.
    def postulation_params
      params.require(:postulation).permit(:user_id, :job_id, :professional_profile, :academic_profile, :interest)
    end
end
