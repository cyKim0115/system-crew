---
description: 설치 후 첫 참고 재현 요청을 어떻게 말할지.
icon: comments
---

# First request

설치가 끝나면 Cursor에 **참고 + 콜아웃 + 범위**를 한 번에 주면 Producer가 intake를 합니다.

## 좋은 첫 요청

```text
Producer로 intake 해줘.

참고: [유튜브 URL] 2:10–2:40
내가 짚은 점: 대시 후 히트스탑, 카메라 약간 줌인
유사도: inspired (핵심 루프만)
범위: 플레이어 대시 히트 피드백만. 적 AI·맵은 out.
```

## Producer가 확인할 것

- Request type (reference / idea / mixed / out_of_scope …)
- Similarity: `faithful` | `inspired`
- In / Out scope, 성공 조건
- 자산화 여부 (기본: `docs/references/`에 저장)
- Next: Systems Analyst / Idea evaluation / decline …

## 호출 예시 더보기

| 말 | 기대 |
|----|------|
| `이 영상처럼 … 만들어줘` + URL | 표준 from-reference 루프 |
| `분석만 자산화해줘. 구현은 나중에` | Analyst까지, 구현 없음 |
| `상태머신으로 바꾸는 게 나을 것 같은데, 판단해서 적용해줘` | Idea evaluation 먼저 |
| `이 채팅 습관을 스킬로 남겨줘` | out_of_scope → 프로젝트 스킬 경로 |

프로토콜이 맞는지 애매하면 [Out of protocol](../learn/out-of-protocol.md)을 보세요.
