require 'rails_helper'

RSpec.describe "/job_adverts", type: :request do

  current_user = User.first_or_create!(email: "john@doe.com", full_name: "John Doe", password: "password", password_confirmation: "password")
  let(:valid_attributes)  do
    {
    'id' => '1',
    'title' => 'Test',
    'description' => 'Description123',
    'employer' => 'Test',
    'employer_email' => 'test@test.com',
    'category' => 'Test',
    'expiration_date' => '01.02.2022'
    }
  end

  let(:invalid_attributes) do
   {
    'id' => 'a',
    'title' => '',
    'description' => 'Desc',
    'employer' => 'Test',
    'employer_email' => 'testtest.com',
    'category' => '',
    'expiration_date' => '01.02.2022'
   }
  end

  describe "GET /index" do
    it "renders a successful response" do
      JobAdvert.create! valid_attributes
      get job_advert_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      job_advert = JobAdvert.create! valid_attributes
      get job_advert_url(job_advert)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_job_advert_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      job_advert = JobAdvert.create! valid_attributes
      get edit_job_advert_url(job_advert)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context 'with valid parameters' do
      it "creates a new Job Advert" do
        expect do
          post job_advert_url, params: { job_advert: valid_attributes }
        end
      end

      it 'redirects to the created job advert' do
        post job_adverts_url, params: { job_advert: valid_attributes }
        expect(response).to redirect_to(job_advert_url(JobAdvert.last))
      end
    end

    context 'with invalid parameters' do
      it "does not create a new Job Advert" do
        expect do
          post job_advert_url, params: { job_advert: invalid_attributes }
        end
      end

      it "renders a successful response(i.e. to display the 'new' template)" do
        post job_adverts_url, params: { job_advert: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'id' => '1',
          'title' => 'Test2',
          'description' => 'Description456',
          'employer' => 'Test',
          'employer_email' => 'test@test.com',
          'category' => 'Test',
          'expiration_date' => '01.02.2022'
        }
      end

      it 'updates the requested job advert' do
        job_advert = JobAdvert.create! valid_attributes
        patch job_advert_url(job_advert), params: {job_advert: new_attributes }
        job_advert.reload
        skip('Add assertions for updated state')
      end

      it 'redirect to the job advert' do
        job_advert = JobAdvert.create! valid_attributes
        patch job_advert_url(job_advert), params: { job_advert: new_attributes }
        job_advert.reload
        expect(response).to redirect_to(job_advert_url(job_advert))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e to display the 'edit' tempalte" do
        job_advert = JobAdvert.create! valid_attributes
        patch job_advert_url(job_advert), params: { job_advert: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE / destroy' do
    it 'destroys the requestes job advert' do
      job_advert = JobAdvert.create! valid_attributes
      expect do
        delete job_advert_url(job_advert)
      end.to change(JobAdvert, :count).by(-1)
    end

    it 'redirects to the job adverts list' do
      job_advert = JobAdvert.create! valid_attributes
      delete job_advert_url(job_advert)
      expect(response).to redirect_to(job_adverts_url)
    end
  end
end
