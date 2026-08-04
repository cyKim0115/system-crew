---
description: 구현 없이 참고 분석만 자산화할 때.
icon: file-lines
---

# Analysis only

구현 없이 참고를 문서 자산으로만 남길 때.

```text
분석만 자산화해줘. 구현은 나중에.
참고: …
내가 짚은 점: …
```

## 수행 범위

- Producer: intake + 자산화 의도 확인
- Systems Analyst: INDEX 검색 → 자산 폴더 → brief / ASSET (필요 시 draft spec)
- Status: `draft` 또는 `approved`
- Implementer / Fidelity QA는 **이번 Stage에서 하지 않음**

나중에 구현할 때 같은 Asset id로 이어가거나, INDEX에서 재검색합니다.
