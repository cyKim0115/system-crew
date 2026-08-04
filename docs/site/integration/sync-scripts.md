---
description: install-as-submodule과 sync-to-project 스크립트 사용법.
icon: terminal
---

# Sync scripts

| 스크립트 | 역할 |
|----------|------|
| `scripts/install-as-submodule.ps1` | 소비 프로젝트에 submodule 추가 (`-Mode Always` \| `OnDemand`) |
| `scripts/sync-to-project.ps1` | submodule 내용을 `.cursor/rules/` 등으로 배포 |

```powershell
# 설치
powershell -File ..\system-crew\scripts\install-as-submodule.ps1 -Mode OnDemand

# 동기화 (모드 유지)
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1 -Mode OnDemand
```

OnDemand sync는 `consumer/SYSTEM-CREW.on-demand.md`에서 `.cursor/SYSTEM-CREW.md`를 생성합니다 (UTF-8 템플릿 — 한글을 `.ps1`에 넣지 않음).

원본을 GitHub에 올리고 `.gitmodules`가 그 URL을 가리키게 하면 다른 머신에서 clone + submodule fetch가 쉬워집니다.
