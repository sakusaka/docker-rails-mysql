# 開発環境構築手順
## rails
docker build -t mybotapp-rails mybotapp/

## nginx
docker build -t mybotapp-nginx k8s/dev/nginx/

## 初回のみ
### rails ファイルを生成する
docker run -v $(pwd)/mybotapp:/mybotapp --rm mybotapp-rails rails new . -G --force --database=mysql --skip-bundle

## コンテナコマンド
### pod開始
kubectl apply -f k8s/dev/yml/rails_pod.yml
### pod終了
kubectl delete -f k8s/dev/yml/rails_pod.yml
