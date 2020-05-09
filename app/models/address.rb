class Address < ApplicationRecord
  VALID_ZENKAKU_REGEX = /\A[０-９]+\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/

  belongs_to :user
  validates :familyname, presence: true, format: { with: VALID_ZENKAKU_REGEX, message: 'は全角で入力して下さい'}
  validates :firstname, presence: true, format: { with: VALID_ZENKAKU_REGEX, message: 'は全角で入力して下さい'}
  validates :familyname_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :firstname_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :birth_year, presence: true  
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :block, presence: true
end


