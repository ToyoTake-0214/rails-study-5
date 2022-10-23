# Blog

ブログシステム

## Ruby version

- See `.ruby-version`.

## Rails version

- See `Gemfile`.

## プロジェクトのセットアップ手順

### Dockerイメージの構築

```bash
docker-compose build
```

### Dockerコンテナの構築&起動

#### 通常の起動

```bash
docker-compose up
```

### Dockerコンテナを終了する

```bash
docker-compose down
```

### データベースの作成

```bash
cp config/database.yml.default config/database.yml
docker-compose run web rails db:create
```

### データベースのマイグレーション

```bash
docker-compose run web rails db:migrate
```

### 初期データの入れ込み

```bash
docker-compose run web rails db:seed_fu
```

### jsファイル&sassファイルのビルド&変更反映用

```bash
docker-compose run web bin/dev
```

## Dockerを使う上での注意点

### Gemfileを編集したらDockerイメージに変更を反映させる

#### bundle installする

```bash
docker-compose run web bundle install
```

#### GemfileとGemfile.lockを反映する

```bash
docker-compose build --force-rm
```

### デバッグツールを使うときは

#### railsサーバーを立ち上げているコンテナのIDを確認する

```bash
docker container ls
```

#### 該当のコンテナIDをattachする

```bash
docker attach コンテナID
```

### ログイン方法

`localhost:3000/login_as/1` にアクセス
※ 1はユーザーIDなのでDBに入っているユーザーのIDによって異なることがあります。
