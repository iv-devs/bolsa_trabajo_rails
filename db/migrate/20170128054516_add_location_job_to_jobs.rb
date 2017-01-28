class AddLocationJobToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :location_job, :string
  end
end
