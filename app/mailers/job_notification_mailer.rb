class JobNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.job_notification_mailer.job_create.subject
  #
  def job_create
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.job_notification_mailer.accept_job.subject
  #
  def accept_job
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.job_notification_mailer.reject_job.subject
  #
  def reject_job
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
