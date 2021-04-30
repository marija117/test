class JobApplicationMailer < ApplicationMailer
    def new_job_application_email
        @job_application = params[:job_application]
        
        mail(to: @job_application.job_advert.employer_email, subject: "You got a new application for the job!")
    end
end
