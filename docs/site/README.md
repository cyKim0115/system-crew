---
description: Cursor용 4역할 팩 — 참고 설명·영상으로 비슷한 게임 시스템을 설계·구현·검증합니다.
icon: house
---

# system-crew

참고 설명·영상·콘텐츠를 바탕으로 **비슷한 게임 시스템을 설계·구현·검증**하는 Cursor 에이전트 프로토콜입니다.

게임 프로젝트에 git submodule로 넣은 뒤, sync로 Cursor rules를 배포합니다. 원본을 업데이트하면 소비 프로젝트에서 pull + sync로 반영합니다.

<table data-view="cards">
  <thead>
    <tr>
      <th></th>
      <th></th>
      <th data-hidden data-card-target data-type="content-ref"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Getting started</td>
      <td>설치, Always/OnDemand, 첫 요청</td>
      <td>
        <a href="getting-started/install.md">install.md</a>
      </td>
    </tr>
    <tr>
      <td>Learn the protocol</td>
      <td>멘탈 모델, 역할, 유사도, Stage, 자산화</td>
      <td>
        <a href="learn/mental-model.md">mental-model.md</a>
      </td>
    </tr>
    <tr>
      <td>Playbooks</td>
      <td>시나리오별 실행 순서</td>
      <td>
        <a href="playbooks/from-reference.md">from-reference.md</a>
      </td>
    </tr>
  </tbody>
</table>

{% hint style="info" %}
공개 사이트: [https://cykim.gitbook.io/system-crew/](https://cykim.gitbook.io/system-crew/)  
소스는 이 폴더(`docs/site/`)이며, Git Sync project directory는 `docs/site`입니다.
{% endhint %}

## 한 줄로

| 단계 | 누가 | 무엇을 |
|------|------|--------|
| Intake | Producer | 범위·유사도·프로토콜 적합 여부 |
| Analyze | Systems Analyst | 참고 분해 → 스펙·자산 |
| Approve | 사용자 | 스펙 승인 |
| Implement | Implementer | 수직 슬라이스 + 런타임 검증 |
| Verify | Fidelity QA | 참고·스펙 대비 충실도 |

자세한 루프는 [From reference](playbooks/from-reference.md)를 보세요.

## 이 문서와 레포의 관계

| 용도 | 위치 |
|------|------|
| 사람용 학습서·가이드 (이 사이트) | `docs/site/` |
| Cursor 에이전트가 읽는 프로토콜 | `AGENTS.md`, `roles/`, `workflows/` |
| 소비 프로젝트 설치 | `consumer/`, `scripts/` |

에이전트용 파일은 “당신은 Producer입니다…” 형태의 **런타임 지시문**입니다. 이 사이트는 같은 내용을 **서술형**으로 풀어 둡니다.

{% hint style="info" %}
GitBook에 올리는 소스는 `docs/site/`만입니다. `roles/` 원문을 그대로 sync하지 않습니다.
{% endhint %}
