class JobAdvertsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job_advert, only: [:show, :edit, :update, :destroy]

    def index
        @job_adverts = JobAdvert.page(params[:page]).per(5)
    end

    def show
        @job_application = @job_advert.job_applications.build
    end
  
    def new
      @job_advert = JobAdvert.new
    end

    def edit
    end

    def create
        @job_advert = JobAdvert.new(job_advert_params)
    
        if @job_advert.save
            redirect_to @job_advert
        else
            render :new
        end
    end

    def update
        if @job_advert.update(job_advert_params)
            redirect_to @job_advert
        else
            render :edit
        end
    end

    def destroy
        @job_advert.destroy
        
        redirect_to adverts_url
    end

    private

    def set_job_advert
        @job_advert = JobAdvert.find(params[:id]) if params[:id]
    end

    def job_advert_params
        params.require(:job_advert).permit(:title, :description, :employer, :employer_email, :category, :expiration_date)
    end
end
