# CHAT

## 개요

- 게임챗 또는 메신저로 사용 가능한, 웹 소켓 기반의 채팅 서버 개발 프로젝트.

## 개발 플랫폼 선택

- 플랫폼? nodejs? java spring? c#?
- (x) c# - 웹서비스를 고려해서 포기 (ASP를 할 생각은 없으므로)
- (x) Java Spring - 멀티쓰레드라서 포기 (동접 = 쓰레드 개수 제한과 데드락)
- (o) nodejs - IO가 빠르고 싱글쓰레드

## 사용할 기술

- nodejs (서버)
- typescript (클라)

## 게임챗 기본 함수

```javascript
// 서버 접속
chatsv.connect(127.0.0.1, 6000);

// 그룹 생성 (제목, 태그, 메타정보, 최대인원, 패스워드)
chatsv.createGroup("title", ["tag1",...], "meta-data", maxCnt, "pwd");
// 그룹 생성 (group_id를 외부에서 직접 지정함)
chatsv.createGroupWithID("group_id", "title", ["tag1",...], "meta-data", maxCnt, "pwd");


// 그룹 정보 변경 (제목, 태그, 메타정보, 최대인원, 패스워드)
chatsv.modifyGroup("group_id", "title", ["tag1",...], "meta-data", maxCnt, "pwd");

// 타이틀로 그룹 검색 (단어 포함)
chatsv.findGroupsByTitle("title");
// 태그로 그룹 검색 (단어 일치)
chatsv.findGroupsByTag(["tag1",...]);
// 내가 속한 그룹 검색
chatsv.findGroupByID("group_id");
// 내가 속한 그룹 검색
chatsv.findMyGroups();
// 모든 그룹 표시 (개발용)
chatsv.devFindAllGroups();

// 그룹 조인
chatsv.joinGroup("group_id");
// 그룹 탈퇴
chatsv.exitGroup("group_id");

// 그룹에 초대
chatsv.inviteUsers("group_id", ["user_id1", "user_id2"]);

// 메시지 보내기
chatsv.sendMsgGroup("groud_id", "msg");

// 콜백 - 그룹생성
function onCreateGroup(ok:bool, info:{groud_id, title, meta-data, cnt, maxCnt, hasPwd});
// 콜백 - 그룹 정보 변경 (변동없는 정보들은 null값을 가진다)
function onModifyGroup(ok:bool, info:{groud_id, title, meta-data, cnt, maxCnt, hasPwd});
// 콜백 - 그룹 찾기 범용
function onFindGroups(ok:bool, infos:[{groud_id, title, meta-data, cnt, maxCnt, hasPwd},...]);
// 콜백 - 그룹 조인
function onJoinGoup(ok:bool, info:{groud_id, title, meta-data, cnt, maxCnt, hasPwd},
                    users:["user_id",...]);

// 이벤트는 내 요청과 관계없이 외부에서 발생하는 것
// 이벤트 - 조인
function onEvtJoinGroup("user_id");
function onEvtExitGroup("user_id");

// 이벤트 - 메시지
function onEvtMsg("user_id", "group_id", "msg");

```

## 게임 유스케이스

```javascript
// 서버 접속 (게임 서버가 6700 이라면, 챗 서버는 포트 + 1)
chatsv.connect(127.0.0.1, 6701);
// 파티 그룹 생성
chatsv.createGroup("title", ["party"], "", 5, "");
// 파티 그룹 검색
chatsv.findGroupsByTag(["party"]);
// 메세지 전송
chatsv.send("all", "text"); //전체에게
chatsv.send("party_id", "text"); //파티에게
chatsv.send("guild_id", "text"); //길드에게
chatsv.send("private_id", "text"); //1:1에게
```

## 메신저 유스케이스

```javascript
todo! 메신저 유스케이스
```
