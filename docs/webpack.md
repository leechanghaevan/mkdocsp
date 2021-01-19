# WEBPACK

> 웹팩은 오픈 소스 자바스크립트 모듈 번들러이다. 주로 자바스크립트를 위한 모듈 번들러이지만 호환 플러그인을 포함하는 경우 HTML, CSS, 심지어는 이미지와 같은 프론트엔드 자산들을 변환할 수 있다. 웹팩은 의존성이 있는 모듈을 취하여 해당 모듈을 대표하는 정적 자산들을 생성한다. - 위키백과

## 설치

- 설치:  
  `npm install -g webpack webpack-cli` 글로벌 설치  
  `npm i -D webpack webpack-cli` 프로젝트에 설치

- package.json에 추가

```json
"script": {
"build": "webpack"
}
```

---

## 참고

- [프론트엔드 개발환경의 이해: 웹팩](https://jeonghwan-kim.github.io/series/2019/12/10/frontend-dev-env-webpack-basic.html)
- [웹팩 개발 서버](https://jeonghwan-kim.github.io/series/2020/01/02/frontend-dev-env-webpack-intermediate.html#31-%EB%B0%B0%EA%B2%BD)
