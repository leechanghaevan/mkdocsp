# Mkdocs

> mkdocs는 마크 다운 기반의 웹문서 생성기이다. 본 사이트를 만드는데 사용되었다.  
> mkdocs를 설치하기 위해선 파이썬이 설치되어 있어야 한다.

## 설치

- pip 최신버전으로 유지 `pip install --upgrade pip`
- mkdocs 설치 `pip install mkdocs`
- mkdocs 버전 확인 `mkdocs --version`

## 명령어

- 새 프로젝트 만들기 `mkdocs new [dir-name]` + 폴더 이동 `cd [dir-name]`
- 테스트 서버 시작 `mkdocs serve`
- 빌드 `mkdocs build`
- 헬프 `mkdocs -h`

## 설정 파일 (mkdocs.yml)

- 사이트 이름 설정
  >     site_name: [내사이트]
- 사이트 메뉴 설정
  >     nav:
  >         - Home: index.md
  >         - About: about.md
  >         ...
- 이미지 연결
  >     저장 위치: docs/img/2020-12-29-03-05-21.png
  >     링크 형식: ![img2](img/2020-12-29-03-05-21.png)
  >
  > vscode에서 Ctrl+Alt+v 누르면 클립보드 이미지가 파일로 저장되면서 링크도 생성된다. (Markdown Paste)

---

참고

1. [mkdocs.org](https://www.mkdocs.org/)
