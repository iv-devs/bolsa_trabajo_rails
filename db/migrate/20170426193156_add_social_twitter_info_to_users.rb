class AddSocialTwitterInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tw, :string
  end
end
