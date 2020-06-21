# [Rails + jQuery]NewsAPIを使ったニュースの閲覧＋投稿機能を備えたSNSアプリ
### https://output-yournews-349195u42952.herokuapp.com/
- お試しログインボタンから以下のアカウントでログイン可能です
- email:taro@test.com
- password: aaaaaaaa

## アプリ概要
ニュースの閲覧、そしてニュースを共有できるSNSサイトを作成しました。ニュースはインプットの機会は多いですが、実際にアウトプットする機会が非常に少ないと感じたことがきっかけとなり、また、今まで学んだ内容を生かせるものを作りたいという思いから、このアプリの作成に至りました。URLを共有することで、そのニュースに関する議論ができるサイトになればと思っています。

## 工夫した点
サイドバーをテンプレートで作成したことで、どのページからでも、他のページにアクセスできるようにしました。そして、そのための記述量を最低限に抑えることができました。
またビュー に統一感を出すために、CSSでは変数やmixinを作成し、サイズや色の微妙なズレが発生しないようにしました。
いいねやフォロー機能は非同期通信を用いて、リロードやページの最上部に戻らないようにし、利用しやすい仕様になっています。

## 今後の実装
現在はテストコードに記述を行っています。
今後は投稿機能をルーム機能のような形にして、より議論が活発になる仕組みにし、またニュースに限らず、アウトプットができるよう、ジャンルを親、子、孫と選択できるようにしたいと考えています。
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
[![Image from Gyazo](https://i.gyazo.com/56f287ef070345a90c4262909eb27362.png)](https://gyazo.com/56f287ef070345a90c4262909eb27362)
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
[![Image from Gyazo](https://i.gyazo.com/ebc4badf13515c5e718ece001d283b6d.png)](https://gyazo.com/ebc4badf13515c5e718ece001d283b6d)

### 3.ユーザ個人ページ
[![Image from Gyazo](https://i.gyazo.com/ee2de5c5fcb907ea0491339422ca2022.png)](https://gyazo.com/ee2de5c5fcb907ea0491339422ca2022)
####  中央
- ユーザプロフィール
- ユーザトップ画像
- ユーザ投稿一覧
- ユーザいいね 一覧


### 4.ジャンル別投稿一覧
[![Image from Gyazo](https://i.gyazo.com/5709205f159ec37898909f9267d5bed3.png)](https://gyazo.com/5709205f159ec37898909f9267d5bed3)

### 5.コメントページ
[![Image from Gyazo](https://i.gyazo.com/7f6e2c485ea3921b36e620071b581d9d.png)](https://gyazo.com/7f6e2c485ea3921b36e620071b581d9d)
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
#### ユーザー登録フォーム
[![Image from Gyazo](https://i.gyazo.com/2e7bdccdb0fec3f3e468d885a5830919.png)](https://gyazo.com/2e7bdccdb0fec3f3e468d885a5830919)
[![Image from Gyazo](https://i.gyazo.com/2735d5e4cd027a474cb9f358b608560f.png)](https://gyazo.com/2735d5e4cd027a474cb9f358b608560f)
#### ログインフォーム
[![Image from Gyazo](https://i.gyazo.com/1d1957c23356caa65c00cbf4c528f7cf.png)](https://gyazo.com/1d1957c23356caa65c00cbf4c528f7cf)
#### ユーザ情報編集
[![Image from Gyazo](https://i.gyazo.com/314998eba66fd9d7bd1ec6db3a2cb759.png)](https://gyazo.com/314998eba66fd9d7bd1ec6db3a2cb759)
[![Image from Gyazo](https://i.gyazo.com/d6dd1ea8b3848d2383d51abb433aae61.png)](https://gyazo.com/d6dd1ea8b3848d2383d51abb433aae61)
- 管理者ユーザー以外はアカウント削除ボタンが表示される

#### 投稿フォーム
[![Image from Gyazo](https://i.gyazo.com/64c75be30d3bf2fac36433073d8ec120.png)](https://gyazo.com/64c75be30d3bf2fac36433073d8ec120)

