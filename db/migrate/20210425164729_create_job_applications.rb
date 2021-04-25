class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.string :applicant_full_name
      t.date :date_of_birth
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :qualification
      t.timestamps
    end
  end
end
