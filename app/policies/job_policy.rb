class JobPolicy
	attr_reader :current_company, :job

  def initialize(current_company, job)
    @current_company = current_company
    @job = job
  end

  def index?
  		current_user.admin?
  end

  def update?
  		@current_user.admin? || @current_company == @job.company_id
  end
  

  def destroy?
  		@current_user.admin? || @current_company == @job.company_id
  end

end