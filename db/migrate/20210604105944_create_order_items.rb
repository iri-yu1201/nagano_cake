class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|

      t.integer :price
      t.integer :quantity
      t.integer :making_status, default: 0, null: false

      t.timestamps
    end
  end
end
