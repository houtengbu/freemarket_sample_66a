class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :name, presence: true 
  validates :category, presence: true
  validates :status, presence: true
  validates :burden, presence: true
  validates :area, presence: true
  validates :days_to_ship, presence: true
  validates :price, presence: true
  has_many :images
  has_one :buyer
  belongs_to :category
  belongs_to :user
  belongs_to_active_hash :area
  belongs_to_active_hash :burden
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :status
  accepts_nested_attributes_for :images, allow_destroy: true
end
