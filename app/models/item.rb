class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one :purchase

  has_one_attached :image
  
  belongs_to :category

  #空の投稿を保存できないようにする
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :user, presence: true

  
  
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipment_source_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  
  
  
  
  
  
  
  
  
end
