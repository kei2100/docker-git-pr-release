#!/bin/bash

docker build -t kei2100/git-pr-release .
docker push kei2100/git-pr-release

