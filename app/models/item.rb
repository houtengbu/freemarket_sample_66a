class Item < ApplicationRecord
  Validation :image, presense: true, length { maximum: 40}
  Validation :name, presense: true 
  Validation :category, presense: true
  Validation :status, presense: true
  Validation :burden, presense: true
  Validation :area, presense: true
  Validation :days_to_ship, presense: true
  Validation :price, presense: true
end
