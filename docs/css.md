# CSS

## 개요

> 종속형 시트 또는 캐스케이딩 스타일 시트는 마크업 언어가 실제 표시되는 방법을 기술하는 언어로, HTML과 XHTML에 주로 쓰이며, XML에서도 사용할 수 있다. W3C의 표준이며, 레이아웃과 스타일을 정의할 때의 자유도가 높다. - 위키백과

## CSS 변수 할당 및 사칙연산

```css
:root {
  --canvas-height: 370px; /* 변수할당 */
  --content-width: 800px;
  --menu-width: 300px;
  --menu-height: calc(var(--canvas-height) - 100px); /* 변수사용 + 계산 */
}
```

## 사용법

### visibility

```css
display: none; /* 화면에서 안보임 */
visibility: hidden; /* 화면에서 안보임. 자리는 차지함 */
```

### flex

참고: <https://studiomeal.com/archives/197>

```css
.container {
  display: flex; /* 자식 div 들이 가로 방향 프로우 레이아웃 처럼 작동한다. 자식들이 모두 display: inline-block 과 유사*/
  display: block; /* 기본 값이다. 자식 div 들이 세로 방향 프로우 레이아웃 처럼 작동한다. */
}
```

```css
/* 방향 정의 */
.container {
  flex-direction: row; /* 우로 정렬 */
  flex-direction: row-reverse; /* 좌로 정렬 */
  flex-direction: column; /* 아래로 정렬 */
  flex-direction: column-reverse; /* 위로 정렬 */
}
```

```css
/* 개행 정의 */
.container {
  flex-wrap: nowrap; /* 넘쳐 나감 */
  flex-wrap: wrap; /* 아래로 개행 */
  flex-wrap: wrap-reverse; /* 위로 개행 */
}
```

```css
/* 수평 정렬 */
.container {
  justify-content: flex-start; /* 왼쪽 */
  justify-content: flex-end; /* 오른쪽 */
  justify-content: center; /* 중앙 */
  justify-content: space-between;
  justify-content: space-around;
}
```

```css
/* 수직 정렬 */
.container {
  align-content: flex-start; /* 위 */
  align-content: flex-end; /* 아래 */
  align-content: center; /* 중앙 */
  align-content: baseline;
}
```

```css
/* 화면 한가운데 놓기 */
justify-content: center;
align-item: center;
```

```css
/* Flex 아이템의 기본 크기를 설정 (flex-direction이 row일 때는 너비, column일 때는 높이 */
.item {
  flex-basis: auto; /* 기본값 */
  flex-basis: 0;
  flex-basis: 50%;
  flex-basis: 300px;
  flex-basis: 10rem;
  flex-basis: content;
}
```

### Grid

> Flex는 한 방향 레이아웃 시스템이고 (1차원)
> Grid는 두 방향(가로-세로) 레이아웃 시스템 (2차원)
