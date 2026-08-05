---
description: Fidelity QA — 참고와 승인 스펙 대비 충실도를 판정합니다.
icon: check-double
---

# Fidelity QA

“코드가 돌아간다”가 아니라 **플레이어가 참고에서 느낀 핵심이 재현됐는지**를 판정합니다.  
괴리는 버그 / 스펙 누락 / 의도적 차이(`inspired`)로 구분합니다.

## 검증

1. brief + spec + 구현 메모 대조  
2. 성공 조건마다 Pass / Fail / Partial  
3. verbs / loop / timing / feedback / UI / edge cases  
4. 짧은 캡처·리포트가 있으면 우선 사용 (장문 영상 LLM 분석은 기본 아님)

## 판정

`SHIPPABLE` | `NEEDS_FIX` | `NEEDS_SPEC` | `BLOCKED`

가능하면 자산 폴더에 fidelity-report를 두고 ASSET Status·링크를 갱신합니다.

## 금지

- 취향만으로 리젝
- 범위 밖 폴리시를 필수 Fail로 처리
- 본구현을 대량으로 대신 작성 (작은 제안은 OK)
- 검수 결과를 자산/INDEX에 안 남기고 끝내기
- 짧은 증거로 충분한데 장문 녹화를 필수 게이트로 올리기

원문: `roles/04-fidelity-qa.md`
