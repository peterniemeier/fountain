class CreateJobsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :employer_id, null: false
    end
    add_index :jobs, :employer_id
  end
end
