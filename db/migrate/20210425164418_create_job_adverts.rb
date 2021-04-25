class CreateJobAdverts < ActiveRecord::Migration[6.0]
  def change
    create_table :job_adverts do |t|
      t.string :title
      t.string :description
      t.string :employer
      t.string :employer_email
      t.string :category
      t.datetime :expiration_date
      t.timestamps
    end
  end
end
