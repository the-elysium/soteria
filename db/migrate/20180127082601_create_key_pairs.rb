class CreateKeyPairs < ActiveRecord::Migration[5.1]
  def change
    create_table :key_pairs do |t|
      t.string :public_key
      t.string :private_key
      t.string :password

      t.timestamps
    end
  end
end
