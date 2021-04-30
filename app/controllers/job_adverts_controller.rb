class JobAdvertsController < ApplicationController
    before_action :set_job_advert, only: [:show, :update]

    def index
      @job_adverts = JobAdvert.all
    end

    def show
    end
  
    def new
      @advert = Advert.new
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

    private

    def set_job_advert
        @job_advert = JobAdvert.find(params[:id]) if params[:id]
    end

    def job_advert_params
        params.permit(:title, :description, :employer, :employer_email, :category, :expiration_date)
    end
end
