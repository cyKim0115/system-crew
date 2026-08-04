---
description: 아이디어 평가 후 ADOPT*일 때만 구현으로 진행합니다.
icon: lightbulb
---

# Idea then implement

```text
상태머신으로 바꾸는 게 나을 것 같은데, 판단해서 적용해줘.
```

## 흐름

1. Producer — Idea로 분류, 범위 고정
2. Idea evaluation — Feasibility / Direction / Efficiency
3. Verdict
   - `ADOPT` / `ADOPT_WITH_CHANGES` → 스펙·Implementer
   - `DEFER` / `REJECT` → 기록만, 본구현 없음
4. (선택) 경쟁 안이면 `exp/*` 브랜치로 시각 비교 후 **별도** 제품 `ADOPT*`

{% hint style="danger" %}
판정 전에 코드를 바꾸지 않습니다. mixed면 Stage로 나눠 평가 Stage만 먼저 끝냅니다.
{% endhint %}

학습: [Idea evaluation](../learn/idea-evaluation.md)
