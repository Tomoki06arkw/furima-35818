# テーブル設計

## users テーブル

| Column                              | Type     | Options                   |
| ----------------------------------- | -------- | ------------------------  |
| email                               | string   | null: false, unique: true |
| encrypted_ password                 | string   | null: false               |
| nickname                            | string   | null: false               |
| first_name                          | string   | null: false               |
| last_name                           | string   | null: false               |
| first_name_kana                     | string   | null: false               | 
| last_name_kana                      | string   | null: false               |
| birthday                            | date     | null: false               |

### Association

- has_many :items
- has_many :purchases

##  items テーブル

| Column                | Type        | Options                        |
| ----------------------| ------      | ------------------------------ |
| product_name          | string      | null: false                    |
| description           | text        | null: false                    |
| price                 | integer     | null: false                    |
| category_id           | integer     | null: false                    |
| condition_id          | integer     | null: false                    |
| fee_id                | integer     | null: false                    |
| area_id               | integer     | null: false                    |
| delivery_id           | integer     | null: false                    |
| user                  | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one : shipping_address


## shipping_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase