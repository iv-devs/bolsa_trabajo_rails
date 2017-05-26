# Preview all emails at http://localhost:3000/rails/mailers/job_notification_mailer
class JobNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/job_notification_mailer/job_create
  def job_create
    JobNotificationMailerMailer.job_create
  end

  # Preview this email at http://localhost:3000/rails/mailers/job_notification_mailer/accept_job
  def accept_job
    JobNotificationMailerMailer.accept_job
  end

  # Preview this email at http://localhost:3000/rails/mailers/job_notification_mailer/reject_job
  def reject_job
    JobNotificationMailerMailer.reject_job
  end

end
