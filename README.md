# テーブル設計

## users テーブル


| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| name               | string              | null: false, unique: true |
| kana               | string              | null: false               |
| birthday           | string              | null: false               |

### Association
 has_many :items
 has_many :purchases








## items テーブル名

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| name               | string              | null: false                     |
| explanation        | text                | null: false                     |
| category           | integer             | null: false                     |
| status             | integer             | null: false                     |
| shipping_charge    | integer             | null: false                     |
| shipment_source    | integer             | null: false                     |
| days               | integer             | null: false                     |
| price              | integer             | null: false                     |
| seller             | references          | null: false,foreign_key: true   |

### Association
 belongs_to :user
 has_one :purchase









## purchases テーブル


| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| name               | references          | null: false,foreign_key: true   |
| buyer              | references          | null: false,foreign_key: true   |


### Association
 belongs_to :user
 belongs_to :item
 has_one :address



## address テーブル


| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| postal_code        | string              | null: false                     |
| prefectures        | integer             | null: false                     |
| municipalities     | string              | null: false                     |
| house_number       | string              | null: false                     |
| building           | string              |                                 |
| tel_number         | string              | null: false                     |
| name               | references          | null: false,foreign_key: true   |
| buyer              | references          | null: false,foreign_key: true   |


### Association
 belongs_to :purchase



