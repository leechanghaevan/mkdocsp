# WSL

> 리눅스용 윈도우 하위 시스템은 윈도우 10에서 네이티브로 리눅스 실행 파일을 실행하기 위한 호환성 계층이다. -위키백과

## 참고

- <https://blogger.pe.kr/853>
- <https://m.blog.naver.com/seongjin0526/221778212779>
- <https://www.tuwlab.com/29342>

## 설치

- docker desktop 설치
- WSL2 Linux Kernel 설치 (도커 설치시 자동으로 설치 가이드 된다)
- `wsl --set-default-version 2` 버전 2 사용 명시
- 마이크로소프트스토어에서 ubuntu 20.03 LTS 설치
- 탐색기에 `\\wsl$` 치면 공유 폴더로 파일 시스템 접속 가능

## SSH 서버 실행

- `ifconfig -a` (sudo apt-get install net-tools) 설치후. 아이피주소 확인
- `sudo vi /etc/ssh/sshd_config` PasswordAuthentication 옵션을 찾아 yes로 변경하고 저장한다.
- `sudo ssh-keygen -A` SSH 호스트키 생성
- `sudo service ssh start` SSH 서버 시작
- `ssh 172.18.141.126` SSH 접속해 보기
