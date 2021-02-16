# 1. 프론트엔드

## 1.1. React (SPA)

> 리액트는 싱글 페이지 애플리케이션이나 모바일 애플리케이션의 개발 시 토대로 사용될 수 있다. -위키백과

### 1.1.1. Redux

> Redux는 애플리케이션 상태를 관리하기위한 오픈 소스 JavaScript 라이브러리입니다. 사용자 인터페이스 구축을 위해 React 또는 Angular와 같은 라이브러리와 함께 가장 일반적으로 사용됩니다. -위키백과

React랑 React+Redux의 결정적 차이
React는 React 컴포넌트 자신이 개별적으로 상태관리를 한다.
React+Redux는 상태관리를 하는 전용 장소(store)에서 상태를 관리하고, React 컴포넌트는 그걸 보여주기만 하는 용도로 쓰인다.

### 1.1.2. Next.js (SSR)

> Next.js는 서버 측 렌더링 및 React 기반 웹 애플리케이션을위한 정적 웹 사이트 생성과 같은 기능을 지원하는 오픈 소스 React 프런트 엔드 개발 웹 프레임 워크입니다. -위키백과

### 1.1.3. Gatsby (Static page)

## 1.2. Vue

### 1.2.1. Vuex

### 1.2.2. Nuxt.js

## 1.3. Electron

- 참고 <https://gyuha.tistory.com/540>
- `npx create-react-app my-app-name --template typescript` 타입스크립트 리액트앱 생성
- `cd my-app-name`
- `$ yarn add --dev electron electron-builder concurrently wait-on cross-env`
- electron : Electron 기본 패키지
- electron-builder : electron을 원하는 플랫폼으로 빌드해 줍니다.
- concurrently : 한번에 여러개의 명령어를 실행할 수 있게 해 줍니다.
- wait-on : 특정 포트 또는 파일이 활성화 될 때까지 대기를 해 줍니다.
- cross-env : 시스템에 관계없이 환경변수 값을 설정할 수 있게 해 줍니다.
- `yarn add electron-is-dev`
- electron-is-dev 패키지는 현재 환경이 개발 환경인지를 확인 해 주는 패키지 입니다. 이 파일을 별도로 설치한 이유는 앱 실행시 이 패키지를 통해서 실행 경로를 바꿔주기 위해서 입니다.
- electron.js 파일 생성

```javascript
const electron = require('electron');
const app = electron.app;
const BrowserWindow = electron.BrowserWindow;
const path = require('path');
const isDev = require('electron-is-dev');

let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 900,
    height: 680,
    webPreferences: {
      nodeIntegration: true,
      enableRemoteModule: true,
      devTools: isDev,
    },
  });

  mainWindow.loadURL(
    isDev
      ? 'http://localhost:3000'
      : `file://${path.join(__dirname, '../build/index.html')}`
  );

  if (isDev) {
    mainWindow.webContents.openDevTools({ mode: 'detach' });
  }

  mainWindow.setResizable(true);
  mainWindow.on('closed', () => (mainWindow = null));
  mainWindow.focus();
}

app.on('ready', createWindow);

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', () => {
  if (mainWindow === null) {
    createWindow();
  }
});
```

- package.json 파일 수정
- `"main": "public/electron.js",`
- `"homepage": "./",`
- `"release": "yarn react-build && electron-builder --publish=always"`

```json
  "author": "My name",
  "build": {
    "appId": "com.appId"
  },
  "main": "public/electron.js",
  "homepage": "./",
  "scripts": {
    "react-start": "react-scripts start",
    "react-build": "react-scripts build",
    "react-test": "react-scripts test",
    "react-eject": "react-scripts eject",
    "start": "concurrently \"cross-env NODE_ENV=development BROWSER=none yarn react-start\" \"wait-on http://localhost:3000 && electron .\"",
    "build": "yarn react-build && electron-builder",
    "release": "yarn react-build && electron-builder --publish=always"
  },
```

- `yarn start` 실행
- `yarn build` 빌드
- `yarn release` 배포
-
