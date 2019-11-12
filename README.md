# 構築手順
※ 参考サイト：https://docs.docker.com/compose/rails/

## 基本ファイルを生成
- Dockerfile
- docker-pompose.yml
- Gemfile
- Gemfile.lock
- entrypoint.sh

## 初回起動時
```
$ docker-compose run web rails new . --force --no-deps --database=mysql
config/database.yml書き換え
$ docker-compose build
$ docker-compose up -d
$ docker-compose run web rake db:create
```

## 毎度起動
$ docker-compose up -d

## Railsコマンド実行例
$ docker-compose run web rails g controller members

## 確認用URL
http://localhost:3001
