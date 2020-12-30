# 벤치마크

## Google Analytics vs Firebase Analytics

| Google Analytics                              | Firebase Analytics                                        |
| :-------------------------------------------- | :-------------------------------------------------------- |
| 모바일 + 웹(웹 중심)                          | 모바일 중심(웹 적용 안됨)                                 |
| 샘플 데이터 수집(Audience Tool 존재하지 않음) | 전체 데이터 수집(Audience Tool존재)                       |
| screenview중심, Behavior flow파악 가능        | Funnel Analysis(event중심, screenview를 event로 취급가능) |
| 유료, user data추출 불가능                    | 무료, user data를 추출하는데 약간의 돈이 들어감           |
|                                               | user segmenation후 Notification 사용 가능                 |
|                                               | 자동으로 app usage data collect                           |
| 상대적으로 빠름(샘플 유저)                    | 상대적으로 느림(전체 유저)                                |
|                                               | Google BigQuery 접근 가능                                 |
