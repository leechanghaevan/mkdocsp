# Docker

## 개요

> 도커는 리눅스의 응용 프로그램들을 소프트웨어 컨테이너 안에 배치시키는 일을 자동화하는 오픈 소스 프로젝트이다. 도커 웹 페이지의 기능을 인용하면 다음과 같다: 도커 컨테이너는 일종의 소프트웨어를 소프트웨어의 실행에 필요한 모든 것을 포함하는 완전한 파일 시스템 안에 감싼다. - 위키백과

## 용어

- 이미지: 파일 하나로 구운 형태
- 컨테이너: 이미지를 풀어서 설정을 정의하고 등록한 상태. 컨테이너는 실행, 종료 두가지 상태를 가진다. 하나의 이미지에서 여러 컨테이너 등록이 가능한다.

## CLI 명령어

- 도커 실행 `docker run --name myhello hello-world` (hello-world 이미지를 컨테이너로 올린다)
- 도커 이미지 리스트 `docker images`
- 도커 컨테이너 리스트 `docker ps -a`
- 도커 (실행중인) 컨테이너 리스트 `docker ps`
- 컨테이너 삭제 `docker rm [컨테이너이름1],[컨테이너이름2]`
- 이미지 삭제 `docker rmi -f [이미지이름]`

## CentOS에 설치

- 참고:<https://docs.docker.com/engine/install/centos/>

## Window에 설치

- (도커는 리눅스 기반이므로 윈도에선 WSL 설치가 필수이다)
- vscode에서 마이크로소프트 도커 플러그인 검색 & 설치
- Docker Desktop 설치하라고 뜸
- 설치 후 리붓
- WSL2 커널을 업데이트 하라고 뜸 <https://aka.ms/wsl2kernel> 로 연결됨
- 연결된 사이트에서 `x64 머신용 최신 WSL2 Linux 커널 업데이트 패키지` 다운로드 후 설치
- 설치후 Docker Desktop Restart

## WSL에 우분투 설치

- WSL을 기본으로 설치하면 빈 리눅스 커널만 존재한다. 우분투를 설치해 보자.
- Window store에 가서 ubuntu를 설치
- 기본 wsl distro 로 ubuntu 지정
  `wsl --setdefault ubuntu`
- 명령창에서 wsl 실행 (종료는 exit)
  `wsl`

## Docker Desktop 실행시 튜토리얼

- 깃헙에서 샘플 이미지 다운로드  
  `docker run --name repo aline/git clone https://github.com/docker/getting-started.git`
- 다운받은 파일들을 getting-started 폴더로 복사  
  `docker cp repo:/git/getting-started/ .`
- 이동  
  `cd getting-started`
- 현재 폴더를 이미지로 빌드  
  `docker build -t docker101tutorial .`
- 내 도커 이미지를 컨테이너로 실행 (한번 실행해 두면 도커 대시보드에 등록된다)  
  `cd docker run -d -p 80:80 --name docker-tutorial docker101tutorial`
- 브라우저에서 확인  
  [http://127.0.0.1/](http://127.0.0.1/)

## mariadb 실행

- <https://hub.docker.com/_/mariadb>
- `docker pull mariadb`
- `docker run --name some-mariadb -p 80:80 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:tag`

## nginx 실행

- `docker pull nginx` 도커허브에서 이미지 설치
- 대시보드에서 이미지 클릭 후 Run
- 포워딩할 Port 지정
- Webroot 폴더 마운트 (Host Path 내부 경로 / Container Path 이미지 내부 경로)
- 위의 3단계를 명령어로 바꾸면  
  `docker run -it --rm -d -p 80:80 --name mynginx -v /mnt/e/webroot:/usr/share/nginx/html nginx`

## redis 실행

- `docker pull redis`
- 외부 폴더에 데이터 저장소를 두고 싶을 경우  
  `docker run --name some-redis -d -v /mnt/e/redis:/data redis redis-server --appendonly yes`
- 다른 컨테이너에 저장소를 두고 싶은 경우  
  `docker run --name some-redis -d --volumes-from some-volume-container redis redis-server --appendonly yes`

## 도커 설치 (centos)

## 부팅시 도커 서비스 자동 실행 등록

- `$ sudo systemctl enable docker.service`
- `$ sudo systemctl enable containerd.service`
