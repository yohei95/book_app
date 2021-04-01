# BookDo

BookDo は本を読んで終わりにせず、実生活に活かすための ToDo 型の読書管理アプリです。<br>
ゲストログイン機能を用意してあります。

[リンク]：( https://bookdo.net)

![177ab47e05d11df4fe1245d2546ec83d](https://user-images.githubusercontent.com/79436585/113232977-28807d80-92d9-11eb-9da4-72629dc00d1e.jpeg)

## 使用技術

- フロントエンド
  - HTML/CSS
  - JQuery
  - bootstrap
- バックエンド
  - Ruby: 2.6.5
  - Rails: 6.0.3.5
  - Rspec(テスト)
  - Rubocop（コード解析ツール）
- インフラ・開発環境
  - MySQL: ５.6
  - Docker/docker-compose
  - AWS(EC2・S3・ACM・Route53)
  - CircleCI

## なぜ BookDo を開発したか？

本は読んだ学びを実生活に活かしてこそ価値があると考えたためです。<br>
これまでの読書体験の中で、読み終えることに満足してしまうという問題意識がありました。<br>
読んでいる最中はモチベーションが上がり、新しい知識をどう活かそうか思い描いてはワクワクするのですが、
また変わらぬ日常に戻ってしまう。
時間が経つと、内容を全く思い出せないようなものも。。<br>
そこで、

- 本で得た学びを具体的にどう活かすかを言語化して投稿
- 投稿した内容を ToDo として管理

することでより良い読書体験に繋げることができると考え、開発に至りました。

## 機能一覧

- ユーザー登録機能
- ゲストログイン機能
- ユーザーログイン機能
- ユーザー登録情報編集・削除機能
- ユーザーフォロー機能
- ユーザー詳細・一覧表示機能
- 記事投稿機能
- 記事編集・削除機能
- 記事詳細・一覧表示機能
- コメント機能
- 画像ファイルアップロード機能
- いいね機能
- タスク完了管理機能
- ページネーション機能

## 工夫した点

- デプロイ先を Heroku から AWS に変更したことで読み込みの速度を短縮
- シンプルで見やすい UI を意識
- いいね、完了、フォロー機能において Ajax を採用
- 投稿と完了の時間軸を切り分け、尚且つフォロー機能や完了リストを搭載することで利用者のモチベーションに配慮

## ER 図

![book](https://user-images.githubusercontent.com/79436585/113245579-355d9b00-92f2-11eb-94cb-e205c3734523.png)
