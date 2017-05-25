class PostulationMailer < ApplicationMailer

	#Notificamos a la empresa sobre su postulacion
	def notification_postulation(user, job)
		@user = user
		@job = job
		mail(to: @job.company.email, subject: "Hay una nueva postulación en #{@job.title}")
	end
	
end
