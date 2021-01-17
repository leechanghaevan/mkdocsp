# 1. express (nodejs 웹서버 프레임웍)

> Express.js, 또는 간단히 익스프레스는 Node.js를 위한 웹 프레임워크의 하나로, MIT 허가서로 라이선스되는 자유-오픈 소스 소프트웨어로 출시되었다. 웹 애플리케이션, API 개발을 위해 설계되었다. Node.js의 사실상의 표준 서버 프레임워크로 불리고 있다. - 위키백과
>
> express는 자바 스프링 같이 프레임웍이라고 생각하면 된다. 기본 http 모듈은 서블릿 같은 기본 기능이라고 보면 된다.

## 1.1. 설치

- 프로젝트 설치 (추천)  
  `npm i express --save`
- 글로벌 설치  
  `npm i express -g`

## 1.2. 미들웨어

### 1.2.1. router 미들웨어

- 요청 URL의 경로에 따라 다른 처리 함수로 연결해 준다
- 자바스프링의 컨트롤러와 같은 개념

```javascript
//라우터 예제
const express = require('express');
const app = express();
const port = 3000;

//method get, path /
app.get('/', function (req, res) {
  res.send('Home');
});
app.get('/hello', function (req, res) {
  // 첫 요청엔 HTTP 200을 리턴
  // 이후엔 항상 같은 값으므로 HTTP 304를 리턴
  res.send('Hello World');
});
app.get('/random', function (req, res) {
  // 매번 결과가 변하므로 HTTP 200을 리턴
  res.send('random:' + Math.random());
});
app.get('/path/user/:id', function (req, res) {
  // 패스 파라미터로(/path/user/xxx) 유저아이디 받음
  res.send('user:' + req.params.id);
});
app.get('/param', function (req, res) {
  // 리퀘스트 파라미터(/param?user=xxx)로 유저아이디 받음
  res.send('user:' + req.query.user);
});
app.get('/bad', function (req, res) {
  // 잘못된 요청시 명시적으로 400 리턴
  res.status(400).send('Bad Request');
});
app.get('/error', function (req, res) {
  // 서버 에러시 자동으로 500 리턴
  throw 'Internal Server Error';
});

app.listen(port, function () {
  console.log(`application is listening on http://127.0.0.1:${port}`);
});
```

### 1.2.2. static 미들웨어

- 이미지 파일 등 정적 컨텐츠 제공
- 폴더 구조를 아래와 같이 배치  
  /app.js  
  /static  
  /static/sample.jpg
- 서비스 주소 <http://127.0.0.1:3000/sample.jpg>

```javascript
const express = require('express');
const app = express();
const port = 3000;

// 정적 컨텐츠 폴더 위치 설정
app.use(express.static(__dirname + '/static'));

app.listen(port, function () {
  console.log(`application is listening on http://127.0.0.1:${port}`);
});
```

### 1.2.3. morgan 미들웨어

- 로그 출력 제공
- 외부 모듈이므로 설치 필요  
  `npm i morgan`

```javascript
const express = require('express');
const app = express();
const port = 3000;

const morgan = require('morgan');

// 유저가 접속할때 마다 로그가 자동으로 찍힌다.
// 로그 옵션은 아래와 같다
// combined
// common
// dev
// short
// tiny
app.use(morgan('combined'));

app.use(function (req, res) {
  res.send('<h1>express Basic</h1>');
});

app.listen(port, function () {
  console.log(`application is listening on http://127.0.0.1:${port}`);
});
```

### 1.2.4. body parser 미들웨어

- POST 전송된 파라미터 읽기
  `req.body.password`
- 외부 모듈이므로 설치 필요  
  `npm i body-parser`

### 1.2.5. cookie parser 미들웨어

- 쿠키 읽기  
  `req.cookies.auth`
- 외부 모듈이므로 설치 필요  
  `npm i cookie-parser`

```html
<!-- 로긴 뷰 -->
<form method="post">
  <table>
    <tr>
      <td><label>Username</label></td>
      <td><input type="text" name="login" /></td>
    </tr>
    <tr>
      <td><label>Password</label></td>
      <td><input type="password" name="password" /></td>
    </tr>
  </table>
  <input type="submit" name="" />
</form>
```

```javascript
// - POST 데이터로 기본 로그인 구현

// 앱 설정
const express = require('express');
const app = express();
const port = 3000;
// 정적 위치 설정
app.use(express.static(__dirname + '/static'));
// 뷰 설정
app.set('views', __dirname + '/view');
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);
// 쿠키 파서 설정
const cookieParser = require('cookie-parser');
// POST 파서 설정
const bodyParser = require('body-parser');
app.use(cookieParser());
app.use(bodyParser.urlencoded({ extended: false }));
// 파일 읽기
const fs = require('fs');

// 로긴 페이지로 리디렉션
app.get('/', function (req, res) {
  if (req.cookies.auth) {
    res.send('로긴 성공');
  } else {
    res.redirect('/login');
  }
});

// 로긴 뷰 렌더
app.get('/login', function (req, res) {
  res.render('login.html');
});

// post
app.post('/login', function (req, res) {
  //쿠키 생성
  var login = req.body.login;
  var password = req.body.password;

  //출력
  console.log(login, password);
  console.log(req.body);

  //로긴 확인
  if (login == 'evan' && password == '1234') {
    // 로긴 성공
    res.cookie('auth', true);
    res.redirect('/');
  } else {
    //로긴 실패
    res.redirect('/login');
  }
});

