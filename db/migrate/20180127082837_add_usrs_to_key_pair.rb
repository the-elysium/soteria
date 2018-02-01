class AddUsrsToKeyPair < ActiveRecord::Migration[5.1]
  def change
    add_reference :key_pairs, :user, foreign_key: true
  end
end
