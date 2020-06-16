# [Rails + jQuery]NewsAPIを使ったニュースの閲覧＋投稿機能を備えたSNSアプリ
### https://output-yournews-349195u42952.herokuapp.com/
- お試しログインボタンから以下のアカウントでログイン可能です
- email:taro@test.com
- password: aaaaaaaa

## アプリ概要
ニュースの閲覧、そしてニュースを共有できるSNSサイトを作成しました。ニュースはインプットの機会は多いですが、実際にアウトプットする機会が非常に少ないと感じたことがきっかけとなりました。URLを共有することで、そのニュースに関する議論ができるサイトになればと思っています。

## 工夫した点
サイドバーをテンプレートで作成したことで、どのページからでも、他のページにアクセスできるようにしました。そして、そのための記述量を最低限に抑えることができました。
またビュー に統一感を出すために、CSSでは変数やmixinを作成し、サイズや色の微妙なズレが発生しないようにしました。
いいねやフォロー機能は非同期通信を用いて、リロードやサイトのトップに戻らないようにし、利用しやすい仕様になっています。

## 今後の実装
現在はテストコードに記述を行っています。
今後は投稿詳細ページをルームのような形にして、より議論が活発になる仕組みにし、またニュースに限らず、アウトプットができるよう、ジャンルを親、子、孫と選択できるようにしたいと考えています。
機能以外では、デプロイ先をAWSに変更する、Dockerを使用する方針です。


## 開発環境
- Ruby on Rails
- jQuery
- VSCode
- Github
- Heroku(AWSに変更予定)
- Docker(設定準備中)

## アプリの機能

### 1.ログイン後トップページ
[![Image from Gyazo](https://i.gyazo.com/e236a4fbe0a2fe719c0bd41086741439.png)](https://gyazo.com/e236a4fbe0a2fe719c0bd41086741439)
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


### 2.ユーザー一覧ページ
[![Image from Gyazo](https://i.gyazo.com/5139bf958b3e255ea062541f24cee185.png)](https://gyazo.com/5139bf958b3e255ea062541f24cee185)

### 3.ユーザ個人ページ
[![Image from Gyazo](https://i.gyazo.com/15ff0bf4224ae447c42616521e7b451e.png)](https://gyazo.com/15ff0bf4224ae447c42616521e7b451e)
####  中央
- ユーザプロフィール
- ユーザトップ画像
- ユーザ投稿一覧
- ユーザいいね 一覧


### 4.ジャンル別投稿一覧
[![Image from Gyazo](https://i.gyazo.com/a6cc7e3fef2b46818b46cfadce8b3a10.png)](https://gyazo.com/a6cc7e3fef2b46818b46cfadce8b3a10)

### 5.コメントページ
[![Image from Gyazo](https://i.gyazo.com/3e0e02ff7ae7cb6ad9f9967b4f47c77f.png)](https://gyazo.com/3e0e02ff7ae7cb6ad9f9967b4f47c77f)
#### 中央
- コメント記入欄
- コメント一覧表示
#### 右サイドバー
- 投稿にいいねしたユーザー一覧


### 6.ニュース閲覧ページ
[![Image from Gyazo](https://i.gyazo.com/dea32f97e0ec107c2d4f3aad042c3bc4.jpg)](https://gyazo.com/dea32f97e0ec107c2d4f3aad042c3bc4)
#### 中央
- ニュースAPIを利用してドメインごとにニュースを表示
- タイトルリンクをクリックすることで、該当するニュースの外部ページへ移動


### 7.各入力フォーム
#### ユーザー登録フォーム(写真はページを縮小して撮影)
[![Image from Gyazo](https://i.gyazo.com/706fc716aa4f2a9a8dd432e882ff6207.png)](https://gyazo.com/706fc716aa4f2a9a8dd432e882ff6207)
#### ログインフォーム
[![Image from Gyazo](https://i.gyazo.com/7f5b624ba4b7766820781a2d8cc5cd31.png)](https://gyazo.com/7f5b624ba4b7766820781a2d8cc5cd31)
#### ユーザ情報編集(写真はページを縮小して撮影)
[![Image from Gyazo](https://i.gyazo.com/6b587a70e9c833b24af4349b4ff7b6de.png)](https://gyazo.com/6b587a70e9c833b24af4349b4ff7b6de)
- 管理者ユーザー以外はアカウント削除ボタンが表示される

#### 投稿フォーム
[![Image from Gyazo](https://i.gyazo.com/9bc7eb09b4a24c8a1329cb7380723890.png)](https://gyazo.com/9bc7eb09b4a24c8a1329cb7380723890)

