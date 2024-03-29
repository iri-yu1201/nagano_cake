class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  #enum カラム名： {表示：integerなので整数}
  enum payment_method:  {クレジットカード:0, 銀行振込:1}

  enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送待ち:3, 発送済み:4}

end
