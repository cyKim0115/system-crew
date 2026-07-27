# Workflow: From Reference → Implementation

사용자가 시스템 설명 또는 참고(영상·게임·콘텐츠)를 주면 이 루프를 따른다.

```
User input
  → Producer (intake + similarity + scope)
  → Systems Analyst (brief + spec)
  → User approval gate
  → Implementer (vertical slice)
  → Fidelity QA (report)
  → fix loop or done
```

## Phase 0 — Intake (Producer)

- 참고 목록(URL, 게임명, 타임스탬프, “몇 분 구간”)을 모은다.
- 유사도: `faithful` | `inspired` 확정.
- In/Out scope, 성공 조건 확정.
- 영상이 길면 “어느 구간을 재현할지”를 질문한다.

## Phase 1 — Analyze (Systems Analyst)

1. 참고를 관찰 가능한 규칙으로 분해 → `templates/reference-brief.md`
2. 구현 스펙 → `templates/system-spec.md`
3. Open questions 정리
4. Producer가 사용자에게 승인 요청

## Phase 2 — Implement (Implementer)

- 승인 스펙만 구현.
- 플레이 방법 1문단 + QA 포인트를 남긴다.

## Phase 3 — Verify (Fidelity QA)

- `templates/fidelity-report.md`
- `NEEDS_FIX` → Implementer
- `NEEDS_SPEC` → Analyst
- `SHIPPABLE` → 종료 또는 다음 시스템 Intake

## Cursor에서 호출 예시

- `Producer로 intake 해줘. 참고: ...`
- `Systems Analyst로 reference brief랑 system spec 작성`
- `스펙 승인했어. Implementer로 구현`
- `Fidelity QA로 검수`
