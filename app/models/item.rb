class Item < ApplicationRecord
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
end
