# テーブル設計

## users テーブル


| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |


### Association
 has_many :items
 has_many :purchases








## items テーブル名

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| image              | binary              | null: false               |
| name               | string              | null: false               |
| explanation        | text                | null: false               |
| category           | string              | null: false               |
| status             | string              | null: false               |
| shipping_charge    | integer             | null: false               |
| shipment_source    | string              | null: false               |
| days               | date                | null: false               |
| price              | integer             | null: false               |
| seller             | string              | null: false               |

### Association
 belongs_to :user
 has_one :purchase









## purchases テーブル


| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| name               | references          | null: false,foreign_key: true   |
| image              | references          | null: false,foreign_key: true   |
| price              | references          | null: false,foreign_key: true   |
| shipping_charge    | references          | null: false,foreign_key: true   |
| credit_number      | integer             | null: false                     |
| credit_expiration  | date                | null: false                     |
| security_code      | integer             | null: false                     |


### Association
 belongs_to :user
 belongs_to :item
 has_one :address



## address テーブル


| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| postal_code        | integer             | null: false               |
| prefectures        | string              | null: false               |
| municipalities     | string              | null: false               |
| house_number       | integer             | null: false               |
| building           | string              | null: false               |
| tel_number         | integer             | null: false               |



### Association
 belongs_to :purchase



