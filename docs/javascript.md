# 1. JavaScript

> 자바스크립트는 객체 기반의 스크립트 프로그래밍 언어이다. 이 언어는 웹 브라우저 내에서 주로 사용하며, 다른 응용 프로그램의 내장 객체에도 접근할 수 있는 기능을 가지고 있다. 또한 Node.js와 같은 런타임 환경과 같이 서버 프로그래밍에도 사용되고 있다. - 위키백과

---

## 1.1. 객체

### 1.1.1. 객체 선언

```javascript
// 1. 자바스크립트 오브젝트
// 이런식으로 생성한 객체는 new 사용할 수 없다.
var jsObject = {
  val: 'jsObject',

  foo: function () {
    console.log(this.val);
  },
};

var jsObject1 = Object.create(jsObject);
var jsObject2 = Object.create(jsObject);
jsObject1.val = 'jsObject1';
jsObject2.val = 'jsObject2';
jsObject.foo();
jsObject1.foo();
jsObject2.foo();

// 2. 생성자 함수
// 객체의 함수 표헌법으로 선언 (new로 함수를 실행하지 않으면 this를 사용할 수 없다)
var jsFunction = function (val) {
  this.val = val;

  this.foo = function () {
    console.log(this.val);
  };
};

// 3. 생성자 함수의 클래스 표현법
class jsClass {
  _val = 'jsClass';

  constructor(v) {
    this._val = v;
  }

  foo() {
    console.log(this._val);
  }

  get val() {
    return this._val;
  }

  set val(v) {
    this._val = v;
  }
}

var jsClass1 = new jsClass('jsClass1');
var jsClass2 = new jsClass('jsClass2');
jsClass1.foo();
jsClass2.val = 'setter jsClass2';
jsClass2.foo();
```

### 1.1.2. 객체 복제 (클론)

```javascript
//객체 복제 방법 1
var objNew = {}; //생성
Object.assign(objNew, obj1); //복사
Object.assign(objNew, obj1, obj2); //여러개의 객체를 하나로 합침

//객체 복제 방법 2
var objNew = { ...obj1 }; //생성 + 복사
var objNew = { ...obj1, ...obj2 }; //여러개의 객체를 하나로 합침
```

### 1.1.3. 객체 접근

```javascript
var obj1 = {
  _a1: '_a1',

  get a1() {
    return this._a1;
  },

  set a1(v) {
    this._a1 = v;
  },
};

//닷 접근
console.log(obj1.a1);

//이름으로 접근
let i = 0;
console.log(obj1['a' + ++i]);
```

---

## 1.2. 함수 및 객체, 내보내기 / 불러오기

### 1.2.1. commonjs 방식 (nodejs)

```javascript
const canadianToUs = function (canadian) {
  return roundTwoDecimals(canadian * exchangeRate);
};

function usToCanadian(us) {
  return roundTwoDecimals(us / exchangeRate);
}
exports.canadianToUs = canadianToUs; // 내보내기 1
exports.usToCanadian = usToCanadian; // 내보내기 2
```

```javascript
//사용하기
const currency = require('./currency-functions');
console.log(currency.canadianToUs(50));
console.log(currency.usToCanadian(30));
```

### 1.2.2. es6방식

```javascript
// 1. 선언과 동시에 내보내기
export function canadianToUs(canadian) {
  return roundTwoDecimals(canadian * exchangeRate);
}

// 2. 별도로 내보내기
const usToCanadian = function (us) {
  return roundTwoDecimals(us / exchangeRate);
};
export { usToCanadian };
```

```javascript
// 단일 객체 내보내기
const obj = {
  canadianToUs(canadian) {
    return roundTwoDecimals(canadian * exchangeRate);
  },
};

obj.usToCanadian = function (us) {
  return roundTwoDecimals(us / exchangeRate);
};

export default obj;
```

