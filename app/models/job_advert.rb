class JobAdvert < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    validates :employer, presence: true
    validates :employer_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :category, presence: true
    validates :expiration_date, presence: true

    has_many :job_applications, dependent: :destroy
end
