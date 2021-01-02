# Node.js

## 개요

> Node.js는 확장성 있는 네트워크 애플리케이션 개발에 사용되는 소프트웨어 플랫폼이다. 작성 언어로 자바스크립트를 활용하며 Non-blocking I/O와 단일 스레드 이벤트 루프를 통한 높은 처리 성능을 가지고 있다. - 위키백과

- Socket.io 는 브라우저에서 웹소켓을 지원하던 지원하지 않던 관계없이 실시간 웹통신을 가능하게 에뮬레이션 해 주는 nodejs 라이브러리이다. (즉 개발에서 웹소켓을 직접 사용할 필요가 없다는 뜻)

## 설치

- Windows:  
  직접 다운로드 또는 choco로 설치  
  `choco install nodejs -y`

## npm 사용법

- 글로벌로 설치  
  `npm install xxx -g`
- 현재 폴더에 설치  
  `npm install xxx`
- 현재 폴더에 설치 하고 package.json에 추가
  `npm install xxx --save`
- 글로벌에서 설치 삭제  
  `npm uninstall xxx -g`
- 글로벌 설치 목록 조회  
  `npm list -g`

## 새 프로젝트 생성

- 프로젝트명 빈 폴더 생성  
  `mkdir [프로젝트폴더]`  
  `cd [프로젝트폴더]`
- 프로젝트 초기화  
  `npm init`
- 디펜던시 편집  
  `package.json`
- 라이브러리 설치  
  `npm install`
- 특정 라이브러리 설치 (+ package.json에 추가)
  `npm install [라이브러리이름] --save`

## express, socket.io 프로젝트 생성

- 가이드: <https://expressjs.com/ko/starter/installing.html>  
  `mkdir [프로젝트폴더]`  
  `cd [프로젝트폴더]`  
  `npm init`  
  `npm install socket.io --save`
  `npm install express --save`

## 참고

1. [Node.js] Socket.IO와 Redis를 활용한 채팅 서버 개발: <https://library.gabia.com/contents/infrahosting/8018/>
2. Nodejs Native module
