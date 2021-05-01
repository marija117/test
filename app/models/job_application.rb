class JobApplication < ApplicationRecord
    validates :applicant_full_name, presence: true
    validates :date_of_birth, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :phone_number,   :presence => {:message => 'Phone number can not contain letters!'},
    :numericality => true, :length => { :minimum => 10, :maximum => 15 }
    validates :address, presence: true
    validates :qualification, presence: true

    belongs_to :job_advert
end
