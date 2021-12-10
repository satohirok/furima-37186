class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :days

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price, numericality: { only_integer:true, greater_than: 299, less_than: 10_000_000 }
    validates :image
    validates :category_id, :status_id, :shipping_charge_id, :shipment_source_id, :days_id, numericality: { other_than: 1}


  end
end
