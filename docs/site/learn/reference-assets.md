---
description: 참고 분석을 docs/references/에 자산화하고 INDEX로 재검색합니다.
icon: box-archive
---

# Reference assets

참고 분석은 채팅으로 끝내지 않고 **프로젝트 문서 자산**으로 남깁니다.

## 목표

1. 사용자가 짚은 포인트(`User callouts`)를 분리 기록
2. 관찰·가설·결정을 재검색 가능하게 저장
3. 비슷한 요청 시 INDEX에서 재사용

## 저장 위치 (소비 프로젝트)

```text
docs/references/
  INDEX.md
  assets/
    YYYYMMDD-short-slug/
      ASSET.md
      reference-brief.md
      system-spec.md       # 승인 후
      fidelity-report.md   # 있으면
```

## 품질

- 콜아웃 없이 “대충 비슷함”만 → 불합격 (구간·요소를 되물음)
- Sources에 URL·게임명·타임스탬프 중 하나 이상
- Tags 최소 2개
- Decisions 표에 Adopt/Defer/Reject (분석만 해도 Defer로라도)

절차·호출 예: [Analysis only](../playbooks/analysis-only.md) · 레포 `workflows/reference-assets.md`