app.listen(port, function () {
  console.log(`application is listening on http://127.0.0.1:${port}`);
});
```

### 1.2.6. connect-multiparty 미들웨어

- multipart/form-data 폼 지원 라이브러리
- 주로 파일 업로드와 같은 고용량 데이터 전송에 사용한다.
- 설치:  
  `npm i connect-multiparty`

```html
<!-- 업로드 뷰 -->
<form method="post" enctype="multipart/form-data">
  <table>
    <tr>
      <td><label>Comment</label></td>
      <td><input type="text" name="comment" /></td>
    </tr>
    <tr>
      <td><label>Password</label></td>
      <td><input type="file" name="image" /></td>
    </tr>
  </table>
  <input type="submit" name="" />
</form>
```

```html
<!-- 업로드할 파일이 여러개일 경우 -->
<input type="file" name="image" multiple="multiple" />
```

```javascript
// connect-multiparty
// 파일 업로드 예제

// 앱 설정
const express = require('express');
const app = express();
const port = 3000;

//-------------------------------------------
// 정적 위치 설정
app.use(express.static(__dirname + '/static'));
// 뷰엔진 설정
app.set('views', __dirname + '/view');
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);
// 쿠키 파서 설정
// const cookieParser = require('cookie-parser');
// POST 파서 설정
// const bodyParser = require('body-parser');
// app.use(cookieParser());
// app.use(bodyParser.urlencoded({ extended: false }));
// 파일 읽기
// const fs = require('fs');
// 멀티 파트 파서 설정
var multipart = require('connect-multiparty');
app.use(multipart({ uploadDir: __dirname + '/uploaded' }));
// 세션 설정 (브라우저에서 connect.sid 라는 이름의 세션키 쿠키 확인 가능)
// var session = require(`express-session`);
// app.use(session({
//     secret: 'secret key',
//     resave: false,
//     saveUninitialized: true
// }));
//-------------------------------------------

// 뷰 렌더
app.get('/upload', function (req, res) {
  res.render('upload.html');
});

app.post('/upload', function (req, res) {
  var comment = req.body.comment;
  var imageFile = req.files.image;

  if (imageFile) {
    //파일이 있을 경우
    var name = imageFile.name;
    var path = imageFile.path;
    var type = imageFile.type;

    if (type.indexOf('image') != -1) {
      // 이미지 파일입니다.
      var outputPath = __dirname + '/uploaded/' + Date.now() + '_' + name;
      fs.rename(path, outputPath, function (error) {
        res.send('<h1>Success</h1>');
      });
    } else {
      // 이미지 파일이 아닌 경우 파일을 제거한다.
      fs.unlink(path, function (error) {
        res.sendStatus(400); //유저 잘못
      });
    }
  } else {
    //파일이 없을 경우
    res.sendStatus(404);
  }
});

app.listen(port, function () {
  console.log(`application is listening on http://127.0.0.1:${port}`);
});
```

### 1.2.7. express-session 미들웨어

- 세션 기능 제공 (쿠키대신 서버에 값 저장)

```javascript
// connect-multiparty
// 파일 업로드 예제

const port = 3000;
//-------------------------------------------
// 익스프레스 설정
const express = require('express');
const app = express();
// 정적 위치 설정
// app.use(express.static(__dirname + '/static'));
// 뷰엔진 설정
// app.set('views', __dirname + '/view');
// app.set('view engine', 'ejs');
// app.engine('html', require('ejs').renderFile);
// 쿠키 파서 설정
// const cookieParser = require('cookie-parser');
// POST 파서 설정
// const bodyParser = require('body-parser');
// app.use(cookieParser());
// app.use(bodyParser.urlencoded({ extended: false }));
// 파일 읽기
// const fs = require('fs');
// 멀티 파트 파서 설정
// var multipart = require('connect-multiparty');
// app.use(multipart({ uploadDir: __dirname + '/uploaded' }));
// 세션 설정 (브라우저에서 connect.sid 라는 이름의 세션키 쿠키 확인 가능)
var session = require(`express-session`);
app.use(
  session({
    secret: 'secret key',
    resave: false,
    saveUninitialized: true,
  })
);
//-------------------------------------------

app.use(function (req, res) {
  req.session.now = new Date().toUTCString();
  res.send(req.session);
});

app.listen(port, function () {
  console.log(`application is listening on http://127.0.0.1:${port}`);
});
```

### 1.2.8. ejs 뷰 엔진 미들웨어

- 뷰 제공
- 외부 모듈이므로 설치 필요  
  `npm i ejs`

```javascript
// 뷰엔진 설정 부분
app.set('views', __dirname + '/view');
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

// 렌더 부분
app.get('/login', function (req, res) {
  res.render('login.html');
});
```

---

## 1.3. express-generator

> express 프로젝트 템플릿을 자동 생성해 준다.

- 설치 (관리자 권한 필요)  
  `npm i -g express-generator`
- 실행  
  `express [프로젝트이름] --view=pug` pug 뷰엔진을 가진 템플릿 생성  
  `cd [프로젝트이름]`  
  `npm install` 라이브러리 설치  
  `SET DEBUG=[프로젝트이름]:*`
  `npm start` 서버 실행

---

## 1.4. 참고

### 1.4.1. expresss 공식 문서

<http://expressjs.com/en/4x/api.html>

### 1.4.2. HTTP 상태 코드

- 200 OK
- 304 Not modified (이전과 페이지 내용이 동일하다는 의미)
- 400 Bad Request (유저 잘못)
- 403 Forbidden (권한 없음)
- 404 Not Found (주소 없음)
- 500 Internal Server Error (서버 에러)
