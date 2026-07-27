# system-crew — AGENTS

이 프로젝트는 **system-crew** 프로토콜을 사용합니다. 목표는 사용자가 준 **설명·영상·콘텐츠 참고**를 바탕으로 비슷한 게임 시스템을 구현하는 것입니다.

## 기본 원칙

1. 추측으로 바로 코딩하지 않는다. 참고 → 분해 → 스펙 → 승인 → 구현 → 충실도 검증 순서를 따른다.
2. “비슷하게”의 기준을 먼저 고정한다: **충실 재현** vs **핵심만 영감**.
3. 참고 자료에 없는 기능은 임의 추가하지 않는다. 필요하면 옵션으로 제안하고 사용자 승인을 받는다.
4. 한 번에 전체 게임을 만들지 않는다. **한 시스템(또는 수직 슬라이스)** 단위로 진행한다.

## 역할 라우팅

| 상황 | 담당 |
|------|------|
| 새 요청, 범위 불명, 단계 선택 | Producer |
| 영상/게임/문서 참고 분석, 스펙 작성 | Systems Analyst |
| 코드·씬·프리팹 구현 | Implementer |
| 참고 대비 검수, 누락·괴리 지적 | Fidelity QA |

상세 역할: `roles/`. 표준 루프: `workflows/from-reference.md`.

## 사용자 입력 예시

- “이 영상처럼 대시 후 히트스탑이 있는 콤보를 만들어줘” + URL
- “슬레이 더 스파이어식 맵 노드 선택 루프”
- “우리 게임의 X 시스템에 Y 게임의 쿨다운 UI 감각만”

## 산출물

- `docs/references/` → 참고 분석 **자산** (INDEX + `assets/YYYYMMDD-slug/`)
- `templates/reference-asset.md` → 자산 요약 (콜아웃·태그·결정·재사용 힌트)
- `templates/reference-brief.md` → 참고 분해
- `templates/system-spec.md` → 구현 스펙
- `templates/fidelity-report.md` → 검수 결과

자산화 절차: `workflows/reference-assets.md`
