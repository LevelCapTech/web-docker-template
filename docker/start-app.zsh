#!/bin/zsh

# 本番環境に移動
cd "<TODO:project_path>/docker/prod"

# コンテナ起動
docker-compose -p <TODO:application_name> up -d

# コンソール出力
echo "Application has been started!"