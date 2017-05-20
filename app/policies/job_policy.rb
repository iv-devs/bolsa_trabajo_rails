class JobPolicy
	attr_reader :current_user, :job

  def initialize(current_user, job)
    @current_user = current_user
    @job = job
  end

  def index?
  		current_user.admin?
  end

  def update? 
    @job.company.id == @current_company.id
  end

  def destroy?
     @job.company.id
  end

end