---
description: Always(상시)와 OnDemand(호출형) 모드의 차이와 선택 기준.
icon: toggle-on
---

# Always vs OnDemand

| Mode | 언제 | 동작 |
|------|------|------|
| `Always` (기본) | 크루가 기본 워크플로 | sync된 rules의 `alwaysApply`를 upstream 그대로 유지 |
| `OnDemand` | 필요할 때만 | 모든 sync rules를 `alwaysApply: false`로 강제 + Cursor Skill로 호출 |

## Always

프로젝트가 “참고 재현 → 스펙 → 구현 → QA”를 자주 돌릴 때. Cursor가 system-crew 규칙을 기본으로 봅니다.

## OnDemand

평소는 일반 구현·버그픽스만 하고, 참고 재현·아이디어 평가할 때만 크루를 켭니다.

호출 예:

- `system-crew` / `시스템 크루`
- `Producer로` / `참고 재현` / `아이디어 평가해줘`
- Cursor Skill `system-crew` 활성화

OnDemand sync는 `.cursor/SYSTEM-CREW.md` 사용 메모도 생성합니다.

## 모드 유지

업데이트할 때도 **처음 고른 `-Mode`를 유지**하세요. 모드는 `.cursor/rules/.system-crew-mode`에도 저장됩니다.

```powershell
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1 -Mode Always
# 또는
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1 -Mode OnDemand
```
