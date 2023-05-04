# Blog

ブログシステム

## Ruby version

- See `.ruby-version`.

## Rails version

- See `Gemfile`.

## プロジェクトのセットアップ手順

### Dockerを使った環境準備(イメージのビルド)

```
docker compose build
```

### railsサーバーの起動(バックグラウンドでのコンテナの立ち上げとrailsサーバーの起動)

```
docker compose up -d
```

### コンテナ内に入る(rails・bundler・yarn関係のコマンドはコンテナ内で実行します)

```
docker compose exec web bash
```

### Gemのインストール

```bash
bundle install
```

### node_modulesのインストール

```bash
yarn install
```

### データベースの作成(コンテナ内で実行してください)

```bash
bin/rails db:create
```

### 初期データの入れ込み(コンテナ内で実行してください)

```bash
bin/rails db:seed_fu
```

### CSS, JS用のサーバー起動(コンテナ内で実行してください・ターミナルで複数のタブを開くとやりやすいでしょう)

```
bin/dev
```

### Dockerコンテナの終了

```bash
docker compose down
```

### デバッグツールを使うときは

#### railsサーバーを立ち上げているコンテナの名前を確認する

```bash
docker ps
```

#### 該当のコンテナIDをattachする

```bash
docker attach コンテナ名
```

### 開発用管理画面ログイン方法(ブラウザで行います)

`localhost:3000/login_as/1` にアクセス
※ 1はユーザーIDなのでDBに入っているユーザーのIDによって異なることがあります。
