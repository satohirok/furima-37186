class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :municipalities, :house_number, :building, :tel_number,  :purchase, :user, :item

  with_options presence: true do
    validates :user
    validates :postal_code, :tel_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :shipment_source_id, numericality: {other_than: 0, message: "can't be blank"}


  def save
   purchase = Purchase.create(user: user, item: item)
   Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, municipalities: municipalities, house_number: house_number, building: building, purchase: purchase)
  end
end