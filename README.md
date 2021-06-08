# テーブル設計

## users テーブル

| Column                | Type     | Options                   |
| --------------------- | -------- | ------------------------  |
| email                 | string   | null: false, unique: true |
| encrypted_ password   | string   | null: false               |
| nickname              | string   | null: false               |
| first_name            | string   | null: false               |
| last_name             | string   | null: false               |
| _kana first_name      | string   | null: false               | 
| _kana first_name      | string   | null: false               |
| birthday             | date     | null:false                |



### Association

- has_many :items
- has_many :purchases

##  items テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| product            | string     | null: false                    |
| description        | text       | null: false                    |
| detail             | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_one :shipping

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     | null: false                    |
| phone_number       | string     | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- has_one : shipping


## shipping address テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| fee                | string     | null: false                    |
| area               | string     | null: false                    |
| days               | string     | null: false                    |

### Association

- belongs_to :purchase
- belongs_to :item