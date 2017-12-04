class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.boolean :is_active,:default => false
      t.references :user

      t.timestamps
    end
  end
end
