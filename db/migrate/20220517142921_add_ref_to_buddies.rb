class AddRefToBuddies < ActiveRecord::Migration[7.0]
  def change
    add_reference :buddies, :user, null: false, foreign_key: true
  end
end
