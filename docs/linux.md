# Linux

## 개요

- 리눅스는 1991년 9월 17일 리누스 토르발스가 처음 출시한 운영 체제 커널인 리눅스 커널에 기반을 둔 오픈 소스 유닉스 계열 운영 체제 계열이다. 리눅스는 일반적으로 리눅스 배포판 안에 패키지 처리된다. - 위키백과

## 명령어

### 프로그램 추가삭제 (Ubuntu 환경)

- 프로그램 설치  
  `sudo apt install [패키지]`
- 프로그램 제거  
  `sudo apt remove --auto-remove [패키지]` 단순 제거  
  `sudo apt purge --auto-remove [패키지]` 설정까지 제거
- 프로그램 목록 조회  
  `apt list --installed`
- 특정 프로그램 설치 여부 조회  
  `apt policy [패키지]`

### 시스템

- 로그아웃  
  `exit`
- 리부팅  
  `reboot`

### 파일

- 현재 폴더(.)를 어떤 아이디의 계정으로 소유권 변경  
  `chown [계정아이디] .`
- 현재 폴더 읽기쓰기권한 변경  
  `chmod 777 .`
- 디렉토리 삭제  
  `rmdir [디렉토리이름]`
- 파일 삭제  
  `rm [파일이름]`
- 파일 복사  
  `cp [파일이름] [목적지경로]`
- 홈으로 이동  
  `cd $home` 또는 `cd ~`

```
lsof -i TCP:5000 특정 포트 사용하는 프로세스 찾기

[우분투]
su 루트권한 얻기
su -root 루트권한 생성
vi xxx.php (편집)
i 편집시작
ESC 편집종료
:wq 저장하고 나가기
:q 나가기
:q! 저장안하고 나가기
아파치재시작
sudo service apache2 restart
which php (php가 설치된 경로 얻기)
ctrl+c (실행중인 프로그램 종료)
apt update
apt install xxx
npm i xxx

자바설치
[centos]
yum -y update 업데이트
yum install java-1.8.0-openjdk 자바 설치
java -version 설치 확인

(아마존 리눅스)
sudo yum install -y java-1.8.0-openjdk-devel.x86_64 (자바8 설치)
sudo yum install java-11-openjdk-devel -y (자바11 설치)
sudo yum remove java-1.7.0-openjdk -y 자바7 삭제
java -version 설치 확인

(JDK 버전 선택)
alternatives --config java

ifconfig 아이피 확인
ctrl+z 프로세스 일시 정지
ctrl+c 프로세스 종료
jobs 내가 로그인해서 실행한 프로세스 확인
disown jobs 목록에 있는 프로세스를 터미널에서 독립시킨다. 푸티 닫아도 프로세스 종료 안된다
fg %1 //1번 job을 포어그라운드로
bg %1 //1번 job을 백그라운드로 (아마존 리눅스에선 이것만 해도 창 닫아도 종료 안되더라)
kill pid
kill -9 pid 프로세스 강제 종료
웹브라우징
curl --location --request GET "http://localhost:8080/api/epay/kyc-interface" 윈도우

방화벽 확인
firewall-cmd --add-port=80/tcp --zone=public --permanent
firewall-cmd --add-port=22/tcp --zone=public --permanent
firewall-cmd --add-port=8080/tcp --zone=public --permanent
firewall-cmd --reload 포트 갱신
firewall-cmd --list-ports 열린 포트 확인

foo & 백그라운드에 실행

[sudo 계정 생성]
root 로 로그인
adduser tomcat 계정 생성
passwd hanpasstomcat2017! 패스워드 정의
usermod -aG wheel tomcat 휠 그룹에 참여 (휠 그룹은 sudo 권한 가짐)
su - tomcat 현재 로그인 계정을 tomcat으로 바꿈

sudo ls -la /root 루트 디렉토리 조회 (sudo 권한이 있는 유저만 root 디렉토리 조회할 수 있음)
/etc/systemd/system/hanpassj-pay.service 서비스 파일 생성
chmod +x hpay.jar 실행가능한 파일로 권한 변경
systemctl start/stop/status hanpassj-pay

ps 프로세스 목록 확인
netstat -tulpn | grep LISTEN 사용중인 포트와 프로그램 나열
ps -ef 프로세스 모두 나열 (전체,자세히)
ps -ef | grep java (java 이름을 가진 프로세스 나열)
ps -fcu tomcat (tomcat 유저의 모든 프로세스 정보 나열 , 정보에서 TTY는 접속된 터미널을 의미)

ls -l 파일 권한 표시
ls -a 모든 파일 표시
```
