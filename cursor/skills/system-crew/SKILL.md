---
name: system-crew
description: >-
  On-demand game-system crew: turn user descriptions and reference videos/games
  into similar systems (Producer → Analyst → Implementer → Fidelity QA),
  reference asset docs, and objective idea evaluation.
  Use ONLY when the user explicitly invokes system-crew / 시스템 크루 / Producer /
  Systems Analyst / 참고 재현 / reference asset / 아이디어 평가, or asks to build a
  system from a reference. Do not use for ordinary feature work in this project.
---

# system-crew (on-demand)

이 스킬이 호출되었을 때만 system-crew 프로토콜을 적용한다.  
평소 프로젝트 룰·워크플로를 덮어쓰지 않는다.

## 활성화 시 따를 것

1. `.cursor/system-crew/AGENTS.md`
2. `.cursor/system-crew/workflows/from-reference.md`
3. `.cursor/system-crew/workflows/reference-assets.md`
4. `.cursor/system-crew/workflows/idea-evaluation.md`
5. 역할 파일: `.cursor/system-crew/roles/`

## 역할

| 요청 | 역할 |
|------|------|
| 범위·라우팅 | Producer |
| 참고 분해·스펙·자산화 | Systems Analyst |
| 구현 | Implementer |
| 충실도 검수 | Fidelity QA |
| 아이디어 판단 후 적용/거절 | Idea evaluation |

## 문서 경로

- 참고 자산: `docs/references/`
- 아이디어 판정: `docs/decisions/ideas/`

## 비활성 기본값

사용자가 system-crew를 부르지 않으면 이 스킬·프로토콜을 사용하지 않는다.
