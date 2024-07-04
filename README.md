# README

# テーブル設計

## users テーブル

| Column             | Type          | Options     |
| ------------------ | ------        | ----------- |
| nickname           | string        | null: false |ニックネーム
| email              | string        | null: false, unique: true |
| encrypted_password | string        | null: false |パスワード
| last_name          | string        | null: false |苗字
| first_name         | string        | null: false |名前
| last_name_kana     | string        | null: false |苗字（カナ）
| first_name_kana    | string        | null: false |名前（カナ）

### Association

- has_many :store
- has_many :comment


## items テーブル

| Column                 | Type    | Options     |
| -----------------    - | ------  | ----------- |
| store                  | string  | null: false |商品名
| product _description   | text    | null: false |商品の説明
| category_id            | integer | null: false |カテゴリー
| cooking_name           | string  | null: false |料理名
| lunch_business_charge  | string  | null: false |ランチ営業時間
| dinner_business_charge | string  | null: false |ディナー営業時間
| phone                  | string  | null: false |電話番号
| prefecture_id          | integer | null: false |都道府県
| city                   | string  | null: false |市町村
| block                  | string  | null: false |番地
| building               | string  |             |建物名・部屋番号
| regular_day            | string  | null: false |定休日
| user                   | references | null: false, foreign_key: true |
| comment                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
  belongs_to :comment
- belongs_to :category
- belongs_to :prefecture




## comment テーブル

| Column             | Type       | Options                        |
| ------             | ---------- | ------------------------------ |
| description        | text       | null: false |説明
| remark             | string     | null: false |内容
| rating_id             | integer    | null: false |評価
| user               | references | null: false, foreign_key: true |

### Association

- has_many :MachBuras
- belongs_to :user
- belongs_to :rating


