class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.integer :biling_amount
      t.integer :shipping
      t.integer :payment_method
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :status, null:false, default:0

      t.timestamps
    end
  end
end