```javascript
//직접 가져오기
import { canadianToUs } from './currency-functions';
console.log(canadianToUs(50));

//별명으로 가져오기
import * as currency * from './currency-functions';
console.log(currency.canadianToUs(50));

//단일 객체 가져오기 (별명은 아무이름 붙여도 된다)
import currency from "./currency-object"
console.log(currency.canadianToUs(50));
```

하나만 내보내기, export default obj는 왜 필요할까?  
`export class A {}` 에선 가져올때 파일 이름 + 가져올 객체 A의 이름을 알고 있어야 한다.  
`export default class A {}` 에선 가져올때 파일 이름만 알고 있으면 된다. 굳이 필요한가 싶다.
export default는 클래스를 위해서 존재하는 것 같다. 하지만 변수 공개 범위 설정이 안되는 자바스크립트 특성상,
싱글톤 모듈은 굳이 클래스로 작성하는것 보다. 일반 함수로 작성해서 내보낼 함수에만 export를 붙이는게 더 명확한 코딩이 가능할 것 같다.

---

## 1.3. 이벤트 리스너 비교

- **onclick** 방식

```javascript
document.getElementById('trigger').onclick = () => {
  alert('hello!');
};
```

- **addEventListener** 방식 (여러개의 리스너를 지정할 수 있다)  
  또한 마지막 파라미터를 true 로 주면 이벤트 호출 방향을 부모에서 자식으로 역전 할 수 있다. (버블링 => 캡쳐링)

```javascript
document.getElementById('trigger').addEventListener(
  'click',
  () => {
    alert('hello!');
  },
  false
);
```

---

## 1.4. JavaScript로 메인루프 구현

- setInterval
- setTimeout
- requestAnimationframe

### 1.4.1. setInterval

일정한 시간 간격으로 작업을 실행합니다. 오래 걸릴 경우 콜백이 지연되고 사라질 수 있습니다.

```javascript
var Interval = window.setInterval(function, time);

// 변수 Interval 은 clearInterval을 통해서 setInterval()을 종료시킵니다.
// window.clearInterval(setInterval)로 강제 종료
// time 간격으로 function 실행!
```

### 1.4.2. setTimeout

작업 주기 함수. 재귀적으로 호출함으로써 애니메이션을 구현할 수 있습니다. (setInterval 보다 호출이 보장됨)

```javascript
var timeout = window.setTimeout(function, time);

// 변수 timeout은 clearTimeout을 통해 setTimeout을 종료시킵니다.
// time간격으로 funciton을 한 번 실행합니다.
// window.clearTimeout(timeout); 으로 강제 종료할 수 있습니다.
```

### 1.4.3. reqeustAnimationframe

애니메이션 전용 주기 호출 함수 (애니메이션을 위한 최적화된 주기 호출)

```javascript
function run() {
  ...
  requestAnimationFrame(run);
}
requestAnimationFrame(run);
```

---

## 1.5. API

### 1.5.1. window.requestAnimationFrame()

- 다음 리페인트에서 그 다음 프레임을 애니메이트하려면 콜백 루틴이 반드시 스스로 requestAnimationFrame()을 호출해야합니다.

### 1.5.2. foreach 반복

```javascript
//foreach가 존재하긴 하나 콜백 형태로 괴랄하다. 아래와 같이 for of를 사용하자.
list = [];
for (let item of list) {
  if (item.handle == handle) {
    item.close();
    return;
  }
}

//for in 은 객체의 프로퍼티를 나열하는데 사용된다. dictionary 처럼 사용 가능
dic = {};
dic['rabbit'] = 'bunny';
for (let key in dic) {
  console.log(dic[key]);
}
```

### 1.5.3. ... 문법

```javascript
//객체 복제
var prevState = {
  name: '홍길동',
  birth: '1996-11-01',
  age: 22,
};

var state = {
  ...prevState,
  age: 23,
};
```

```javascript
//배열 복제
let a = [1, 2, 3, 4];
let b = [...a]; //단순 참조가 아닌 새로운 객체가 생성되고 값이 복사된다.
```

## await / async / Promise

//3초 대기
await new Promise((resolve, reject) => setTimeout(resolve, 3000));
