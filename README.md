## ■ URL
IPアドレス：http://18.181.23.135/
Github（最終課題のリポジトリ）：https://github.com/Masa6190/freemarket_sample_66a

# ■ Basic認証
ID：team66-a
Pass：6666

# ■ テスト用アカウント
◯ 購入者用
メールアドレス：buyer@gamil.com
パスワード：1234567

◯ 購入用カード情報
番号：4242424242424242
期限：12/20
セキュリティカード：123

◯ 出品者用
メールアドレス：seller@gmail.com
パスワード：1234567


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


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|familyname|string|null: false|
|firstname|string|null: false|
|familyname_kana|string|null: false|
|firstname_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: faise|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|integer|null:false|
|building|string|
|phone_number|string|
|familyname_deliver|string|
|firstname_deliver|string|
|familyname_kana_deliver|string|
|firstname_kana_deliver|string|
### Association
- belongs_to :user

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|items_id|bigint|null: false|
### Association
- belongs_to :user
- belongs_to :item


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|status_id|string|null: false|
|burden_id|string|null: false|
|area_id|string|null: false|
|days_to_ship_id|integer|null: false|
|selling_price|integer|null: false|
|category_id|bigint|null: false|
|buyer_id|bigint|foreign_key:true|
|saler_id|bigint|foreign_key:true|
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
|item_id|bigint|null: false|
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
