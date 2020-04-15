# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique:true|
|password|string|nill :false|

### Association
- has_many :items
- has_many :buyers
- has_one :credit_card
- has_one :address


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key:true|
|customer_id|string|null: false|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key:true|
|familyname|string|null: false|
|firstname|string|null: false|
|familyname_kana|string|null: false|
|firstname_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: faise|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|integer|null:false|
|building|string||
### Association
- belongs_to :user

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key:true|
|items|references|null: false,foreign_key:true|
### Association
- belongs_to :user
- belongs_to :item


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key:true|
|name|string|null: false|
|text|text|null: false|
|status|string|null: false|
|burden|string|null: false|
|area|string|null: false|
|days_to_ship|integer|null: false|
|selling_price|integer|null: false|
|category|references|null: false,foreign_key:true|
|brand|string||
### Association
- has_many :images
- has_one :buyer
- belongs_to :category
- belongs_to :user
### add_index
- add_index :item_name


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false,foreign_key:true|
|image|string|null: false|
### Association
- belongs_to :item

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|
### Association
- has_many :items
### add_index
- add_index :ancestry










