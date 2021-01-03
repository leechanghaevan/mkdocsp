# Node.js

## 😊 개요

> Node.js는 확장성 있는 네트워크 애플리케이션 개발에 사용되는 소프트웨어 플랫폼이다. 작성 언어로 자바스크립트를 활용하며 Non-blocking I/O와 단일 스레드 이벤트 루프를 통한 높은 처리 성능을 가지고 있다. - 위키백과

---

## 😊 설정

### 설치

- Windows:  
  직접 다운로드 또는 choco로 설치  
  `choco install nodejs -y`

### npm 사용법

- 글로벌로 설치  
  `npm install xxx -g`
- 현재 폴더에 설치  
  `npm install xxx`
- 현재 폴더에 설치 하고 package.json에 추가
  `npm install xxx --save`
- 글로벌에서 설치 삭제  
  `npm uninstall xxx -g`
- 글로벌 설치 목록 조회  
  `npm list -g`

### 새 프로젝트 생성

- 프로젝트명 빈 폴더 생성  
  `mkdir [프로젝트폴더]`  
  `cd [프로젝트폴더]`
- 프로젝트 초기화  
  `npm init`
- 디펜던시 편집  
  `package.json`
- 라이브러리 설치  
  `npm install`
- 특정 라이브러리 설치 (+ package.json에 추가)
  `npm install [라이브러리이름] --save`

### express, socket.io 프로젝트 생성

- 가이드: <https://expressjs.com/ko/starter/installing.html>  
  `mkdir [프로젝트폴더]`  
  `cd [프로젝트폴더]`  
  `npm init`  
  `npm install socket.io --save`  
  `npm install express --save`

---

## 😊 주요 내장 모듈

### console 내장 모듈 (콘솔 출력)

```javascript
console.log('hello');
```

### process 내장 모듈 (시스템 제어)

```javascript
process.argv; //실행 변수
process.env; //환경변수
process.version; //Node.js버전
process.platform; //플랫폼
process.exit(0); //종료
process.memoryUsage(); //메모리 사용량
process.uptime(); //현재 프로그램이 실행된 시간
```

### exports 내장 모듈 (모듈 제어)

- 모듈 (라이브러리) 내보내기 가져오기

```javascript
// 모듈 쪽
// xxx.js 또는 xxx/index.js 의 내용
exports.foo = function () {};
```

```javascript
// 사용하는 쪽
let module = require('./xxx');
module.foo();
```

### os (시스템 호출)

```javascript
var os = require('os');
os.hostname(); //호스트 이름
os.type(); //운영체제 이름
os.platform(); //운영체제 플랫폼?
os.arch(); //운영체제 아키텍쳐?
os.release(); //운영체제 버전
os.uptime(); //운영체제가 실행된 시간
os.laodavg();
os.totalmem(); //총 메모리
os.freemem(); //가용 메모리
os.cpus(); //CPU
os.networkInterfaces(); //네트웍인터페이스
```

### url (url 파싱)

```javascript
var url = require('url');
url.parse(); //url 문자열을 url 객체로 변환리턴
url.format(); //url객체를 url문자열로 변환
url.resolve(from, to); //조합해서 URL 문자열 생성
```

### util (유틸)

```javascript
var util = require("util");
util.format(,...); //문자열 조합
```

### crypo (암호화)

- 해시 생성과 암호화 기능
- 해시 (복호화 불가)

```javascript
// 해시 생성과 암호화를 수행하는 모듈
var crypo = require('crypo');
// 해시 생성
var shasum = crypo.createHash('sha256');
shasum.update('crypo_hash');
var output = shasum.digest('hex');
//출력
console.log('crypto_hash:', output);
```

- AES 암호화

```javascript
var crypo = require('crypo');
var key = 'mykey';
var input = 'PASSWORD';

//암호화
var cipher = crypto.createCipher('aes192', key);
ciper.update(input, 'utf8', 'base64');
var cipheredOutput = cipher.final('base64');

//복호화
var decipher = crypto.createDecipher('aes192', key);
decipher.update(cipheredOutput, 'base64', 'utf8');
var decipheredOutput = decipher.final('utf8');
```

### fs (파일)

