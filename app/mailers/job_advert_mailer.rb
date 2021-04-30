class JobAdvertMailer < ApplicationMailer
    def new_job_advert_email
        @job_advert = params[:job_advert]
        @job_application = params[:job_application]

        mail(to: @job_application.email, subject: "You have successfully applied for the job!")
    end
end
