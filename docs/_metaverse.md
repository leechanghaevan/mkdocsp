# 1. Social Universe (메타버스) 프로젝트

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

### 1.2.1. 사전준비

`nodejs 다운로드 설치`  
`nodejs i three`  
`nodejs i rxjs`
`nodejs i -g typescript`  
`nodejs i -g parcel`

### 1.2.2. 타입 스크립트 설정

tsconfig.json

```json
"target": "es5"
"sourceMap": true
"outDir": "./dist",
"rootDir": "./_src",
```

- import 문 변환하지 않고 남겨둠.
- 단점: 임포트 경로가 지저분하다. `import * as THREE from '../../../node_modules/three/src/three.js`
- 장점: commonjs 없이 동작한다.

```json
"module": "es2015"
```

- import 문을 commonjs 형태로 변환한다.
- 단점: commonjs 모듈을 번들러를 통해 묶어 주어야 한다.
- 장점: 임포트 경로가 깔끔하다. `import * as THREE from 'three`

```json
"module": "commonjs"
"moduleResolution": "node"
```

vscode 에서 타입스크립트 컴파일시 팝업창 안뜨고 조용히 진행되게  
tasks.json

```json
"presentation": {
"reveal": "silent",
"clear": true,
"showReuseMessage": false
}
```

### 1.2.3. 라이브러리 다운로드

`node i`

### 1.2.4. 타입 스크립트 컴파일

`shift + ctrl + b` 또는 터미널에서 `tsc`

### 1.2.5. 빌드 (ts컴파일 + js묶음 + 미니파이)

`npm run build`
