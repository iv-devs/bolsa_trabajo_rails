class CompanyPolicy
	attr_reader :current_company, :company

	def initialize(current_company, company)
		@current_company = current_company
		@company = company
	end

	def show?
		current_company == @company
	end

	def job_postulation?
		@current_company == @company
	end
end