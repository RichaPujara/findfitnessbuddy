class UpdateDatatypeToProfile < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :contact_number, :integer
  end
end
