class PostulationPolicy
	attr_reader :current_user, :job

  def initialize(current_user, job)
    @current_user = current_user
    @job = job
  end

  def index?
  		current_user.admin?
  end

  def update?
  		@current_user.admin? || @current_user == @job.company_id
  end
  

  def destroy?
  		@current_user.admin? || @current_user == @job.company_id
  end
end