# テーブル設計

## Users テーブル

| Column | Type     | Options                        |
| ---------| -------| ------------------------------ |
| nickname | string | null:false                     |
| email    | string | null:false                     |
| password | string | null:false                     |

### Association
- has_many :posts
- has_many :memos


## Posts テーブル

| Column      | Type       | Options                          |
| ----------- | ---------- | -------------------------------- |
| user        | references | null:false, foreign_key:true     |
| name        | string     | null:false                       |
| best_before | string     |                                  |
| quantity    | integer    | null:false                       |
| location    | string     |                                  |
| category_id | integer    | null:false                       |

### Association
- belongs_to :user


## Memos テーブル

| Column       |            | Options                         |
| ------------ | ---------- | ------------------------------- |
| user         | references | null:false, foreign_key:true    |
| name         | string     | null:false                      |
| contens      | string     |                                 |

### Association
- belonges_to :user