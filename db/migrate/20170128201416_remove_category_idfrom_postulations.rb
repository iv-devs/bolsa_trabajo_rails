class RemoveCategoryIdfromPostulations < ActiveRecord::Migration[5.0]
  def change
  	remove_reference :postulations, :company, index: true
  end
end
