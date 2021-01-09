# Chocolatey

## 개요

- 윈도용 패키지 매니저. 리눅스의 apt, yum 같은 역할

## Window에 설치

- 관리자 권한으로 파워셀 실행 후 아래 명령어 실행

```1
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## 명령어

- 패키지 설치  
  `choco install [패키지이름]`  
  `choco install [패키지이름] -y`
- 패키지 삭제  
  `choco uninstall [패키지이름] -y`
- 최신 버전으로 업데이트  
  `choco upgrade [패키지이름] -y`
- 설치된 목록 확인  
  `choco list --localonly`

## 추천 프로그램 목록

- `choco install git -y`
- `choco install nodejs -y`
- `choco install yarn -y`
