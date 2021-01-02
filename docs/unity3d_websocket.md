# Unity3D Websocket

## websocket-sharp

- 유니티 엔진에서 웹소켓을 사용 가능하게 해 준다.

설치

- [Github-websocket-sharp](https://github.com/sta/websocket-sharp) 에서 전체프로젝트 또는 dll만 다운로드
- `websocket-sharp.dll`을 `Assets/Plugins`폴더에 복사

---

## WebSockets in .NET 4.5

- 닷넷 표준 웹소켓 .NET4.5 이상에서 사용 가능

설치

- [WebSocket .NET](https://docs.microsoft.com/ko-kr/dotnet/api/system.net.websockets.websocket?view=net-5.0)

---

참고

- <https://timeboxstory.tistory.com/69>
- [웹소켓 라이브러리 비교](https://www.codeproject.com/articles/733297/websocket-libraries-comparison)
- [웹소켓 서버 라이브러리 Fleck](https://github.com/statianzo/Fleck)
- [웹소켓 클라이언트 NHN에서 개발](https://github.com/nhn/socket.io-client-unity3) - Socket.IO v2 is not supported
- [WebSockets in .NET Core](https://devstarsj.github.io/development/2016/05/12/CSharp.AspnetCore.WebSocket/)
- [How to Install Node.js on Mac OS and Run Live Stream in 2 minutes](https://www.youtube.com/watch?v=Zjm5KGHyceU&feature=youtu.be)

---

출처: <http://www.gamecodi.com/board/zboard-id-GAMECODI_Talkdev-no-3234-z-8.htm>

모바일 게임이고

실시간 멀티플레이가 가능한 게임 서버를 만들려고 합니다. (클라는 유니티로)

웹서버로 하고 웹소켓을 고려중인데

그냥 TCP 소켓을 쓰는 방식에 비해 어떤 장단점이 있을까요?

추측입니다만 웹으로 가면 안정성과 개발편의성 등등이 있을것 같은데요.

어떻게들 보시나요?

저희 프로젝트가 WebSocket을 사용했었습니다.
실시간 PvP를 위해 사용되었습니다.
저희 서버쪽이 웹서버 베이스이기도하고,, 실시간 게임서버 개발에 대한경험이 딱히 없었기 때문에 사용했습니다.

구성은 아래와 같고,,
서버: NodeJS/SocketIO,
클라: Unity3D + WebSocket/SocketIO 지원 Http 클라이언트(UniWeb)

장점은,,
프로토콜이 무척 간단하고 쉽기 때문에, 오롯히 비지니스로직에만 집중할 수 있습니다.
리얼에 운영된 실시간 PvP의 서버코드가 1000라인 내외일정도니깐,, 개발속도만큼은 확실히 이득입니다.
클라도 에셋스토어에서 소켓IO지원 Http 모듈만 잘 구하면,, 오롯히 비지니스에만 집중가능합니다.
통신은 암호화된 Json으로 했습니다.

몇가지 이슈가 있었는데
클라:

- UniWeb SocketIO 가 구버전 프로토콜만을 지원
- 프로토콜 지원이 완벽하지 않아서(heartbeat 가 안보내지는 이슈..) Uniweb을 수정후 사용했습니다.
- 저희가 개발을 시작할 당시에 SocketIO를 지원하는 Unity 플러그인이 이거 밖에 없었는데,, 지금은 BEST HTTP도 있는것 같습니다.

서버:

- NodeJS문제인지 SocketIO문제인지,, 메모리가 지속적으로 누수되는 문제가 있습니다.
- 구글링 결과 SocketIO이슈인것 같긴한데,, 클라가 SocketIO 구버전 프로토콜만을 지원해서,, 버전업이 불가했습니다.
- 가비지 컬렉션으로 갑자기 순단이 발생합니다. 실시간 PvP 에서 순단이 무척 민감해서, 가비지 컬렉션 옵션을 이래저래 많이 신경써야 합니다.
- 하지만 아무리 신경써도 순단을 완벽히 막진 못합니다.

저희 게임이 흥행에 실패해서ㅠㅠ
사용자가 많진 않았지만,, 피크일때도 응답속도는 괜찮았습니다.
다만 메모리 누수때문에 지속적으로 서버 재붓을 해줘야 했던게...
메모리 누수 때문에 Java기반의 Vert.x 도 고려해봤는데,, 시간이 부족해서 이사는 못했네요.

출처: https://202psj.tistory.com/1347 [알레폰드의 IT 이모저모]

---

유니티 클라이언트와
Node.js 를 웹소켓 연결해서 썼었습니다.
서비스도 몇달동안 했었구요. 중국과 일본에서 접속자들이 꽤 있었는데
실시간 게임인데도 접속이나 전송관련해서 버그리포팅들어온건 따로 없었습니다.

웹소켓이 다른걸 떠나서 제일 큰 장점이라면
웹브라우져에서 돌아가는 서버 테스트용 더미 클라이언트를
바로바로 수정할수 있어서 신속하게 만들수가 있다는 거죠.

그래서 서버 스트레스 테스트 라던가 프로토콜 테스트할때 필요한
여러가지 시나리오를 죄다 만들어 놓고
테스트 유닛을 자동화 시켰었습니다.

시간은 그렇게 오래 걸리지 않았습니다.

다음 프로젝트 때도 웹소켓을 쓰겠냐고 묻는다면
별다른 문제가 생기지 않는한 쓸겁니다.
