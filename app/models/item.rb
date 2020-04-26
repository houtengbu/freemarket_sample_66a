class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true 
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :burden_id, presence: true
  validates :area_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :selling_price, presence: true
  has_many :images
  has_one :buyer
  belongs_to :category
  # belongs_to :user
  # belongs_to :saler, class_name: "User"
  # belongs_to :buyer, class_name: "User"
  belongs_to_active_hash :area
  belongs_to_active_hash :burden
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :status
  accepts_nested_attributes_for :images, allow_destroy: true
end
