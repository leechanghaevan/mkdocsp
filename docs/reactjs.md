# React

## 특징

> 리액트를 사용하면 유저 인터페이스를 재사용 가능한 컴포넌트로 분리하여 작성함으로써 유지보수성을 높여준다.

## 참고

[VELOPERT.LOG](https://velopert.com/reactjs-tutorials)

## 설치

- `npm install -g create-react-app`

## 프로젝트 생성

- `create-react-app hello-react` 프로젝트 생성
- `yarn start` 개발서버 시작
- `yarn build` 번들
- `yarn test` 테스트서버 시작
- `yarn eject`

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
