# JQUERY

## 사용법

### 보이기 감추기

```javascript
$('#windowLogin').fadeIn(); /* 보이기 */
$('#windowLogin').fadeOut(); /* 안보이기 */
```

### HTMLElement로 변환

```javascript
$('#foo')[0];
```

### 이벤트 처리

```javascript
/* 클릭 이벤트 처리 */
$('#btnProfile').on('click', function () {
  $('#windowLogin').fadeIn();
});

/* 클릭 이벤트 처리 (나중에 추가된 컴포넌트 에도 적용됨) */
$(document).on('click', '.c-window .c-btn-close', function () {
  $(this).parent('div').fadeOut();
});
```

## 자식 요소 찾기

- `children()`은 부모 요소의 바로 아래 단계인 자식요소만 선택할 수 있다.
- `find()`는 부모 태그의 모든 하위 요소의 자식을 선택하여 가져올수 있다.

```javascript
$('div').children('.red'); //red 클래스명의 자식요소만 찾아
$('div').children('span'); //span 요소만 잧아
```
