# AI

## 용어

- 모델(model) = 데이터(학습) + 알고리즘 + 하이퍼파라메터 조정
- 피쳐(feature) = 정답을 제외한 데이터의 속성 (부가 데이터)
- 레이블(label) = 모델이 맞추려는 목표 (목표 데이터)
- train = 학습데이터 (80%)
- test = 평가데이터 (20%)
- 독립변수 (원인) - 어떤 변수에도 영향을 받지 않음
- 종속변수 (결과) - 독립변수에 영향을 받음

## 어떤 알고리즘을 사용해야 할까요?

조건에 따라 다르다. 참고 <https://www.sas.com/ko_kr/solutions/ai-mic/blog/machine-learning-algorithm-cheat-sheet.html>

- 데이터의 크기, 품질, 특성
- 가용 연산(계산) 시간
- 작업의 긴급성
- 데이터를 이용해 하고 싶은 것

## 데이터 포맷 종류

- 문자열
- 정수
- 더블
- 불린
- 데이트타임
- 타임스팬 (간격)

## 라벨과 피쳐

- Y = w x X + b
- Label(Y) : 최종적으로 알고 싶은 값
- Feature(X) : 영향을 주는 값
- Weight(w): 가중치. feature가 얼마나 영향을 주는지
- Bias(b): 바이어스. feature가 0일때 기본 결과 값
- 모델이란 w와 b를 찾아내는 것이다

## 무료 데이터 샘플 가져오기

- <https://www.kaggl.com>
