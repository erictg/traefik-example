#!/usr/bin/env bash

docker build -t api_1 -f api_1.dockerfile .
docker build -t api_2 -f api_2.dockerfile .
docker build -t test_nginx -f nginx.dockerfile .