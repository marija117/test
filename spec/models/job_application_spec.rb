require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  context 'validation tests' do
    it 'ensures applicant_full_name presence' do
      job_application = JobApplication.new(date_of_birth: '01.02.1992', email: 'sample@example.com', phone_number: '556952365656', address: 'Sample', qualification: 'Sample').save
      expect(job_application).to eq(false)
    end

    it 'ensures date_of_birth presence' do
      job_application = JobApplication.new(applicant_full_name: 'AAAAA', email: 'sample@example.com', phone_number: '556952365656', address: 'Sample', qualification: 'Sample').save
      expect(job_application).to eq(false)
    end

    it 'ensures email presence' do
      job_application = JobApplication.new(applicant_full_name: 'AAAAA', date_of_birth: '01.02.1992', phone_number: '556952365656', address: 'Sample', qualification: 'Sample').save
      expect(job_application).to eq(false)
    end

    it 'ensures valid email' do
      job_application = JobApplication.new(applicant_full_name: 'AAAAA', email: 'sampleexample.com', date_of_birth: '01.02.1992', phone_number: '556952365656', address: 'Sample', qualification: 'Sample').save
      expect(job_application).to eq(false)
    end

    it 'ensures phone_number presence' do
      job_application = JobApplication.new(applicant_full_name: 'AAAAA', date_of_birth: '01.02.1992', email: 'sample@example.com', address: 'Sample', qualification: 'Sample').save
      expect(job_application).to eq(false)
    end

    it 'ensures valid phone_number' do
      job_application = JobApplication.new(applicant_full_name: 'AAAAA', date_of_birth: '01.02.1992', phone_number: 'dede545345', email: 'sample@example.com', address: 'Sample', qualification: 'Sample').save
      expect(job_application).to eq(false)
    end

    it 'ensures address presence' do
      job_application = JobApplication.new(applicant_full_name: 'AAAAA', date_of_birth: '01.02.1992', email: 'sample@example.com', phone_number: '556952365656', qualification: 'Sample').save
      expect(job_application).to eq(false)
    end

    it 'ensures qualification presence' do
      job_application = JobApplication.new(applicant_full_name: 'AAAAA', date_of_birth: '01.02.1992', email: 'sample@example.com', phone_number: '556952365656', address: 'Sample').save
      expect(job_application).to eq(false)
    end

    it 'should save successfully' do
      job_application = JobApplication.new(applicant_full_name: 'AAAAA', date_of_birth: '01.02.1995', email: 'sample@example.com', phone_number: '54546554212454778', address: 'Sample', qualification: 'Sample').save
      expect(job_application).to eq(true)
    end
  end
end
