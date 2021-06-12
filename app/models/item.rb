class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  attachment :image

  def  add_tax_item_price #税込価格
    (self.price * 1.10).round
  end

  
end
