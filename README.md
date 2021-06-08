# テーブル設計

## users テーブル

| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| email                 | string   | null: false |
| encrypted_ password   | string   | null: false |
| nickname              | string   | null: false |
| first_name            | string   | null: false |
| last_name             | string   | null: false |
| カナ first_name        | string   | null: false |
| カナ first_name        | string   | null: false |
| 年 birthday            | string   | null:false  |
| 月 birthday            | string   | null:false  |
| 日 birthday            | string   | null:false  |


### Association

- has_many :items
- has_many :purchases

##  items テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| product            | string     | null: false                    |
| description        | text       | null: false                    |
| detail             | text       | null: false                    |
| image              |  ActiveStorageで実装                         |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases
- has_one :shipping

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| seller             | string     | null: false                    |
| category           | text       | null: false                    |
| condition          | text       | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :items
- has_one : shipping


## shipping テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| shipping_area      | text       | null: false                    |
| shipping_date      | text       | null: false                    |

### Association

- belongs_to :purchases
- belongs_to :items