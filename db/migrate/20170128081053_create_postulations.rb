class CreatePostulations < ActiveRecord::Migration[5.0]
  def change
    create_table :postulations do |t|
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true
      t.text :professional_profile
      t.text :academic_profile
      t.text :interest

      t.timestamps
    end
  end
end
