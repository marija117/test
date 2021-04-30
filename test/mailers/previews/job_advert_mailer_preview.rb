# Preview all emails at http://localhost:3000/rails/mailers/job_advert_mailer
class JobAdvertMailerPreview < ActionMailer::Preview
    def new_job_advert_email
        # Set up a temporary job_advert for the preview
        job_advert = JobAdvert.new(applicant_full_name: "Joe Smith", email: "joe@gmail.com", address: "1-2-3 Chuo, Tokyo, 333-0000", phone_number: "090-7777-8888", qualification: "PhD")
    
        JobApplicationMailer.with(job_advert: job_advert).new_job_advert_email
    end
end
