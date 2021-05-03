require 'rails_helper'

RSpec.describe JobAdvertsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/job_adverts").to route_to("job_adverts#index")
    end

    it "routes to #new" do
      expect(get: "/job_adverts/new").to route_to("job_adverts#new")
    end

    it "routes to #show" do
      expect(get: "/job_adverts/1").to route_to("job_adverts#show", id:"1")
    end

    it "routes to #edit" do
      expect(get: "/job_adverts/1/edit").to route_to("job_adverts#edit", id:"1")
    end

    it "routes to #create" do
      expect(post: "/job_adverts").to route_to("job_adverts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/job_adverts/1").to route_to("job_adverts#update", id:"1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/job_adverts/1").to route_to("job_adverts#update", id:"1")
    end

    it "routes to #destroy" do
      expect(delete: "/job_adverts/1").to route_to("job_adverts#destroy", id:"1")
    end
  end
end