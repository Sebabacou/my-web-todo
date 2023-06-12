#!/bin/bash

docker-compose down

API_NAME=$(grep "API_NAME=" .env | cut -d "=" -f2)
API_TAG=$(grep "API_TAG=" .env | cut -d "=" -f2)

docker rmi $API_NAME:$API_TAG

save_value=$(grep "API_TAG=" .env)
tag_value=$(grep "API_TAG=" .env | cut -d "=" -f2 | cut -d "." -f3)
value_to_add=$(grep "API_TAG=" .env | cut -d "=" -f2 | cut -d "." -f2)

new_value=$(($tag_value + 1))

sed -i "s/$save_value/API_TAG=V.$value_to_add.$new_value/g" .env

docker-compose up --build
