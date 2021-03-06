# 1. Node.js

## 1.1. 개요

> Node.js는 확장성 있는 네트워크 애플리케이션 개발에 사용되는 소프트웨어 플랫폼이다. 작성 언어로 자바스크립트를 활용하며 Non-blocking I/O와 단일 스레드 이벤트 루프를 통한 높은 처리 성능을 가지고 있다. - 위키백과

## 1.2. 참고자료

- 공식 문서: <https://nodejs.org/ko/docs/>
- expresss 공식 문서: <http://expressjs.com/en/4x/api.html>

---

## 1.3. 설정

### 1.3.1. 설치

- Windows:  
  직접 다운로드 또는 choco로 설치  
  `choco install nodejs -y`

### 1.3.2. 개별 패키지 설치

- 글로벌로 설치  
  `npm i xxx -g`
- 현재 폴더에 설치  
  `npm i xxx`
- 현재 폴더에 설치 하고 package.json에 추가  
  `npm i xxx --save` (--save는 생략가능)
- 글로벌에서 설치 삭제  
  `npm uninstall xxx -g`
- 글로벌 설치 목록 조회  
  `npm list -g`

### 1.3.3. yarn 설치

- yarn 은 향상된 npm이다. (필요?)
- `npm i -g yarn`
- `yarn --version`

### 1.3.4. 깃헙에서 프로젝트 받아온 경우 실행

- 의존성 라이브러리 설치  
  `npm i`
- 취약점 업데이트  
  `npm audit fix`
- 실행  
  `npm start`

### 1.3.5. nodejs 앱 실행

- 기본 실행  
  `node xxx.js`
- package.json 에 명령어 등록해서 앱 실행

```json
//package.json 예시
...
"scripts": {
  "start": "pm2 start app.js -i 0",
  "test": "pm2 start app.js --watch",
  "kill": "pm2 kill",
  "reload": "pm2 reload all"
},
...
```

```
npm start
npm test
npm run-script kill
npm run-script reload
```

### 1.3.6. 새 프로젝트 생성 과정

- 프로젝트명 빈 폴더 생성  
  `mkdir [프로젝트폴더]`  
  `cd [프로젝트폴더]`
- 프로젝트 초기화  
  `npm init`  
  `npm init -y`
- 디펜던시 편집 (수동을 할 필요 없음)
  `package.json`
- 라이브러리 설치 (package.json이 이미 있는 경우)
  `npm i`
- 특정 라이브러리 설치 (+ package.json에 추가)  
  `npm i [라이브러리이름] --save`

### 1.3.7. express, socket.io 프로젝트 생성 과정

- 가이드: <https://expressjs.com/ko/starter/installing.html>  
  `mkdir [프로젝트폴더]`  
  `cd [프로젝트폴더]`  
  `npm init`  
  `npm i socket.io --save`  
  `npm i express --save`

---

## 1.4. 주요 내장 모듈

### 1.4.1. console 내장 (콘솔)

```javascript
console.log('hello');
```

### 1.4.2. process 내장 (실행환경)

```javascript
process.argv; //실행 변수
process.env; //환경변수
process.version; //Node.js버전
process.platform; //플랫폼
process.exit(0); //종료
process.memoryUsage(); //메모리 사용량
process.uptime(); //현재 프로그램이 실행된 시간
```

### 1.4.3. exports 내장 (라이브러리)

- 모듈 (라이브러리) 내보내기 / 불러오기
- ES6 방식 (import)가 아니라, CommonJS 방식 (require("xxx"))를 사용한다.

```javascript
// 모듈 쪽 방법 1
// xxx.js 또는 xxx/index.js 의 내용
var myfunc = function () {};
module.exports = {
  func: myfunc,
  val: 10,
};
```

```javascript
// 모듈 쪽 방법 2
// xxx.js 또는 xxx/index.js 의 내용
// module.exports를 단순히 exports 라고 줄여서 표현한다.
exports.foo = function () {};
exports.val = 10;
```

```javascript
// 사용 측
// dummyDB.js
let module = require('./xxx');
module.foo();
```

### 1.4.4. os (시스템 호출)

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

### 1.4.5. url (url paring)

```javascript
var url = require('url');
url.parse(); //url 문자열을 url 객체로 변환리턴
url.format(); //url객체를 url문자열로 변환
url.resolve(from, to); //조합해서 URL 문자열 생성
```

### 1.4.6. util (유틸)

```javascript
var util = require("util");
util.format(,...); //문자열 조합
```

### 1.4.7. crypo (암호화)

> 해시 생성과 암호화 기능

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

- 대칭키 암호화 (AES)

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

### 1.4.8. fs (파일)

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

### 1.4.9. http (웹서버)

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

## 1.5. 주요 외부 모듈

### 1.5.1. ejs (뷰템플릿 엔진)

> View Template Engine
> Jave의 Thymeleaf 같은 역할

- 설치  
  `npm i ejs`

### 1.5.2. jade (뷰템플릿 엔진)

> View Template Engine
> pug 로 이름 바뀜? //todo! 확인필요

- 설치  
  `npm i jade`

### 1.5.3. socket.io (실시간 웹통신)

> Socket.io 는 브라우저에서 웹소켓을 지원하던, 지원하지 않던 관계없이 실시간 웹통신을 가능하게 에뮬레이션 해 주는 nodejs 라이브러리이다. (즉 Socket.io를 사용하면 개발할 때 웹소켓을 직접 사용할 필요가 없다는 뜻)

### 1.5.4. express (웹서버 프레임웍)

