#!/bin/bash
set -e

date=$(date '+%Y%m%d')
git_hash=$(git rev-parse --short HEAD)
git_branch=$(git branch --show-current)

# rails_image="kinlong/simple_blog_rails:${date}-${git_branch}-${git_hash}-3"
nginx_image="kinlong/simple_blog_nginx:${git_branch}-${date}-${git_hash}"

# docker build -f Dockerfile.prod.rails . -t "${rails_image}"
# docker build --build-arg rails_image=${rails_image} -f Dockerfile.prod.nginx . -t "${nginx_image}"
docker build -f Dockerfile.prod.nginx . -t "${nginx_image}"

# docker push "${rails_image}"
docker push "${nginx_image}"
