# 1. JavaScript

> 자바스크립트는 객체 기반의 스크립트 프로그래밍 언어이다. 이 언어는 웹 브라우저 내에서 주로 사용하며, 다른 응용 프로그램의 내장 객체에도 접근할 수 있는 기능을 가지고 있다. 또한 Node.js와 같은 런타임 환경과 같이 서버 프로그래밍에도 사용되고 있다. - 위키백과

---

## 1.1. Class 구현

```javascript
// 이런식으로 생성한 객체는 하나만 존재하며, 인스턴스화 할수 없다.
var jsObject = {
  val: '',

  foo: function () {
    console.log(this.val);
  },
};

// 클래스 형태의 자바스크립트 함수
var jsFunction = function (val) {
  this.val = val;

  this.foo = function () {
    console.log(this.val);
  };
};

// 위와 같은 함수의 클래스식 표현
class jsClass {
  val = '';

  constructor(val) {
    this.val = val;
  }

  foo() {
    console.log(this.val);
  }
}

var bbb = new jsObject();
var ccc = new jsObject();
// var bbb = new jsClass("1234");
// var ccc = new jsClass("5678");
bbb.foo();
ccc.foo();
```

---

## 1.2. JavaScript로 애니메이션 구현

JS로 애니메이션 처리 --> 규칙적인 처리를 하도록 구현하면 됩니다. 다음과 같은 방법들이 있습니다.

- setInterval
- setTimeout
- requestAnimationframe

### 1.2.1. setInterval

일정한 시간 간격으로 작업을 실행합니다. 주기적은 작업을 하는데 그 작업이 시간보다 오래 걸릴 경우 콜백이 지연되고 사라질 수 있습니다. 따라서 애니메이션 구현시 setInterval보단 setTimeout으로!!

```javascript
var Interval = window.setInterval(function, time);

// 변수 Interval 은 clearInterval을 통해서 setInterval()을 종료시킵니다.
// window.clearInterval(setInterval)로 강제 종료
// time 간격으로 function 실행!
```

### 1.2.2. setTimeout

작업 사이의 간격을 일정하게 줍니다.

재귀적으로 호출함으로써 애니메이션을 구현할 수 있습니다.

```javascript
var timeout = window.setTimeout(function, time);

// 변수 timeout은 clearTimeout을 통해 setTimeout을 종료시킵니다.
// time간격으로 funciton을 한 번 실행합니다.
// window.clearTimeout(timeout); 으로 강제 종료할 수 있습니다.
```

### 1.2.3. reqeustAnimationframe

앞서 setTimeout도 사실 주기적인 실행을 위한 방법이고(애니메이션을 위해서 생긴 메소드가 X) 연속적인 함수 호출로 애니메이션을 구현할 때 딜레이가 발생할 수 있습니다..

애니메이션은 끊기지 않고 부드럽게 처리해야하는데, 다행히 브라우저에서 애니메이션 구현을 위한 메서드 reqeustAnimationframe을 제공해줍니다!

svg나 canvas 및 그래픽스로 웹상에 복잡한 도형을 만들어 움직이는 애니메이션을 줄 때는 이 requestAnimationframe가 유용하게 쓰일 수 있습니다.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>

    <style>
      .outside {
        position: relative;
        background-color: #ff0eef;
        width: 100px;
      }
    </style>
  </head>
  <body>
    <div class="outside">내 최애 과일은..</div>

    <script>
      var count = 0;
      var el = document.querySelector('.outside');
      el.style.left = '0px'; //default값으로 설정

      function run() {
        if (count > 40) {
          //count가 40을 넘으면 return
          return;
        }
        count += 2; //  2px씩 증가.
        el.style.left = parseInt(el.style.left) + count + 'px';
        console.log(el.style.left);
        requestAnimationFrame(run);
        // reqeustAnimationFrame()함수를 통해서 원하는 함수를 인자로 넣어준다.
        // 브라우저는 인자로 받은 그 비동기 함수가 실행될 적절한 타이밍에 실행시켜줌.
      }
      requestAnimationFrame(run);
    </script>
  </body>
</html>
```

---

## 1.3. API

### 1.3.1. window.requestAnimationFrame()

- 다음 리페인트에서 그 다음 프레임을 애니메이트하려면 콜백 루틴이 반드시 스스로 requestAnimationFrame()을 호출해야합니다.
