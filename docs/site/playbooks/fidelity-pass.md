---
description: 구현 후 참고·스펙 대비 충실도를 검수하는 패스.
icon: clipboard-check
---

# Fidelity pass

```text
Fidelity QA로 검수하고 자산 상태 갱신해줘.
```

## 입력

- reference-brief + system-spec
- Implementer 메모 (How to playtest, Verified how, Done vs deferred)

## 판정

| Verdict | 의미 | 다음 |
|---------|------|------|
| `SHIPPABLE` | 이번 범위 성공 조건 충족 | 종료 또는 다음 시스템 Intake |
| `NEEDS_FIX` | 구현 수정 | Implementer |
| `NEEDS_SPEC` | 스펙·해석 애매 | Analyst |
| `BLOCKED` | 참고·환경 부족 | 블로커 해소 |

`inspired`면 핵심 루프만, `faithful`면 타이밍·피드백 누락을 엄격히.  
취향만으로 Fail하지 않고, 범위 밖 폴리시를 필수 Fail로 올리지 않습니다.

역할 상세: [Fidelity QA](../roles/fidelity-qa.md)
