class JobApplicationsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_job_application, only: [:show]

    def create
        @job_application = JobApplication.new(job_application_params)
    
        if @job_application.save
            redirect_to @job_application
        else
            render :new
        end
    end

    def show
        @job_application = JobApplication.find(params[:id])
    end

    def new
        @job_application = JobApplication.new
    end

    private

    def set_job_application
        @job_application = JobApplication.find(params[:id]) if params[:id]
    end

    def job_application_params
        params.require(:job_application).permit(:applicant_full_name, :date_of_birth, :email, :phone_number, :address, :qualification)
    end
end
