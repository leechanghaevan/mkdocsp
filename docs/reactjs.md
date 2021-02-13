# React

## 특징

> 리액트를 사용하면 유저 인터페이스를 재사용 가능한 컴포넌트로 분리하여 작성함으로써 유지보수성을 높여준다.

## 참고

[VELOPERT.LOG](https://velopert.com/reactjs-tutorials)

## 설치

- `npm install -g create-react-app` npx를 사용하게 되면 이렇게 설치할 필요가 없다.
- `npm install -g create-next-app` npx를 사용하게 되면 이렇게 설치할 필요가 없다.create

## 프로젝트 생성 기본

- `npx create-react-app hello-react` 프로젝트 생성
- `npx create-react-app hello-react --template typescript` 타입스크립트 프로젝트 생성
- `yarn start` 개발서버 시작
- `yarn build` 번들
- `yarn test` 테스트서버 시작
- `yarn eject`

## 프로젝트 생성 (React + Next.js + Typescript)

- `npx create-next-app --example with-typescript hello-react` 앱생성
- `cd test-app` 폴더 이동
- `npm i` 종속성 설치
- `npm i redux react-redux immer @types/react-redux typesafe-actions` 추가 라이브러리 설치
- `npm run dev` 개발 서버 실행

## 기본 문법

엔트리

```javascript
// App.js
import './App.css';
import MyExample from './MyExample';

function App() {
  return <MyExample name="리액트" />;
}

export default App;
```

컴포넌트

```javascript
// MyExample.js
import React, { Component } from 'react';

class App extends Component {
  render() {
    const value = 1;
    return (
      <div>
        {(function () {
          if (value === 1) return <div>하나</div>;
          if (value === 2) return <div>둘</div>;
          if (value === 3) return <div>셋</div>;
        })()}
      </div>
    );
  }
}

export default App;
```

## SSR - SPA
