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
[![Image from Gyazo](https://i.gyazo.com/980a402698fa37438f6d557522354553.png)](https://gyazo.com/980a402698fa37438f6d557522354553)
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
[![Image from Gyazo](https://i.gyazo.com/e06f1f6cbd4925105950a48b776dda09.png)](https://gyazo.com/e06f1f6cbd4925105950a48b776dda09)

### 3.ユーザ個人ページ
[![Image from Gyazo](https://i.gyazo.com/b92591e5fc64c3a3c7894b75d15aaede.png)](https://gyazo.com/b92591e5fc64c3a3c7894b75d15aaede)
####  中央
- ユーザプロフィール
- ユーザトップ画像
- ユーザ投稿一覧
- ユーザいいね 一覧


### 4.ジャンル別投稿一覧
[![Image from Gyazo](https://i.gyazo.com/41c46036002234377d0babf5b4a65bc7.png)](https://gyazo.com/41c46036002234377d0babf5b4a65bc7)

### 5.コメントページ
[![Image from Gyazo](https://i.gyazo.com/4b4d340bf67b61a16eb6526c3138a7ba.png)](https://gyazo.com/4b4d340bf67b61a16eb6526c3138a7ba)
#### 中央
- コメント記入欄
- コメント一覧表示
#### 右サイドバー
- 投稿にいいねしたユーザー一覧


### 6.ニュース閲覧ページ
[![Image from Gyazo](https://i.gyazo.com/77ef89348283c9ae6114b28e09458f1d.jpg)](https://gyazo.com/77ef89348283c9ae6114b28e09458f1d)
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

