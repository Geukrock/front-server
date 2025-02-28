#!/bin/sh


# 도커 로그인 환경변수 설정
export DOCKER_USERNAME=jsw992@gmail.com
export DOCKER_PASSWORD=sy@1021602


# 도커 로그인 및 도커 이미지 다운로드
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin
docker pull matt1235/plac:latest


# 'plac-server'라는 이름의 도커 컨테이너가 실행 중인 경우, 컨테이너를 중지하고 삭제
if [ $(docker ps -aq -f name=plac-server) ]; then
    docker stop plac-server
    docker rm plac-server
fi


# 도커 컨테이너 실행시 필요한 환경변수 설정
export SERVER_PORT="{생략}"

# 도커 컨테이너 실행
docker run -d \
  --name plac-server \
  -p $SERVER_PORT:8080 \

  matt1235/plac:latest