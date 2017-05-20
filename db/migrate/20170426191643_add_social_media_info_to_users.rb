class AddSocialMediaInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fb, :string
    add_column :users, :linkedin, :string
    add_column :users, :github, :string
    add_column :users, :web, :string
  end
end
