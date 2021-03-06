# BookDo

BookDo は本を読んで終わりにせず、実生活に活かすための ToDo 型の読書管理アプリです。<br>
ゲストログイン機能を用意してあります。

[リンク]：( https://bookdo.net)

![トップページ](https://user-images.githubusercontent.com/79436585/113660586-69b0cd00-96df-11eb-9d99-b3851d811804.jpeg)

## 使用技術

- フロントエンド
  - HTML/CSS
  - JavaScript
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
  - AWS(VPC・EC2・S3・ACM・Route53)
  - CircleCI

## なぜ BookDo を開発したか？

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
- 記事検索機能（タイトル、タグ）
- コメント機能
- 画像ファイルアップロード機能
- いいね機能
- タスク完了管理機能
- ページネーション機能

## 工夫した点

- シンプルで見やすい UI を意識
- いいね、完了、フォロー機能において Ajax を採用し、ユーザーのストレスを軽減
- フォロー機能や完了リストを実装することで利用者のモチベーションに配慮
- CircleCI を用いてテスト、デプロイを自動化

## インフラ構成図

![名称未設定ファイル (1)](https://user-images.githubusercontent.com/79436585/113662073-52271380-96e2-11eb-8361-314a66a1fd9c.png)

## ER 図

![book2](https://user-images.githubusercontent.com/79436585/114111952-3d32c600-9916-11eb-8e43-7af227b7a8ec.png)
