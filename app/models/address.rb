class Address < ApplicationRecord

  belongs_to :customer

  def address_info
    self.postal_code + self.address + self.name
  end

end
