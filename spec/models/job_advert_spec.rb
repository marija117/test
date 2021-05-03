require 'rails_helper'

RSpec.describe JobAdvert, type: :model do
  context 'validation tests' do
    it 'ensures title presence' do
      job_advert = JobAdvert.new(description: 'AAAAA', employer: 'Sample', employer_email: 'sample@example.com', category: 'Sample', expiration_date: '01.06.2021').save
      expect(job_advert).to eq(false)
    end

    it 'ensures description presence' do
      job_advert = JobAdvert.new(title: 'AAAAA', employer: 'Sample', employer_email: 'sample@example.com', category: 'Sample', expiration_date: '01.06.2021').save
      expect(job_advert).to eq(false)
    end

    it 'ensures description at least 10 character long' do
      job_advert = JobAdvert.new(title: 'AAAAA', description: 'jn', employer: 'Sample', employer_email: 'sample@example.com', category: 'Sample', expiration_date: '01.06.2021').save
      expect(job_advert).to eq(false)
    end

    it 'ensures employer presence' do
      job_advert = JobAdvert.new(title: 'AAAAA', description: 'Sample', employer_email: 'sample@example.com', category: 'Sample', expiration_date: '01.06.2021').save
      expect(job_advert).to eq(false)
    end

    it 'ensures employer_email presence' do
      job_advert = JobAdvert.new(title: 'AAAAA', description: 'Sample', employer: 'Sample', category: 'Sample', expiration_date: '01.06.2021').save
      expect(job_advert).to eq(false)
    end

    it 'ensures valid employer_email' do
      job_advert = JobAdvert.new(title: 'AAAAA', description: 'Sample', employer: 'Sample', employer_email: 'emailsample.com', category: 'Sample', expiration_date: '01.06.2021').save
      expect(job_advert).to eq(false)
    end

    it 'ensures category presence' do
      job_advert = JobAdvert.new(title: 'AAAAA', description: 'Sample', employer: 'Sample', employer_email: 'sample@example.com', expiration_date: '01.06.2021').save
      expect(job_advert).to eq(false)
    end

    it 'ensures expiration_date presence' do
      job_advert = JobAdvert.new(title: 'AAAAA', description: 'Sample', employer: 'Sample', employer_email: 'sample@example.com', category: 'Sample').save
      expect(job_advert).to eq(false)
    end

    it 'should save successfully' do
      job_advert = JobAdvert.new(title: 'AAAAA', description: 'Sampleeeeee', employer: 'Sample', employer_email: 'sample@example.com', category: 'Sample', expiration_date: '01.06.2021').save
      expect(job_advert).to eq(true)
    end
  end
end
