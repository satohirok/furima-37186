# テーブル設計

## users テーブル


| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| last_name          | string              | null: false               |
| fast_name          | string              | null: false               |
| kana_last          | string              | null: false               |
| kana_fast          | string              | null: false               |
| birthday           | date                | null: false               |
### Association
 has_many :items
 has_many :purchases








## items テーブル名

| Column                | Type                | Options                         |
|-----------------------|---------------------|---------------------------------|
| name                  | string              | null: false                     |
| explanation           | text                | null: false                     |
| category_id           | integer             | null: false                     |
| status_id             | integer             | null: false                     |
| shipping_charge_id    | integer             | null: false                     |
| shipment_source_id    | integer             | null: false                     |
| days_id               | integer             | null: false                     |
| price                 | integer             | null: false                     |
| user                  | references          | null: false,foreign_key: true   |

### Association
 belongs_to :user
 has_one :purchase









## purchases テーブル


| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| user               | references          | null: false,foreign_key: true   |
| item               | references          | null: false,foreign_key: true   |


### Association
 belongs_to :user
 belongs_to :item
 has_one :address



## address テーブル


| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| postal_code        | string              | null: false                     |
| prefectures_id     | integer             | null: false                     |
| municipalities     | string              | null: false                     |
| house_number       | string              | null: false                     |
| building           | string              |                                 |
| tel_number         | string              | null: false                     |
| purchase           | references          | null: false,foreign_key: true   |



### Association
 belongs_to :purchase



