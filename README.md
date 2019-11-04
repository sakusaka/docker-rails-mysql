参考サイト
https://qiita.com/saitoeku3/items/b1aa2ae143624e551aea


$ docker-compose run web bundle exec rails new . --force --database=mysql --skip-bundle

Starting docker-rails-mysql_db_1 ... error

ERROR: for docker-rails-mysql_db_1  Cannot start service db: driver failed programming external connectivity on endpoint docker-rails-mysql_db_1 (06b28ddb57482de9a15f5ff0548eb660878b7a76cb7dd84eae653c3a18281c55): Bind for 0.0.0.0:3306 failed: port is already allocated

ERROR: for db  Cannot start service db: driver failed programming external connectivity on endpoint docker-rails-mysql_db_1 (06b28ddb57482de9a15f5ff0548eb660878b7a76cb7dd84eae653c3a18281c55): Bind for 0.0.0.0:3306 failed: port is already allocated
ERROR: Encountered errors while bringing up the project.

$ sudo lsof -i:3306
COMMAND    PID              USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
com.docke 1812 takehikoogasawara   15u  IPv6 0x97628f3e6300d2b7      0t0  TCP *:mysql (LISTEN)
$ sudo kill 1812

# コンテナをビルド
$ docker-compose build
# コンテナの作成＆起動（バックグラウンド）
$ docker-compose up -d

docker-compose down（コンテナが削除される）
