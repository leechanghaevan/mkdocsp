# Git

## 개요

- 깃은 여러 사용자들 간에 공유하는 파일들의 변경 사항을 추적하기 위한 시스템이다. 소스 코드 관리에 주로 사용된다.

## 명령어

- **빈 리포지토리 생성**  
  `git init`

- **복제 리포지토리 생성**  
  `git clone URL`

- **스테이징 (업데이트된 파일 모두 추가)**  
  `git add .`

- 스테이징 영역에 추가된 내역 조회  
  `git status`

- **커밋** (vscode에서는 commit 버튼을 누르면 `git add .` 가 먼저 실행된다.)  
  `git commit -m "설명"`

- 직전 커밋과 하나의 커밋으로 합침, 또는 직전 커밋의 설명만 수정  
  `git commit --amend -m "새설명"`

>       이미 push 된 커밋을 amend 할 경우 merge 해야 하므로 주의하자

- 브랜치를 main으로 바꿀경우 (기본은 master)  
  `git branch -M main`

- 브랜치 생성 및 갈아타기  
  `git checkout -b [새브랜치]`

- 브랜치 변경 (마스터로 돌아오기)  
  `git branch master`

- 원격 저장소 주소 확인 (현재 연결된)  
  `git remote -v`

>       사용하지 않는 깃허브 계정 지우기
>           - 제어판 - 사용자계정 - Windows자격증명 - github 관련 삭제
>       깃헙에 push 할때 마다 Logon failed 떠서 github계정을 다시 물어보는 경우가 있다.
>           - 무시해도 잘 진행 된다

- 현재 유저 이름 조회/변경  
  `git config user.name`  
  `git config user.email`  
  `git config --global user.name [이름]`  
  `git config --global user.email [이메일]`

- **새 원격 저장소 연결**  
  `git remote add [저장소이름] [리포지토리 주소]`
  `git remote add origin [리포지토리 주소]`

- **푸시 (origin의 master 브랜치에)**  
  `git push [저장소이름] [브랜치]`  
  `git push origin master`

- **풀 (업데이트)**  
  `git pull`

- 현재 브랜치에 다른 브랜치 병합  
  `git merge [병합할브랜치]`

- 깃 히스토리 보기 (종료는 q)  
  `git log --oneline`

- 롤백 (커밋 취소)  
  `git reset --soft`

- 롤백 (변경 사항 삭제)  
  `git reset --hard`

- 현재 브랜치 확인  
  `git branch`

- 새 브랜치 생성  
  `git branch branch2`

- 새 브랜치로 전환  
  `git checkout branch2`

- 새 브랜치에 푸시  
  `git push origin branch2`

- 깃 업데이트  
   Windows: `git update-git-for-windows`  
   Linux/Unix: `git update`

- 깃 GUI 실행  
  `gitk`

<!-- > vscode에서 깃허브에 push할 때 마다 크래덴셜을 물어보는 경우
> Window: `git config --global credential.helper wincred --global`
> Linux: `git config --global credential.helper store --global` -->

---

참고

1. [git - 간편 안내서](https://rogerdudler.github.io/git-guide/index.ko.html)
1. [누구나 쉽게 이해할 수 있는 Git](https://backlog.com/git-tutorial/kr/)
