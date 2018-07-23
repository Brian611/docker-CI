#!/bin/bash
docker build -t brianpooe/sample-node .
docker push brianpooe/sample-node

ssh -t -i /home/brian/Downloads/Docker.pem deploy@ec2-54-88-235-204.compute-1.amazonaws.com << EOF
docker pull brianpooe/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi brianpooe/sample-node:current || true
docker tag brianpooe/sample-node:latest brianpooe/sample-node:current
docker run -d --restart always --name web -p 3000:3000 brianpooe/sample-node
EOF