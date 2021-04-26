class JobAdvertsController < ApplicationController
    before_action :set_job_advert, only: [:show]

    def index
      @job_adverts = JobAdvert.all
    end

    def show
    end

    private

    def set_job_advert
        @job_advert = JobAdvert.find(params[:id]) if params[:id]
    end

    def job_advert_params
        params.permit(:title, :description, :employer, :employer_email, :category, :expiration_date)
    end
end
