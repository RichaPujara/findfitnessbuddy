class CreateBusinessProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :business_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
