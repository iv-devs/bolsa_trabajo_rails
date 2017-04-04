class AddLinkedinToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :linkedin, :string
  end
end
