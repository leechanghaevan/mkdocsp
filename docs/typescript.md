# 1. Typescript

> 타입스크립트는 자바스크립트의 슈퍼셋인 오픈소스 프로그래밍 언어이다. 마이크로소프트에서 개발, 유지하고 있으며 엄격한 문법을 지원한다. C#의 리드 아키텍트이자 델파이, 터보 파스칼의 창시자인 Anders Hejlsberg가 개발에 참여한다. - 위키백과

## 1.1. 타입 스크립트 빌드 + 디버깅 하기

### 1.1.1. 사전 준비 사항

- vscode에 Debugger for Chrome 확장 설치
- 타입 스크립트 설치  
  `npm i typescript -g`

### 1.1.2. 빌드

- tsconfig.json 생성  
  `tsc --init`
- tsconfig.json 에 내용 추가  
  `"sourceMap":"true"`  
  `"outDir":"./dist"`  
  `"rootDir":"./src"`
- ts 소스 빌드  
  `shift + ctrl + b` 또는 터미널에서 `tsc`

### 1.1.3. 디버깅

- 로컬 웹서버 실행 (live server 또는 webpack-dev-server)
- launch.json 에서 디버깅 URL 로컬 웹서버와 같이 맞추기
- 디버깅 실행  
  `f5`

### 1.1.4. ts 소스 빌드시 아무 방해 메세지도 안뜨게 하는 법

- `f1`
- `tasks:configure default build task` 선택
- .vscode 폴더안에 tasks.json 생성 확인
- tasks.json 내용 아래와 같이 추가

```json
      "presentation": {
        "reveal": "silent",
        "clear": true,
        "showReuseMessage": false
      }
```

- `shift + ctrl + b` 로 빌드
