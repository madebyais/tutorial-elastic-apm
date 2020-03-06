#!/bin/sh

ELASTIC_APM_SERVER_URL=http://localhost:8200 \
ELASTIC_APM_SERVICE_NAME=go-app-apm-sample \
go run main.go 