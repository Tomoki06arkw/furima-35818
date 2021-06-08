# テーブル設計

## users テーブル

| Column                              | Type     | Options                   |
| ----------------------------------- | -------- | ------------------------  |
| email                               | string   | null: false, unique: true |
| encrypted_ password                 | string   | null: false               |
| nickname                            | string   | null: false               |
| first_name,last_name                | string   | null: false               |
| first_name_kana,last_name_kana      | string   | null: false               | 
| birthday                            | date     | null: false                |

### Association

- has_many :items
- has_many :purchases

##  items テーブル

| Column                | Type        | Options                        |
| ----------------------| ------      | ------------------------------ |
| product_name          | string      | null: false                    |
| description           | text        | null: false                    |
| price                 | string     | null: false                     |
| category_id           | integer     | null: false                    |
| condition_id          | integer     | null: false                    |
| fee_id                | integer    | null: false                     |
| area_id               | integer    | null: false                     |
| days_id               | integer    | null: false                     |
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
- has_one : shipping


## shipping address テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     | null: false                    |
| phone_number       | string     | null: false                    |
| purchases          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase