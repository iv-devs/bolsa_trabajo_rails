class AddCompanyIdToPostulations < ActiveRecord::Migration[5.0]
  def change
    add_reference :postulations, :company, foreign_key: true
  end
end
