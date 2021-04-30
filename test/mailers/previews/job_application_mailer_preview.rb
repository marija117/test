# Preview all emails at http://localhost:3000/rails/mailers/job_application_mailer
class JobApplicationMailerPreview < ActionMailer::Preview
    def new_job_application_email
        # Set up a temporary job_application for the preview
        job_application = JobApplication.new(applicant_full_name: "Joe Smith", email: "joe@gmail.com", address: "1-2-3 Chuo, Tokyo, 333-0000", phone_number: "090-7777-8888", qualification: "PhD")
    
        JobApplicationMailer.with(job_application: job_application).new_job_application_email
    end
end
