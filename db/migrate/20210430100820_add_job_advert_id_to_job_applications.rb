class AddJobAdvertIdToJobApplications < ActiveRecord::Migration[6.0]
  def up
    add_column :job_applications, :job_advert_id, :bigint, null: false

    add_foreign_key :job_applications, :job_adverts, column: :job_advert_id
  end

  def down
    remove_column :job_applications, :job_advert_id, :bigint
  end
end
