class JobApplicationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job_application, only: [:show]
    before_action :set_job_advert, only: [:create]

    
    def index
        @job_applications = JobApplication.page(params[:page]).per(5)
    end 

    def create
        @job_application = @job_advert.job_applications.create(job_application_params)
    
        if @job_application.save
            JobApplicationMailer.with(job_application: @job_application).new_job_application_email.deliver_later
            JobAdvertMailer.with(job_advert: @job_advert, job_application: @job_application).new_job_advert_email.deliver_later

            redirect_to @job_application
        else
            render :new
        end
    end

    def show
    end

    def new
        @job_application = JobApplication.new
    end

    private

    def set_job_application
        @job_application = JobApplication.find(params[:id]) if params[:id]
    end

    def set_job_advert
        @job_advert = JobAdvert.find(params[:job_advert_id]) if params[:job_advert_id]
    end

    def job_application_params
        params.require(:job_application).permit(:job_advert_id, :applicant_full_name, :date_of_birth, :email, :phone_number, :address, :qualification)
    end
end
