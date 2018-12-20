class CreateApplicationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.integer :job_id, null: false
      t.integer :user_id, null: false
    end
    add_index :applications, [:job_id, :user_id], :unique => true
    add_index :applications, :job_id
  end
end
