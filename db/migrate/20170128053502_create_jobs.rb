class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :job_type
      t.integer :salary
      t.integer :salary_type
      t.text :description
      t.references :company, foreign_key: true
      t.boolean :publish_job
      t.boolean :find_worker

      t.timestamps
    end
  end
end
