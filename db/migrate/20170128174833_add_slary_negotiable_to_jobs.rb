class AddSlaryNegotiableToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :salary_negotiable, :boolean
  end
end
