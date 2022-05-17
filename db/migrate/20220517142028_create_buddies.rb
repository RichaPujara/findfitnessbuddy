class CreateBuddies < ActiveRecord::Migration[7.0]
  def change
    create_table :buddies do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :qualification
      t.string :location
      

      t.timestamps
    end
  end
end