```javascript
// 읽기
var fs = require("fs");

// 즉시 읽기
var text = fs.readFile("textfile.txt", "utf8");
console.log(text);

// 읽기
fs.readFile('textfile.txt', 'utf8' function(error,data){
  console.log(data);
});
```

```javascript
// 쓰기
var fs = require('fs');

// 쓰기
var data = 'Hello World';
fs.writeFile('TextFileOtherWrite.txt', data, 'utf8', function (error) {
  console.log('Write File Asysnc Complete');
});

// 즉시 쓰기
fs.writeFileSync('TextFileOtherWriteSync.txt', data, 'utf8');
console.log('Write File Sysnc Complete');
```

- 비동기 함수는 에러 코드로 예외처리 한다.

```javascript
var fs = require('fs');

// 파일을 읽습니다
fs.readFileSync('textfile.txt', 'utf8', function (error, data) {
  if (error) {
    console.log(error);
  } else {
    console.log('File read complete:', data);
  }
});

fs.writeFile('textfile.txt', 'Hello World', 'utf8', function (error) {
  if (error) {
    console.log(error);
  } else {
    console.log('File write complete');
  }
});
```

### http (웹서버)

```javascript
var fs = require('fs');
var http = require('http');
http
  .createServer(function (request, response) {
    var date = new Date();

    //파일 읽어들임
    fs.readFile('index.html', function (error, data) {
      response.writeHead(200, {
        'content-type': 'text/html', //mime 타입
        'set-cookie': ['name = aaa', 'date = ' + date.toUTCString()], //쿠키 설정
      });

      //출력
      response.write(': current cookie is ' + request.headers.cookie);
      response.end(data);
    });
  })
  .listen(80, function () {
    console.log('server running');
  });
```

- 리다이렉션

```javascript
response.writeHead(302, { Location: 'http://www.naver.com' });
```

---

## 😊 주요 외부 모듈

### socket.io

- Socket.io 는 브라우저에서 웹소켓을 지원하던, 지원하지 않던 관계없이 실시간 웹통신을 가능하게 에뮬레이션 해 주는 nodejs 라이브러리이다. (즉 Socket.io를 사용하면 개발할 때 웹소켓을 직접 사용할 필요가 없다는 뜻)

---

## 😊 활용

### 예외 처리

- 동기(즉시) 함수는 try catch로 예외처리 한다.

```javascript
var fs = require('fs');

// 파일을 읽습니다
try {
  var data = fs.readFileSync('textfile.txt', 'utf8');
  console.log(data);
} catch (e) {
  console.log(e);
}

// 파일을 씁니다
try {
  fs.writeFileSync('textfile.txt', 'Hello World', 'utf8');
  console.log('file write complete');
} catch (e) {
  console.log(e);
}
```

### 이벤트

- 이벤트 핸들러

```javascript
// 종료 이벤트 처리
process.setMaxListeners(15); //최대 리스너 개수 지정 가능
process.on('exit', function () {
  //리스너 등록
  console.log('앱종료됨');
});
process.once('exit', function () {
  //1회성 리스너 등록
  console.log('앱종료됨');
});

// 처리되지 않은 예외 이벤트 처리
process.on('uncaughtException', onUncaughtException); //리스너 등록
process.removeListener('exit', onUncaughtException); //리스너 제거
process.removeAllListener('exit'); //리스너 모두 제거
```

- 이벤트 강제 발생

```javascript
process.emit('exit'); //이벤트 핸들러만 호출하지 실제 시스템이 종료되지는 않는다
```

- EventEmitter 모듈 밖으로 내보내기

```javascript
//rint.js
exports.timer = new process.EventEmitter();
setInterval(function () {
  exports.timer.emit('tick');
}, 1000);
```

```javascript
//app.js
var rint = require('./rint');
rint.timer.on('tick', function (code) {
  console.log('이벤트를 실행합니다.');
});
```

---

## 😊 참고

1. [Node.js v14.15.3 Documentation 공식 API 문서](https://nodejs.org/dist/latest-v14.x/docs/api/)
1. [Node.js] Socket.IO와 Redis를 활용한 채팅 서버 개발: <https://library.gabia.com/contents/infrahosting/8018/>
1. Nodejs Native module
