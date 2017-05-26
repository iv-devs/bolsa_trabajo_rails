require "rails_helper"

RSpec.describe JobNotificationMailerMailer, type: :mailer do
  describe "job_create" do
    let(:mail) { JobNotificationMailerMailer.job_create }

    it "renders the headers" do
      expect(mail.subject).to eq("Job create")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "accept_job" do
    let(:mail) { JobNotificationMailerMailer.accept_job }

    it "renders the headers" do
      expect(mail.subject).to eq("Accept job")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "reject_job" do
    let(:mail) { JobNotificationMailerMailer.reject_job }

    it "renders the headers" do
      expect(mail.subject).to eq("Reject job")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