> Express.js, 또는 간단히 익스프레스는 Node.js를 위한 웹 프레임워크의 하나로, MIT 허가서로 라이선스되는 자유-오픈 소스 소프트웨어로 출시되었다. 웹 애플리케이션, API 개발을 위해 설계되었다. Node.js의 사실상의 표준 서버 프레임워크로 불리고 있다. - 위키백과
>
> express는 자바 스프링 같이 프레임웍이라고 생각하면 된다. 기본 http 모듈은 서블릿 같은 기본 기능이라고 보면 된다.

- 설치:  
  `npm i express` 프로젝트에 설치 (프로젝트 독립성 위해)  
  `npm i express -g` 글로벌 설치

```javascript
//기본 예제
const express = require('express');
const app = express();
const port = 3000;
//method get, path /
app.get('/', function (req, res) {
  res.send('Hello World!');
});
app.listen(port, function () {
  console.log(`application is listening on port ${port}...`);
});
```

- 자세한 내용은 [express](express.md) 페이지에서 다룬다.

### 1.5.5. cluster (코어 하나당 노드 프로세스를 실행한다)

- pm2를 사용하면 굳이 쓸 필요가 있나?

```javascript
const numCPUs = require('os').cpus().length; //코어개수 확인
const cluster = require('cluster');
const http = require('http');

if (cluster.isMaster) {
  console.log(`master: ${process.pid}`);

  // CPU 개수마큼 워커를 생산
  for (let i = 0; i < numCPUs; i++) {
    cluster.fork();
  }

  // 워커가 종료되었을 때
  cluster.on('exit', (worker, code, singal) => {
    console.log(`${worker.process.pid}: closed!`);
    // 프로세스 다시 살린다
    cluster.fork();
  });
} else {
  // 워커들이 포트에서 대기
  http
    .createServer((req, res) => {
      res.end(`Hi, I'm cluster`);
    })
    .listen(8005);
  console.log('worker: ', process.pid);
}
```

참고: <https://mongojs.tistory.com/15>

### 1.5.6. mysql

- 설치
  `npm i mysql`

```javascript
var mysql = require('mysql');
var client = mysql.createConnection({
  user: 'root',
  password: '비밀번호',
});

client.query('use company');
client.query('select * from mydb', function (error, result, fields) {
  if (error) console.log('error:' + error);
  else console.log(result);
});
```

---

## 1.6. 툴

### 1.6.1. pm2 (프로세스 매니저)

- 설치  
  `npm i pm2 -g`  
  `pm2 -version`
- 실행 (실행즉시 daemon화 되어, 에러가 나지 않는 이상 24시간 계속 유지됨)  
  `pm2 start example.js`
- 실행 옵션  
  --watch : PM2가 프로젝트의 변경사항을 감지하여 서버를 자동 리로드 (개발 단계에서 편리)  
  `pm2 start example.js --watch`  
  -i max(코어개수) : Node.js의 싱글 스레드를 보완하기 위한 클러스터(Cluster) 모드  
  -i 뒤에 코어의 개수를 입력하거나 max를 쓰면 최대 코어 개수로 클러스터링(Clustering) 된다  
  `pm2 start example.js --watch -i max`
- 종료  
  `pm2 kill`
- 실행 프로세스 목록 조회  
  `pm2 list`
- 모니터링  
  `pm2 monit`
- 리로드  
  `pm2 reload all`

참고: <https://engineering.linecorp.com/ko/blog/pm2-nodejs/>

> pm2 레퍼런스: <https://www.npmjs.com/package/pm2>

<!-- https://github.com/NodeRedis/node-redis -->

### 1.6.2. supervisor (서버 자동 갱신)

> 파일의 변경 사항을 인식하고 노드를 재 실행 시켜줌.  
> pm2 사용권장

- 설치:  
  `npm i -g supervisor`
- 사용법: node 대신 supervisor를 사용해 실행한다  
  `node myapp.js` => `supervisor myapp.js`
- 윈도우에서 실행할 권한이 없다고 뜨면 파워셀을 관리자 권한으로 실행 후 아래 입력한다  
  `set-executionpolicy unrestricted`

### 1.6.3. forever (생략)

> pm2 사용권장

- 설치:  
  `npm i -g forever`

---

## 1.7. 활용

### 1.7.1. 예외 처리

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

### 1.7.2. 이벤트

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

### 1.7.3. 가상 DB 생성 코드

```javascript
exports.db = (function () {
  var dummyDB = {};
  var storage = [];

  dummyDB.find = function (id) {
    if (id) {
      //아이디가 존재하면
      for (var i in storage) {
        if (storage[i].id == id) return storage[i]; //아이디에 해당하는 값 리턴
      }
    }

    //아이디가 없으면
    return false;
  };

  dummyDB.insert = function (id, data) {
    data.id = id;
    storage.push(data);
    return data;
  };

  dummyDB.remove = function (id) {
    for (var i in storage) {
      if (storage[i].id == id) {
        storage.splice(i, 1); //제거
        return true;
      }
    }

    return false; //삭제 실패
  };

  return dummyDB;
})(); //정의와 함께 이렇게 바로 함수 실행하면 싱글톤과 같은 역할을 한다.
```

```javascript
// 사용하는 쪽
const db = require('./dummyDB').db;
db.insert(12, { name: 'elee', age: 40 });
console.log(myDB.find(12));
```

---

## 1.8. 참고

1. [Node.js v14.15.3 Documentation 공식 API 문서](https://nodejs.org/dist/latest-v14.x/docs/api/)
1. [Node.js] Socket.IO와 Redis를 활용한 채팅 서버 개발: <https://library.gabia.com/contents/infrahosting/8018/>
1. Nodejs Native module
