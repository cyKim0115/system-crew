---
description: 산출물 템플릿과 소비 프로젝트의 저장 경로.
icon: table
---

# Templates overview

레포 `templates/`의 스키마를 소비 프로젝트 문서에 복사해 씁니다.

| 템플릿 | 용도 | 저장 위치 (소비 프로젝트) |
|--------|------|---------------------------|
| `reference-asset.md` | ASSET.md 본문 | `docs/references/assets/<id>/ASSET.md` |
| `reference-brief.md` | 콜아웃·관찰 brief | 같은 폴더 |
| `system-spec.md` | 승인용 스펙 | 같은 폴더 |
| `fidelity-report.md` | QA 리포트 | 같은 폴더 |
| `references-index.md` | INDEX 골격 | `docs/references/INDEX.md` |
| `idea-evaluation.md` | 아이디어 판정 | `docs/decisions/ideas/YYYYMMDD-….md` |
| `ideas-index.md` | 아이디어 INDEX | `docs/decisions/ideas/INDEX.md` |

{% hint style="info" %}
경로를 바꾸고 싶으면 `.cursor/rules/local/`에만 오버라이드합니다. sync된 pack 파일을 직접 고치지 마세요.
{% endhint %}
