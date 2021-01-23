# 1. JavaScript

> 자바스크립트는 객체 기반의 스크립트 프로그래밍 언어이다. 이 언어는 웹 브라우저 내에서 주로 사용하며, 다른 응용 프로그램의 내장 객체에도 접근할 수 있는 기능을 가지고 있다. 또한 Node.js와 같은 런타임 환경과 같이 서버 프로그래밍에도 사용되고 있다. - 위키백과

---

## 1.1. 객체 선언 방법들

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

## 1.2. 객체 복제 (클론)

```javascript
//객체 복제 방법 1
var objNew = {}; //생성
Object.assign(objNew, obj1); //복사
Object.assign(objNew, obj1, obj2); //여러개의 객체를 하나로 합침

//객체 복제 방법 2
var objNew = { ...obj1 }; //생성 + 복사
var objNew = { ...obj1, ...obj2 }; //여러개의 객체를 하나로 합침
```

## 1.3. 객체 필드 접근

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

## 1.4. JavaScript로 메인루프 구현

JS로 애니메이션 처리 --> 규칙적인 처리를 하도록 구현하면 됩니다. 다음과 같은 방법들이 있습니다.

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
