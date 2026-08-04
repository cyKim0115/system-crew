---
description: 한 프롬프트에 성격이 다른 일이 섞이면 Stage로 나누고 현재 Stage만 실행합니다.
icon: stairs
---

# Stages and mixed requests

한 요청에 아래가 **둘 이상**이면 Producer가 `Request type: mixed`로 두고 Stage를 나눕니다.

| 신호 | 예 |
|------|-----|
| 역할이 다름 | 분석 + 구현, 평가 + 적용, 구현 + QA |
| 슬라이스가 다름 | 대시 시스템 + 맵 루프 |
| 산출물 성격이 다름 | 자산화만 + 코드까지 |

## 절차

1. Stage를 순서대로 나열 (담당 / 할 일 / 산출물 / 승인 게이트)
2. 사용자에게 계획을 짧게 보여 줌
3. **Stage 1만** 실행 (사용자가 Stage N을 지정하면 그것만)
4. 완료 후 다음 Stage를 Next로 선언 — 자동으로 전부를 이어서 끝내지 않음

## 예

> “이 영상 분석·자산화하고, 상태머신 아이디어도 판단해서 괜찮으면 구현해줘”

→ Stage 1: Analyst 자산화 → Stage 2: Idea evaluation → Stage 3: (ADOPT*면) Implement …

한 패스에 분석+평가+구현+QA를 몰아하지 않습니다.
