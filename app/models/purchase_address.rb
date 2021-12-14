class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipalities, :house_number, :building, :tel_number, :name, :buyer, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :postal_code, :tel_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}


  def save
   
   purchase = Purchase.create()
   Address.create(postal_code: postal_code, prefecture: prefecture, municipalities: municipalities, house_number: house_number, building: building, name: name, buyer: buyer)
  end
end