class JobApplicationMailer < ApplicationMailer
    def new_job_application_email
        @job_application = params[:job_application]

        mail(to: @job_application.email, subject: "You have successfully applied for the job!")
    end
end
