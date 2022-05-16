class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :street
      t.string :suburb
      t.string :city
      t.string :state
      t.string :country, default: "Australia"
      t.string :postcode

      t.timestamps
    end
  end
end
