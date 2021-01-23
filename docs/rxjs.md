# RxJS

> 반응형 프로그래밍은 한번 코딩을 해 놓으면 이후에 데이터가 변화하는 행동을 알아서 처리하는 것을 의미 한다

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
