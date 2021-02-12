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
- tsconfig.json 에 내용 추가 1  
  `"module": "es2015"` (추천) import 사용, node_modules 가져올때 경로를 디테일하게 지정해 주어야 하는 경로 문제가 발생한다.  
  `"module": "commonjs"` (비추) require 사용, 컴파일 에러는 발생하지 않으나, 번들러를 통해 소스를 통합시켜 주지 않으면 브라우저에서 로딩이 안된다.
- tsconfig.json 에 내용 추가 2  
  `"sourceMap":"true"`  
  `"outDir":"./dist"`  
  `"rootDir":"./src"`
- ts 소스 빌드  
  `shift + ctrl + b` 또는 터미널에서 `tsc`

### 1.1.3. vscode 디버깅

- 로컬 웹서버 실행 (live server 또는 webpack-dev-server)
- launch.json 에서 디버깅 URL 로컬 웹서버와 같이 맞추기
- 디버깅 실행  
  `f5`

### 1.1.4. vscode 에서 ts 빌드시 아무 방해 메세지도 안뜨게 하는 법

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

### 1.1.5. webstorm 디버깅

- 크롬 스토어에서 Jetbrain 확장 설치
- webstorm에서 html 파일 우클릭 후 debug 실행 (내장 웹서버 실행됨)

### 1.1.6. webstorm 에서 ts 빌드 매크로 만들기

- start macro
- Compile typescript
- Debug > Rerun
- stop macro
- Debug 선택 후 `shift + ctrl + b` 로 실행

### 1.1.7. 문법

타입 종류

- boolean
- number
- string
- array `list:number[]`
- tuple `point:[string, number]`
- enum `enum Color {Red=1, Green, Blue}`
- any
- void
- null
- undefined 변수 초기값
- object

유저 타입 정의  
`type UNIQID = string | null`

유저 타입 정의 (특정 값만 받아들이게)  
`type USER_TYPE = 'TESTER' | 'ADMIN'`

함수의 모든 파라미터 사용하기

```typescript
function foo() {
  console.log(arguments[0]);
  console.log(arguments[1]);
}
```

사용자 정의 데이터 타입

```typescript
type ChatMsg = {
  uid: string;
  nam: string;
  typ: string;
  tim: string;
  msg: string;
};
//또는
class ChatMsg {
    uid!: string;
    nam!: string;
    typ!: string;
    tim!: string;
    msg!: string;
}

//사용법
let msg:ChatMsg = = {nam:"111", typ:"2222", msg:"ddd", id:"d", tim:"ddd"};
```
