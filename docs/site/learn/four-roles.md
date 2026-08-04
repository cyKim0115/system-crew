---
description: Producer, Systems Analyst, Implementer, Fidelity QA의 책임과 라우팅.
icon: users
---

# Four roles

| 역할 | 책임 |
|------|------|
| **Producer** | 요청 접수, 범위·유사도, Stage 분할, 프로토콜 밖 재라우팅 |
| **Systems Analyst** | 참고 분해 → brief / asset / system-spec |
| **Implementer** | 승인 스펙을 코드·씬으로, 런타임 검증 |
| **Fidelity QA** | 참고·스펙 대비 충실도 검수 |

## 언제 누구에게

| 상황 | 담당 |
|------|------|
| 새 요청, 범위 불명, 단계 선택 | Producer |
| 프로토콜과 무관 (스킬 문서화, 일상 툴링 등) | Producer → decline / 프로젝트 스킬 |
| 시스템·구현 아이디어 판단 | Producer (+ Analyst/Implementer 자문) |
| 영상·게임·문서 참고 분석 | Systems Analyst |
| 코드·씬·프리팹 구현 | Implementer |
| 참고 대비 검수 | Fidelity QA |

각 역할의 입·출력은 [Roles](../roles/producer.md) 섹션에 서술형으로 정리되어 있습니다. Cursor가 읽는 지시문은 `roles/*.md`입니다.
