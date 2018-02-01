class AddSecretToKeyPairs < ActiveRecord::Migration[5.1]
  def change
    add_column :key_pairs, :secret, :string
  end
end
