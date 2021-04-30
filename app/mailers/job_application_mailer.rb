class JobApplicationMailer < ApplicationMailer
    def new_job_application_email
        @job_application = params[:job_application]
    
        mail(to: "from@example.com", subject: "You got a new application for job!")
      end
end
