# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :comments
- has_many :items, through: comments

## items テーブル

| Column   | Type    | Options                         |
| -------- | ------- | ------------------------------- |
| goods    | string  |  null: false, foreign_key: true |
| images   | text    |  null: false, foreign_key: true |
| explain  | text    |  null: false, foreign_key: true |
| price    | integer |  null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
