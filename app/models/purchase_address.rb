class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :municipalities, :house_number, :building, :tel_number,  :purchase, :user, :item

  with_options presence: true do
     validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
     validates :user, :municipalities, :house_number
  end
  validates :shipment_source_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :tel_number, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}


  def save
   purchase = Purchase.create(user: user, item: item)
   Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, municipalities: municipalities, house_number: house_number, building: building, purchase: purchase)
  end
end