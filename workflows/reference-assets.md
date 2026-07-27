# Workflow: Reference Assets (문서화·자산화)

참고 설명·영상·콘텐츠를 분석한 결과는 채팅으로 끝내지 않고 **프로젝트 문서 자산**으로 남긴다.

## 목표

1. 사용자가 짚은 포인트(`User callouts`)를 분리 기록
2. 관찰·가설·결정을 재검색 가능하게 저장
3. 이후 비슷한 시스템 요청 시 INDEX에서 재사용

## 저장 위치 (소비 프로젝트)

```text
docs/references/
  INDEX.md
  assets/
    YYYYMMDD-short-slug/
      ASSET.md              ← templates/reference-asset.md
      reference-brief.md    ← templates/reference-brief.md
      system-spec.md        ← templates/system-spec.md (승인 후)
      fidelity-report.md    ← 있으면
```

경로를 프로젝트에서 다르게 쓰려면 `.cursor/rules/local/`에만 오버라이드한다. 기본값은 `docs/references/`.

## 절차

### A. 작업 시작 전 (Producer / Analyst)

1. `docs/references/INDEX.md`와 태그로 유사 자산 검색
2. 재사용할 자산이 있으면 사용자에게 “이 자산 기반으로 갈지” 확인
3. 없으면 새 `Asset id` 발급: `YYYYMMDD-short-slug`

### B. 분석 중 (Systems Analyst)

1. **User callouts**를 먼저 채운다 (사용자가 타임스탬프·문장·UI로 짚은 것)
2. `reference-brief.md` 작성 (추측은 Hypothesis)
3. `ASSET.md`에 요약·태그·결정 초안 기록
4. `system-spec.md` 작성 후 승인 게이트

### C. 승인·구현·검수 후

1. 스펙 승인 시 `ASSET.md` Status → `approved`
2. 구현 반영 시 → `implemented` + artifact links 갱신
3. Fidelity 결과가 있으면 같은 폴더에 저장하고 링크
4. **INDEX.md에 행 추가/갱신** (필수)

## 품질 기준

- 콜아웃 없이 “대충 비슷함”만 있는 자산은 불합격 → 사용자에게 어떤 구간/요소인지 되묻기
- Sources에 URL·게임명·타임스탬프 중 하나 이상
- Tags 최소 2개
- Decisions 표에 Adopt/Defer/Reject가 비어 있지 않음 (분석만 하고 끝낼 때도 Defer로라도 기록)

## Cursor 호출 예

- `기존 references INDEX 검색해줘. 태그: dash, hitstop`
- `이 영상 2:14 구간 내가 말한 가속감 중심으로 새 reference asset 만들어줘`
- `분석만 자산화하고 구현은 나중에`
