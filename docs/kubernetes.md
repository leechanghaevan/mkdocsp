<!-- # Kubernetes

## 개요 - 쿠버네티스란?

> 쿠버네티스(Kubernetes "K8s")는 컨테이너화된 애플리케이션의 자동 디플로이, 스케일링 등을 제공하는 관리시스템으로, 오픈 소스 기반이다. 원래 구글에 의해 설계되었고 현재 리눅스 재단에 의해 관리되고 있다. 목적은 여러 클러스터의 호스트 간에 애플리케이션 컨테이너의 배치, 스케일링, 운영을 자동화하기 위한 플랫폼을 제공하기 위함이다. 도커를 포함하여 일련의 컨테이너 도구들과 함께 동작한다. - 위키백과

1. 요약 : 클라우드 환경 구축을 위해, 클라우드 환경 서비스 운영을 위해, 클라우드 환경에서 개발 지원하기위해 만들어진 느낌?? 엄청엄청 강력하다!

1. ha proxy 같은거 처럼 로드밸런싱도 해줄 수 있고

1. 클라우드 솔루션 제공하는 업체 처럼 오토스케일링 기능도 있고

1. 가상 ip와 OS랑 별도인 iptables 만들어서 엔드포인트 <-> 가상ip 연결 가능한거같고

1. 각 컨테이너는 가상ip, 다중 포트, 커스텀 포트 지원하고

1. 각 컨테이너에 대해, 외부 접근, 내부만 접근 가능하게 설정 가능 하고

1. 젠킨스처럼 배포도 가능한거 같다
   (배포 이력 관리까지 해주네)

1. 크론탭같은 스케쥴링 기능도 있고..

1. 스토리지 옵션에 깃 연동도 가능한거 같고

1. 각 컨테이너들 헬스 체크 하고, 죽은 컨테이너는 지가 다시 살리는 듯?

1. OS는 함께쓰고, 인프라의 CPU, 메모리, 디스크 공간 리소스만 나누니까 VM보다 가벼움

1. 결론 : 클라우드 환경 구축, 운영, 개발지원을 위해 태어난 녀석!

## 기본 개념

1. 마스터
   클러스터 구성에서 뇌 역할
   개발자는 마스터에 RESTful로 문의해서 각 컨테이너들 상태 조회하고, 설정도 할 수 있어보인다
1. 컨테이너
   지금까지의 VM 느낌인데, OS는 개별이 아니고 공용 사용!

1. 노드
   노드 == 컨테이너????

1. 파드
   관련있는 컨테이너들 끼리 묶고싶을 때 논리적 그룹화 개념
   아마.. 서비스별로 API 1번서버, API 2번서버 컨테이너 만들어놨다면
   이거 2개를 그룹화하고, 서비스 호출할 때 해당 파드를 호출하는 형식일듯?
   자동 로드밸런싱 될거같은데, 파드에서 로드밸런싱 해주는지 까지는 아직 모르겠다.
   여러 컨테이너 런타임 사용 가능하다

1. 컨테이너 런타임
   컨테이너를 실행시키기 위한 환경

1. 도커 는 CRI-O
   컨테이너 런타임 종류

1. 레이블
   키/값 구성이라는 데, 왜 필요한건지는 더 공부해보고 있다

1. 서비스
   엔드포인트 받아서 원하는 파드 중계하는 역할로 보인다

1. 복제 컨트롤러
   애플리케이션이 원하는 규모가 되도록 보장하는 역할
   이미지 인스턴스가 정해진 개수만큼만 실행되도록 관리
   얘가 아마 오토스케일링도 해주는건가 싶다

1. 레플리카 셋
   향상된 버전의 복제컨트롤러라는데..
   결국 1-7. 항목이랑 비슷하다고 이해 하고 있다

---

펌
<https://stage-loving-developers.tistory.com/category/%EC%9E%90%EA%B8%B0%20%EA%B0%9C%EB%B0%9C/Kubernetes> -->
