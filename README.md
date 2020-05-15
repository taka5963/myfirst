# アプリ名  
みんなで作る参考書

# 概要
教科書や市販の参考書において解説がわかりにくい部分などを  
画像として投稿し、自分以外の人に質問したりあるいは自分なら  
こうやって解くなどと言ったことをたくさんの人と共有できるアプリ   
です。

# 制作背景
前職で塾講師として働いていた際、たくさんの参考書を読みました。  
その中で「この問題は違う解き方で解いた方が良いのに」と思って  
しまうことが少なくありませんでた。例えそのことを出版社に直接  
伝えたとしても、よくて数ヶ月あるいは数年後に改定されるだけで  
かなりのタイムラグがあります。そういったもどかしさを何とか解決  
できないものかと色々考えた結果、このアプリを作ろうと思いました。

# DEMO
![現状](./images/キャプチャ動画 - 8a064892a0207f7a3f8c40ac1074037c - Gyazo.webloc)

# 実装予定の機能
・画像を添付しての投稿機能  
・投稿に対するいいね機能  
・参考書の名前でのタグ付け機能  
・参考書での検索機能

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :posts
- has_many :comments
- has_many :likes

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|image|text||
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :book
- has_many :likes
- has_many :comments
- has_many :posts_tags
- has_many  :tags,  through:  :posts_tags

## booksテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
### Association
- has_many :posts

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :posts_tags
- has_many  :posts,  through:  :posts_tags

## posts_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user
