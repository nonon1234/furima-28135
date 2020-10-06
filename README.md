# テーブル設計

## users テーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | string     | null: false                    |
| item_description | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| sipping_fee_id   | integer    | null: false                    |
| sipping_area_id  | integer    | null: false                    |
| sipping_time_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_one : purchase

## purchases テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one : address

## addresses テーブル
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postcode      | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| block         | string  | null: false |
| building      | string  |             |
| phone_number  | string  | null: false |

### Association
- belongs_to : purchase