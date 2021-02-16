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
- `npx create-react-app hello-react --typescript` 타입스크립트 프로젝트 생성
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

## 디버거 설정 (vscode)

```json
// 1. yarn start 로 리액트 개발서버 실행
// 2. launch.json 생성
// 3. ctrl+f5 로 디버그 시작
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "chrome",
      "request": "launch",
      "name": "chrome debugger",
      "url": "http://localhost:3000",
      "webRoot": "${workspaceFolder}/src"
    }
  ]
}
```

## 컴포넌트 정의 방식 (클래스형)

- const { number } = this.state; 상태 가져오기
- this.setState 상태 설정하기

```jsx
//클래스형 예1 기본형
import React, { Component } from 'react';

class App extends Component {
  render() {
    const name = '리액트';
    return <div>{name}</div>;
  }
}

export default App;
```

```jsx
//클래스형 예2 상태관리
import React, { Component } from 'react';

class Counter extends Component {
  constructor(props) {
    super(props); //반드시 호출

    //state는 constructor 밖으로 빼서 생성해 줄 수도 있다. 그럴 경우에는 클래스 안에 state = { } 와 같이 선언해 주면 된다.
    this.state = {
      number: 0,
    };
  }
  render() {
    const { number } = this.state; // state 를 조회할 때에는 this.state 로 조회합니다.
    return (
      <div>
        <h1>{number}</h1>
        <button
          // onClick 을 통하여 버튼이 클릭됐을 때 호출 할 함수를 지정합니다.
          onClick={() => {
            // this.setState를 사용하여 state에 새로운 값을 넣을 수 있습니다.
            this.setState({ number: number + 1 });
          }}
        >
          +1
        </button>
      </div>
    );
  }
}

export default Counter;
```

```jsx
//클래스형 예3 redux 상태관리
import React, { Component } from 'react';
import { connect } from 'react-redux';
import { addValue } from './actions';
​
class Counter extends Component {
    render() {
        const { value, dispatchAddValue } = this.props;
        return (
            <div>
                Value: {value}
                <a href="#" onClick={e => dispatchAddValue(1)}>+1</a>
                <a href="#" onClick={e => dispatchAddValue(2)}>+2</a>
            </div>
        );
    }
}
​
export default connect(
    state => ({ value: state.value }),
    dispatch => ({ dispatchAddValue: amount => dispatch(addValue(amount)) })
)(Counter)
```

## 컴포넌트 정의 방식 (함수형)

- 코드 간결
- 메모리 적게 차지함
- 최근에 많이 사용되는 추세

```jsx
//함수형 예1 기본형
import React from 'react';

function App() {
  const name = '리액트';
  return <div>{name}</div>;
}

export default App;
```

```jsx
//함수형 예2 상태관리
import React, { useState } from 'react';

function Counter() {
  const [number, setNumber] = useState(0); //useState 사용하여 number 라는 속성 정의

  const onIncrease = () => {
    setNumber(number + 1); //상태 저장 setNumber 사용
  };

  const onDecrease = () => {
    setNumber(number - 1);
  };

  return (
    <div>
      <h1>{number}</h1>
      <button onClick={onIncrease}>+1</button>
      <button onClick={onDecrease}>-1</button>
    </div>
  );
}

export default Counter;
```

```jsx
//함수형 예3 redux 상태관리
import React, { Component } from 'react';
import { connect } from 'react-redux';
import { addValue } from './actions';
​
const Counter = ({ value, addValue }) => (
    <div>
        Value: {value}
        <a href="#" onClick={e => addValue(1)}>+1</a>
        <a href="#" onClick={e => addValue(2)}>+2</a>
    </div>
);
​
export default connect(
    state => ({ value: state.value }),
    { addValue }
)(Counter)
```

## 용어 정리

- props: 컴포넌트 호출하는쪽에서 지정하는 값 (넓이 색상 등). 컴포넌트 안에서는 불변
- state: 컴포넌트 내부 상태 값. 컴포넌트 안에서 변화
- reducer: redux 에서, 액션(객체)을 파라미터로 받아 state에 적용하는 사용자 정의 함수.

## 리덕스 3 규칙

- 하나의 애플리케이션 안에는 하나의 스토어만 있다. (여러개를 만들면 개발 도구를 활용할 수 없다)
- 상태는 읽기전용 이다. 상태를 업데이트 할때는 새로운 상태를 만들어서 교체 방식으로 한다. (개발자 도구를 통해 뒤로 앞으로 돌릴수 있다.)
-

## 리덕스 왜 쓸까?

- 리덕스를 쓰면, 상태 관리를 컴포넌트 바깥에서 한다!
- 함수,

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
