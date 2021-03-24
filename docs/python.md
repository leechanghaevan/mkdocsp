# Python

## 개요

> 파이썬은 1991년 프로그래머인 귀도 반 로섬이 발표한 고급 프로그래밍 언어로, 플랫폼에 독립적이며 인터프리터식, 객체지향적, 동적 타이핑 대화형 언어이다. 파이썬이라는 이름은 귀도가 좋아하는 코미디 〈Monty Python's Flying Circus〉에서 따온 것이다. - 위키백과

## 왜 파이썬 사용하나?

- 문법이 쉽다.
- 컴파일이 필요 없이 바로 실행된다
- 코딩 습관이 문법의 일부이기 때문에 코딩 스타일이 통일되어 있다. 그래서 공동 개발하기 좋다.
- 자료구조나 데이터 다루는 기능을 많이 제공한다.
- 데이터, 딥러닝 라이브러리를 지원한다. (판다스, 파이토치, 텐서플로 등)

## 활용분야

- 머신러닝 (파이토치, 텐서플로)
- 데이터분석 (판다스)
- 업무자동화
- 기타 (아두이노 제어 등)

## 파이썬 개발 환경

- 설치형: ”PyCharm” 커뮤니티 버전 무료 다운로드
- 설치형: ”주피터노트”. 데이터 분석 통합 패키지인 아나콘다 설치하면 자동 설치됨
- 비설치형: ”리플릿” (<https://repl.it/languages/python3>)
- 비설치형: ”코랩” (<https://colab.research.google.com/>) (구글에서 무료 제공해주는 클라우드형 주피터노트)

## 간단한 실습

- 브라우저로 코랩(<https://colab.research.google.com/>) 접속
- 새 노트 생성
- +코드 버튼 눌러서 코드 편집창 생성
- 코드 작성
  txt="hello world"
  print(txt)
- 코드 실행: 버튼 누르기 또는 단축키 Ctrl+Enter

## Window에 파이썬만 설치

- 파이썬 설치
  <http://www.python.org/downloads>
- pip 설치  
  `curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py.`  
  `python get-pip.py.`

## Window에 아나콘다 설치

> 아나콘다는 패키지 관리와 디플로이를 단순케 할 목적으로 과학 계산을 위해 파이썬과 R 프로그래밍 언어의 자유-오픈 소스 배포판이다. 패키지 버전들은 패키지 관리 시스템 conda를 통해 관리된다. - 위키백과

- 아나콘다 사이트에서 설치파일 다운로드 후 설치  
  <https://docs.anaconda.com/anaconda/install/>
- 또는 choco로 설치 (파워셀을 관리자 권한으로 실행 후 아래 실행)  
  `choco install anaconda3`
- 설치할 때 반드시 **환경변수 등록**을 체크해 준다.

## 파이썬 가상 환경 생성

- 기본 가상환경 이름은 base이다. 나만의 가상 환경을 생성하려면 아래처럼 한다.
- Anaconda Powershell 을 연다
- 아나콘다 업데이트  
   `conda update conda`
- 가상환경 목록 조회  
  `conda env list`
- 가상환경 생성  
  `conda create -n [MY_ENV] python=3.8`
- 가상환경 삭제  
  `conda env remove -n [My_ENV]`
- 현재 가상환경 활성화  
  `conda activate [MY_ENV]`
- 현재 가상환경 비활성화  
  `conda deactivate [MY_ENV]`

## 파이썬 패키지 설치

- 패키지 설치  
  `pip install [패키지명]`

## 클라우드형 개발 환경

- Datalore, Colab 등을 사용하면 SDK 설치 없이 온라인으로 파이썬(+주피터노트)을 개발할 수 있다.
- [Datalore](https://www.anaconda.com/datalore_navigator)
- [Colab](https://colab.research.google.com/notebooks/intro.ipynb)

## 문법

```
private __xxx
protected _xxx
public xxx
```

--

참고

1. [Anaconda Download](https://docs.anaconda.com/anaconda/install/
