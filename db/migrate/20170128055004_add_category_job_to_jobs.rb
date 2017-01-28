class AddCategoryJobToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :category_job, :integer
  end
end
