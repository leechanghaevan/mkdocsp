# IntelliJ

> IntelliJ (이하 편집기)는 통합 IDE이다. 파생툴로 Webstorm, Rider 등이 있다.  
> 자동 완성 기능에선 타의 추종을 불허한다.

## 크롬 디버깅

- 크롬 웹스토어 에서 JetBrains IDE Support 플러그인 설치
- 편집기에서 디버깅할 파일 예를 들어 index.html 선택후 오른쪽 클릭 > 디버깅 선택
- 자동으로 편집기 내부 웹서버 시작 + 크롬 실행 + 하단에 디버깅 메뉴 활성화됨
- f8 f9 등으로 디버깅 하면 됨. 끝.

## 타입 스크립트 컴파일

- tsconfig.json만 있으면 오른쪽 클릭하면 `compile typescript` 메뉴가 알아서 뜸
- 터미널에서 `tsc` 입력한 것과 동일
- 매크로 기능으로 컴파일 + 디버깅 리로딩 조합 추천

## 단축키

- `ctrl + /` line comment
- `shift + ctrl + /` block comment

- `shift + enter` 아래에 행 삽입

- `ctrl + space` 자동완성: 추천 값
- `alt + enter` 자동완성: 에러 수정

- `ctrl + alt + l` 포매팅
- `shift + arrow` 선택: 한칸씩
- `shift + ctrl + arrow` 선택: 한 단어씩
- `shift + alt + drag` 드래그 영역의 텍스트 선택

- `ctrl + f5` Debug Rerun / 리로드
