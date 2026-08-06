# system-crew Changelog

소비 프로젝트가 **submodule pull + sync 전에** “이번 버전에 적용할 만한 게 있는지” 볼 때 이 파일을 본다.  
검색용 정제본은 rag `docs/assets/*-system-crew-changelog*.md` (팩 릴리스 시 자동 캡처).

형식: Keep a Changelog 요약. **Added / Changed / Fixed**. 내부 타이포만은 생략.

---

## [0.6.0] — 2026-08-06

### Added

- `CHANGELOG.md` — 버전 히스토리 SoT
- 팩(프로토콜) **의미 있는 릴리스** 시 `capture-to-rag` **자동** 캡처 (검토 제안이 아님). 목적: 다른 기기/호스트가 RAG로 “적용할 업데이트”를 조회
- Agent Playtest 가드레일을 프로토콜에 반영 (호스트 인프라 경계, realtime timeout, TimeScale 0.1~3, 증거 예산, Bootstrap 우선) — 커밋 `dc30285` 포함 정리

### Changed

- Producer/QA/Implementer·사이트 문서에 playtest·out_of_scope(Webhook/Recorder) 동기화

---

## [0.5.5] — 2026-08-05

### Changed

- `capture-to-rag` 수행 시 Discord(`DISCORD_RAG_WEBHOOK_URL`)까지 Producer 경로에 명시

---

## [0.5.4] — 2026-08-05

### Added

- rag 존재 시 리서치·아이디어·자산화 마무리 후 `capture-to-rag` **검토** 제안 (강제 저장 아님)

---

## [0.5.3] — 2026-08-03

### Added

- `REJECT` = 제품 채택 거절 / 경쟁 안은 `exp/*` 브랜치 비교 후 별도 `ADOPT*`
- GitBook 공개 학습서 소스 `docs/site/` (후속 커밋)

---

## [0.5.2] — 2026-07-31

### Added

- Implementer: 슬라이스 도달(`How to playtest`) · 일시 검증 도구 폐기 · 반복 인프라는 호스트에

---

## [0.5.1] — 2026-07-31

### Changed

- 프로토콜 밖 재라우팅·런타임 검증 문구 정리
- sync UTF-8 템플릿 분리 (PowerShell 한글 깨짐 방지)

---

## [0.5.0] — 2026-07-31

### Added

- 프로토콜 밖(`out_of_scope`) → 4역할 루프 거절·재라우팅
- Implementer 런타임 검증 루프 (컴파일만으로 완료 금지)

---

## [0.4.0] — 2026-07-27

### Added

- OnDemand(호출형) sync 모드
- 혼합 요청 → Stage 분할, **현재 Stage만** 진행

---

## [0.3.0] — 2026-07-27

### Added

- 아이디어 실현성·방향성·효율 평가 워크플로 (`ADOPT*` / `DEFER` / `REJECT`)

---

## [0.2.0] — 2026-07-27

### Added

- 참고 분석 자산화 템플릿·워크플로 (`docs/references/`)

---

## [0.1.0] — 2026-07-27

### Added

- 초기 팩: Producer / Systems Analyst / Implementer / Fidelity QA
- 로컬 서브모듈 설치·UTF-8 sync
