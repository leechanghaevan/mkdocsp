# Unity3D

## 개요

> 애니메이션과 건축 시각화, 가상현실 등 인터랙티브 콘텐츠 제작을 위한 통합 저작 도구이다. - 위키백과

- 크로스플랫폼 게임 엔진.

## 장점

- c# 언어를 채용하여 생산성이 좋음

## 단점

- 비슷한 목적의 언리얼 엔진에 비해 고퀄리티 렌더링 퍼포먼스가 떨어진다고 평가됨

## 팁

- 특정 디파인 에서만 실행되는 함수

```c#
[System.Diagnostics.Conditional("UNITY_EDITOR")]
public static void Log (object message)
{
    UnityEngine.Debug.Log (message);
}
```

---

참고

- [에셋 스토어](https://assetstore.unity.com/)
