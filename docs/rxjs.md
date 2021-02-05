# RxJS

- 데이터가 변동되면 무엇을 하라고 사용자가 한번만 정의를 내리고, 나머지 이후의 데이터가 변동되는 행위에 대한 행동을 맏기는 행위를 반응형이라고 한다.

전통 방식

```javascript
function event() {
  // ...
}
const el = document.getElementsById('Button');
el.addEventListener('click', event);
```

리액티브 방식

```javascript
Observable.create((observer) => {
  try {
    observer.next('item');
  } catch (e) {
    observer.error(e);
  } finally {
    observer.complete();
  }
}).subscribe(
  (x) => console.log(x),
  (err) => console.error(err),
  () => console.log('complete')
);
```

## 설치

`npm i rxjs`

## Subject

- 현재 주제 부터 감시. 지나간 주제는 감시하지 않음

```javascript
import { BehaviorSubject } from 'rxjs';

const subject = new BehaviorSubject('우유');

//구독자1 (마지막 우유 부터 구독함)
subject.subscribe((v) => {
  console.log(`구독자1 ${v} 받음`);
});
//구독자2
subject.subscribe((v) => {
  console.log(`구독자2 ${v} 받음`);
});

//주스로 주제 변경
subject.next('쥬스');

//구독자3 (마지막 쥬스 부터 구독함)
subject.subscribe((v) => {
  console.log(`구독자3 ${v} 받음`);
});

//실행결과
// 구독자1 우유 받음
// 구독자2 우유 받음
// 구독자1 쥬스 받음
// 구독자2 쥬스 받음
// 구독자3 쥬스 받음
```

## Observable

- 구독자는 관찰객체의 과거에서 미래까지 모든 행위를 구독 받는다.

```javascript
import { Observable } from 'rxjs';

const observable = new Observable((obs) => {
  try {
    obs.next('우유');
    obs.next('주스');
    obs.complete();
  } catch (error) {
    obs.error(error);
  }
});

//구독자1
observable.subscribe(
  (v) => {
    console.log(`구독자1 ${v} 받음`);
  },
  (error) => {
    console.log(`구독자1 ${error}} 에러`);
  },
  () => {
    console.log(`구독자1 구독 완료`);
  }
);

//구독자2
observable.subscribe((v) => {
  console.log(`구독자2 ${v} 받음`);
});

//구독자3 (3초뒤 구독 시작)
setTimeout(() => {
  observable.subscribe(
    (v) => {
      console.log(`구독자3 ${v} 받음`);
    },
    null,
    null
  );
}, 3000);

//실행결과
// 구독자1 우유 받음
// 구독자1 주스 받음
// 구독자1 구독 완료
// 구독자2 우유 받음
// 구독자2 주스 받음
// 3초뒤...
// 구독자3 우유 받음
// 구독자3 주스 받음
```

## from

- 고정된 일련 데이터에 대한 구독

```javascript
import { from } from 'rxjs';

const array = from([1, 2, 3, 4]);
array.subscribe((val) => console.log(val)); //1~5까지 숫자 1개씩 출력
// 1
// 2
// 3
// 4

const text = from('우유');
text.subscribe((val) => console.log(val)); //hello world 글자 1개씩 출력
// 우
// 유

const map = new Map();
map.set(1, '우유');
map.set(2, '1234');

const mapSource = from(map);
mapSource.subscribe((val) => console.log(val));

map.set(2, '주스'); //출력되지 않는다

// [1, '우유']
// [2, '1234']
```

## fromEvent

- 이벤트 구독

```javascript
import { Observable, fromEvent } from 'rxjs';

this.mousePositon$ = fromEvent(document, 'mousemove');

// ③ 옵저버는 옵저버블을 구독하고 옵저버블이 방출한 데이터를 전파받아 사용한다.
this.mousePositon$.subscribe(
  (event: MouseEvent) => {
    this.posX = event.clientX;
    this.posY = event.clientY;
  },
  (error) => console.log(error),
  () => console.log('complete!')
);
```
