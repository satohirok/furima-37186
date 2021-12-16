class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :municipalities, :house_number, :building, :tel_number,  :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
     validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
     validates :house_number, :item_id, :user_id, :municipalities, :token
  end
  validates :shipment_source_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :tel_number, presence: true, format: {with: /\A\d{10,11}\z/, message: "is invalid"}


  def save
   purchase = Purchase.create(user_id: user_id, item_id: item_id)
   Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, municipalities: municipalities, house_number: house_number, building: building, purchase_id: purchase_id)
  end
end