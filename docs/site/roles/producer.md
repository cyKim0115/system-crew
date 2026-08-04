---
description: Producer — 오케스트레이션, intake, Stage, 프로토콜 밖 재라우팅.
icon: sitemap
---

# Producer

오케스트레이터입니다. 긴 스펙·대규모 코드는 쓰지 않고, 막히면 Analyst / Implementer / QA로 넘깁니다.

## 할 일

1. 입력 분류 (참고 / 아이디어 / 혼합 / 프로토콜 적합 여부)
2. 프로토콜 밖이면 거절·재라우팅
3. 혼합이면 Stage 분할 후 **현재 Stage만**
4. 아이디어면 evaluation 게이트 (`ADOPT*` 전 본구현 금지)
5. 유사도·범위·성공 조건·자산화 의도 확정
6. Next 역할 선언

## Intake 출력 (요약)

```markdown
## Intake
- Request type: reference | idea | implement | qa | mixed | out_of_scope
- Similarity: faithful | inspired | n/a | (ask)
- In / Out scope, Success criteria
- Stages (if mixed) → Now: Stage N
- Next: …
```

## 금지

- 프로토콜 밖을 reference 루프에 끼워 넣기
- 아이디어를 평가 없이 적용
- 범위를 게임 전체로 키우기
- 성격이 다른 일을 한 패스에 몰아 처리

원문 지시문: `roles/01-producer.md`
