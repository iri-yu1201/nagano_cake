class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
