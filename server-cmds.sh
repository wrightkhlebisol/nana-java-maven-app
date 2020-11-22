#!/usr/bin/env bash

export TAG=java-maven-1.0
docker-compose -f docker-compose.yaml up --detach
echo "success"
