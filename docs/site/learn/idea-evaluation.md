---
description: 시스템·구현 아이디어를 Feasibility / Direction / Efficiency로 평가한 뒤 판정합니다.
icon: scale-balanced
---

# Idea evaluation

사용자가 **방법·구조 아이디어**를 내며 “판단해서 적용해줘”라고 할 때 따릅니다.  
무조건 수용하지 않습니다.

## 평가 축

1. **Feasibility** — 현재 엔진·코드로 가능한가, 리스크·선행 작업은?
2. **Direction fit** — 기존 패턴·참고 목표·제품 방향과 맞는가?
3. **Efficiency** — 이득 대비 비용, 더 단순한 대안은?

각 축에 `Pass` / `Partial` / `Fail` + 근거.

## 판정

| Verdict | 의미 | 다음 |
|---------|------|------|
| `ADOPT` | 그대로 적용 | 스펙/구현 |
| `ADOPT_WITH_CHANGES` | 방향 수용, 방법 수정 | 수정안 확인 후 진행 |
| `DEFER` | 지금은 아님 | 재검토 조건 기록 |
| `REJECT` | 비효율·부적합 | 근거 + 대안 |

**판정 전 본구현 금지.**

## REJECT vs 실험

- `REJECT` = **제품 채택** 거절이지, 영구 금지가 아님
- 시간 제한 실험이면 새 idea log로 재판정 가능 (`exp/*` 브랜치로 안별 비교)
- 실험 후에도 제품 머지는 **별도 `ADOPT*`**

산출물: 소비 프로젝트 `docs/decisions/ideas/` (+ INDEX). 템플릿은 [Templates](../templates/overview.md).

플레이북: [Idea then implement](../playbooks/idea-then-implement.md)
