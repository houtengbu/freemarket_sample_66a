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
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  accepts_nested_attributes_for :images, allow_destroy: true
end
