---
description: faithful과 inspired — “비슷하게”의 기준을 먼저 고정합니다.
icon: bullseye
---

# Similarity goals

구현을 시작하기 전에 Producer가 유사도 목표를 확정합니다.

| 목표 | 의미 | QA 기준 |
|------|------|---------|
| `faithful` | 동작·피드백을 최대한 재현 | 누락·타이밍 괴리를 Fail 후보로 |
| `inspired` | 핵심 루프만 차용, 표현은 프로젝트에 맞춤 | 핵심 루프만 충족하면 Pass, 표현 차이는 기록 |

{% hint style="warning" %}
목표가 정해지지 않은 채 “대충 비슷하게”로 구현하면, QA와 사용자 기대가 어긋납니다. Intake에서 `ask`로 남겨도 됩니다.
{% endhint %}

예:

- “Y 게임의 쿨다운 UI **감각만**” → 보통 `inspired`
- “이 콤보의 히트스탑·캔슬 창까지 맞추고 싶다” → `faithful`에 가깝다
