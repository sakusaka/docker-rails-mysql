

参考サイト
https://qiita.com/saitoeku3/items/b1aa2ae143624e551aea
https://fuqda.hatenablog.com/entry/2019/03/21/204118
http://nanaco-programming.hatenablog.com/entry/2019/04/09/134329

キャッシュ残るので、docker-compose run web bundle install は行わず
docker-compose build --no-cache　を直接する

RUN gem install mysql2 -v '0.5.2' --source 'https://rubygems.org/' -- --with-cppflags=-I/usr/local/opt/openssl/include --with-ldflags=-L/usr/local/opt/openssl/lib


$ docker-compose run web bundle exec rails new . --force --database=mysql --skip-bundle

Starting docker-rails-mysql_db_1 ... error

ERROR: for docker-rails-mysql_db_1  Cannot start service db: driver failed programming external connectivity on endpoint docker-rails-mysql_db_1 (06b28ddb57482de9a15f5ff0548eb660878b7a76cb7dd84eae653c3a18281c55): Bind for 0.0.0.0:3306 failed: port is already allocated

ERROR: for db  Cannot start service db: driver failed programming external connectivity on endpoint docker-rails-mysql_db_1 (06b28ddb57482de9a15f5ff0548eb660878b7a76cb7dd84eae653c3a18281c55): Bind for 0.0.0.0:3306 failed: port is already allocated
ERROR: Encountered errors while bringing up the project.

$ sudo lsof -i:3306
COMMAND    PID              USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
com.docke 1812 takehikoogasawara   15u  IPv6 0x97628f3e6300d2b7      0t0  TCP *:mysql (LISTEN)
$ sudo kill 1812

# よく使うコマンド
## コンテナをビルド
$ docker-compose build
## コンテナの作成＆起動（バックグラウンド）
$ docker-compose up -d
## コンテナが削除される
docker-compose down
## 今あるイメージを確認
docker images
## イメージの削除
docker rmi image_id
## コンテナの確認（-aなしだと起動中のコンテナのみ）
docker ps -a
## コンテナの削除
docker rm container_id
# コンテナをビルド
docker-compose build
# コンテナの起動
docker-compose start
# コンテナの作成＆起動
docker-compose up
# コンテナの停止
docker-compose stop
# コンテナの停止＆削除
docker-compose down
# bundle installを実行 うまくいかないかも？
docker-compose exec web bundle install
# db関係（例）
docker-compose exec web rails db:create
# railsコマンド（例）
docker-compose exec web rails g controller controller_name