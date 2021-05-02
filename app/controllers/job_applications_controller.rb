class JobApplicationsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_job_advert
    before_action :set_job_application, only: [:show, :destroy]
    
    def index
        @job_applications = @job_advert.job_applications.page(params[:page]).per(5)
    end 

    def create
        @job_application = @job_advert.job_applications.build(job_application_params)
    

        if @job_application.save
            JobApplicationMailer.with(job_application: @job_application).new_job_application_email.deliver_later
            JobAdvertMailer.with(job_advert: @job_advert, job_application: @job_application).new_job_advert_email.deliver_later

            redirect_to job_advert_job_applications_path, notice: 'Job application was successfully created.'
        else
            render 'job_adverts/show'
        end
    end

    def show
    end

    def new
        # @job_application = @job_advert.job_applications.build
    end

    def destroy
        @job_application.destroy

        redirect_to job_advert_job_applications_path, notice: 'Job application was successfully deleted.'
    end

    private

    def set_job_application
        @job_application = @job_advert.job_applications.find(params[:id]) if params[:id]
    end

    def get_job_advert
        @job_advert = JobAdvert.find(params[:job_advert_id]) if params[:job_advert_id]
    end

    def job_application_params
        params.require(:job_application).permit(:job_advert_id, :applicant_full_name, :date_of_birth, :email, :phone_number, :address, :qualification)
    end
end
