# 1. Virtual Space (메타버스) 프로젝트

> 3D 소셜 공간을 웹 기반으로 구현한다.

데모: <http://vreal.ipdisk.co.kr/vb/build/>  
소스코드: <https://github.com/leechanghaevan/metaverse>  
기술노트: <https://leechanghaevan.github.io/mkdocsp/_metaverse/>

## 1.1. 사용기술

- threejs
- nodejs
- socketio
- typescript

## 1.2. 프로젝트 설정

### 1.2.1. 프로젝트 생성 과정

- `npm i -g typescript`
- `npm i -g parcel`
- `mkdir metaverse`
- `cd metaverse`
- `npm init`
- `npm i three`
- `npm i jquery`
- `npm i -D @types/jquery`
- `npm i socket.io-client`
- `npm i -D @types/socket.io-client`

### 1.2.1. 프로젝트 생성 과정 (with 리액트)

- `npx create-react-app metaverse-react-ts --template typescript`
- `cd metaverse-react-ts`
- `npm i three`
- `npm i jquery`
- `npm i -D @types/jquery`
- `npm i socket.io-client`
- `npm i -D @types/socket.io-client`

### 1.2.2. 타입 스크립트 설정

tsconfig.json

```json
"compilerOptions": {
    "target": "es5"
    "module": "es2015"
    "sourceMap": true
    "outDir": "./dist",
    "rootDir": "./_src",
    "removeComments": true,
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
},
"exclude": ["node_modules"]
```

기타 설정은 [typescript](typescript.md) 참고

### 1.2.3. 라이브러리 다운로드

`node i`

### 1.2.4. 타입 스크립트 컴파일

`shift + ctrl + b` 또는 터미널에서 `tsc`

### 1.2.5. 빌드 (ts컴파일 + js묶음 + 미니파이)

`npm run build`
