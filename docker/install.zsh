#!/bin/zsh

# 開発環境へ移動
cd "<TODO:project_path>/docker/prod"

# 滅びの魔法（コンテナ停止と削除）
docker-compose down --rmi all --volumes --remove-orphans

# ビルド実行
docker-compose build

# TODO: start-app.ps1を参照するように変更する場合、外部実行を確認
# コンテナ起動
docker-compose -p <TODO:application_name> up -d

# 起動待機（3.5秒）
sleep 3.5

# 起動状態確認
docker ps