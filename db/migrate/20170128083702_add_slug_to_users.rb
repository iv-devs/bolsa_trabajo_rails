class AddSlugToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slug, :string
    add_column :companies, :slug, :string
    add_column :jobs, :slug, :string
    add_index :users, :slug, unique: true
    add_index :companies, :slug, unique: true
    add_index :jobs, :slug, unique: true
  end
end
