# Workflow: From Reference → Implementation

사용자가 시스템 설명 또는 참고(영상·게임·콘텐츠)를 주면 이 루프를 따른다.

```
User input
  → Producer (intake + similarity + scope + asset intent)
  → Systems Analyst (search INDEX → brief + ASSET + spec)
  → User approval gate
  → Implementer (vertical slice)
  → Fidelity QA (report + asset status update)
  → fix loop or done
```

문서 자산화 상세: `workflows/reference-assets.md`

## Phase 0 — Intake (Producer)

- 참고 목록(URL, 게임명, 타임스탬프, “몇 분 구간”)을 모은다.
- **User callouts**: 사용자가 무엇을 비슷하게 하고 싶은지 확인한다.
- 유사도: `faithful` | `inspired` 확정.
- In/Out scope, 성공 조건 확정.
- 영상이 길면 “어느 구간을 재현할지”를 질문한다.
- 기본으로 분석 결과는 `docs/references/`에 자산화한다.
- **프로토콜 밖**: 참고 재현·시스템 구현·아이디어 평가가 아니면 루프를 시작하지 않고 재라우팅한다. (`roles/01-producer.md`)
- **혼합 요청**: 역할·슬라이스·산출물 성격이 둘 이상이면 `mixed`로 Stage를 나누고 Stage 1만 진행한다. 자세한 기준은 `roles/01-producer.md`.

## Phase 1 — Analyze (Systems Analyst)

1. `docs/references/INDEX.md`에서 유사 자산 검색
2. 자산 폴더 생성 또는 기존 자산 재사용 합의
3. User callouts → `reference-brief.md` → `ASSET.md` → `system-spec.md`
4. INDEX 갱신
5. Open questions 정리
6. Producer가 사용자에게 승인 요청

## Phase 2 — Implement (Implementer)

- 승인 스펙만 구현.
- 플레이 방법 1문단 + QA 포인트를 남긴다. **슬라이스 도달 방법**(타이틀·인트로 등)을 포함한다.
- **런타임에서** 수직 슬라이스·엣지 케이스를 확인한 뒤 완료를 선언한다 (컴파일만으로 끝내지 않음).
- 검증용 **일시** 치트·스킵은 검증 후 폐기한다. 반복용 인프라만 남긴다.
- 호스트에 Agent Playtest(Webhook/Recorder/Until 등)가 있으면 그 스킬을 따르고, **realtime 타임아웃·증거 예산**(성공=짧은 근거, 실패=클립)을 지킨다.
- 가능하면 자산 `Artifact links`에 구현 위치 메모.

## Phase 3 — Verify (Fidelity QA)

- `templates/fidelity-report.md` (자산 폴더에 저장 권장)
- `ASSET.md` Status / links 갱신
- `NEEDS_FIX` → Implementer
- `NEEDS_SPEC` → Analyst
- `SHIPPABLE` → 종료 또는 다음 시스템 Intake
- **rag 탐지 시:** 이번 슬라이스에서 다른 프로젝트/기기에 넘길 교훈이 있으면 Producer가 `capture-to-rag` **검토**를 제안한다 (호스트 `docs/references/` 대체 아님).

## Cursor에서 호출 예시

- `Producer로 intake 해줘. 참고: ... / 내가 짚은 점: ...`
- `INDEX에서 dash·hitstop 자산 먼저 찾아줘`
- `Systems Analyst로 reference asset이랑 spec 작성`
- `분석만 자산화해줘. 구현은 나중에`
- `이 구현 아이디어 평가해줘. 괜찮으면 적용`
- `스펙 승인했어. Implementer로 구현`
- `Fidelity QA로 검수하고 자산 상태 갱신`
