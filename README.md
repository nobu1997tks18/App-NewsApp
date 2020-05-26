# [Rails + jQuery]NewsAPIを使ったニュースの閲覧＋投稿機能を備えたSNSアプリ

## 開発環境
- Ruby on Rails
- jQuery
- VSCode
- Github
- AWS(デプロイ準備中)
- Docker(設定準備中)

## アプリの機能
### 1.ログイン後トップページ
#### 左サイドバー
- サイト内ページリンク
#### 中央
- サイト内ページリンク-
- サイト内ページリンク
- フォローユーザ＋ログインユーザーの投稿一覧
- コメントページへのリンク(各投稿の吹き出しマーク)
- いいねボタン
#### 右サイドバー
- ログインユーザのフォロー、フォロワーリスト
- フォローボタン
- ニュース閲覧ページへのリンク
[![ログイン後トップページ](https://i.gyazo.com/e4bc9bc099238d4dc6ecd15c78074363.png)](https://gyazo.com/e4bc9bc099238d4dc6ecd15c78074363)

### 2.ユーザー一覧ページ
[![ユーザ一覧ページ](https://i.gyazo.com/2b34f6a8b0d60762f59de667cbbc07ec.png)](https://gyazo.com/2b34f6a8b0d60762f59de667cbbc07ec)

### 3.ユーザ個人ページ
####  中央
- ユーザプロフィール
- ユーザトップ画像
- ユーザ投稿一覧
- ユーザいいね 一覧
[![ユーザ個人ページ](https://i.gyazo.com/43b92bb15720b18c3d718b72a9732a17.png)](https://gyazo.com/43b92bb15720b18c3d718b72a9732a17)

### 4.ジャンル別投稿一覧
[![ジャンル別投稿一覧](https://i.gyazo.com/934ccbb7ec7d379eac7b05b096158617.png)](https://gyazo.com/934ccbb7ec7d379eac7b05b096158617)

### 5.コメントページ
#### 中央
- コメント記入欄
- コメント一覧表示
#### 右サイドバー
- 投稿にいいねしたユーザー一覧
[![コメント機能](https://i.gyazo.com/e813f8c15800e51e8a2f1032c16771bb.png)](https://gyazo.com/e813f8c15800e51e8a2f1032c16771bb)

### 6.ニュース閲覧ページ
#### 中央
- ニュースAPIを利用してドメインごとにニュースを表示
- タイトルリンクをクリックすることで、該当するニュースの外部ページへ移動
[![ニュース閲覧ページ](https://i.gyazo.com/a3c5358b1295975e4aa862eb0e95c712.jpg)](https://gyazo.com/a3c5358b1295975e4aa862eb0e95c712)

### 7.各入力フォーム
#### ユーザー登録フォーム(写真はページを縮小して撮影)
[![ユーザ登録フォーム](https://i.gyazo.com/3f842253034434a5fda3541f0db7f91c.png)](https://gyazo.com/3f842253034434a5fda3541f0db7f91c)
#### ログインフォーム
[![ログインフォーム](https://i.gyazo.com/f6c51210f1417c0dec99296e260c2d0b.png)](https://gyazo.com/f6c51210f1417c0dec99296e260c2d0b)
#### ユーザ情報編集(写真はページを縮小して撮影)
- 管理者ユーザー以外はアカウント削除ボタンが表示される
[![ユーザー情報編集](https://i.gyazo.com/f90d1a2fe53bde54981fd3958b0d3305.png)](https://gyazo.com/f90d1a2fe53bde54981fd3958b0d3305)
#### 投稿フォーム
[![投稿フォーム](https://i.gyazo.com/ae27ab85e8c5c3e6518ea98fce2c6e3d.png)](https://gyazo.com/ae27ab85e8c5c3e6518ea98fce2c6e3d)

