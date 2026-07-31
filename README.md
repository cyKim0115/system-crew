# system-crew

참고 설명·영상·콘텐츠를 바탕으로 **비슷한 게임 시스템을 설계·구현·검증**하는 Cursor용 4역할 에이전트 팩입니다.

다른 게임 프로젝트에 **git submodule**로 넣은 뒤, sync 스크립트로 Cursor rules를 배포합니다. 원본(`system-crew`)을 업데이트하면 소비 프로젝트에서 pull + sync로 반영합니다.

## 4역할

| 역할 | 파일 | 책임 |
|------|------|------|
| Producer | `roles/01-producer.md` | 요청 접수, 범위·유사도 목표 확정, 단계 라우팅 |
| Systems Analyst | `roles/02-systems-analyst.md` | 참고 자료 분해 → 시스템 스펙 |
| Implementer | `roles/03-implementer.md` | 스펙을 엔진/코드로 구현 |
| Fidelity QA | `roles/04-fidelity-qa.md` | 참고 대비 충실도·누락 검증 |

## 기본 루프

`workflows/from-reference.md` 참고:

1. 사용자가 시스템 설명 또는 참고(영상/게임/링크) 제시  
2. **Producer**가 범위·유사도·콜아웃·자산화 의도 확인  
3. **Systems Analyst**가 `docs/references/`에 자산 저장 + brief/spec 작성  
4. 사용자 승인  
5. **Implementer**가 수직 슬라이스 구현  
6. **Fidelity QA**가 검수하고 자산 상태 갱신  

참고 자산화 상세: `workflows/reference-assets.md`  
아이디어 평가: `workflows/idea-evaluation.md` (실현 가능성·방향성·효율 → 수용/수정/보류/거절)

프로토콜 밖 요청(에이전트 스킬 문서화, 참고 없는 일상 수정 등)은 Producer가 4역할 루프를 돌리지 않고 재라우팅한다. Implementer는 컴파일만으로 완료하지 않고 런타임 검증을 남긴다. 검증용 일시 치트·스킵은 검증 후 폐기하고, 타이틀·인트로 등 진입 장벽은 playtest 도달 방법에 적는다.

## 소비 프로젝트에 설치 (submodule)

프로젝트 루트에서:

```powershell
# 권장: GitHub에 system-crew를 올린 뒤
git submodule add git@github.com:<you>/system-crew.git .cursor/system-crew

# 로컬 절대 경로 (이 PC 전용; file 프로토콜 허용 필요)
git -c protocol.file.allow=always submodule add --force C:/Users/cykim/repo/system-crew .cursor/system-crew

# 또는 설치 스크립트 (상시)
powershell -File ..\system-crew\scripts\install-as-submodule.ps1
# 호출형만
powershell -File ..\system-crew\scripts\install-as-submodule.ps1 -Mode OnDemand

git submodule update --init --recursive
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1
# OnDemand면: -Mode OnDemand
```

> 참고: 이미 원격이 있는 저장소에서 `../system-crew`만 쓰면 호스트의 동일 이름 원격 URL로 해석될 수 있습니다. 원격이 없으면 로컬 절대 경로 또는 GitHub URL을 쓰세요.

자세한 내용: `consumer/INTEGRATION.md`

## 원본 업데이트 반영

소비 프로젝트에서:

```powershell
git submodule update --remote .cursor/system-crew
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1
# OnDemand 프로젝트는 -Mode OnDemand 유지
```

프로젝트 전용 커스텀은 `.cursor/rules/local/`에 두고, sync가 덮어쓰지 않게 합니다.

## 이 레포에서 Cursor로 편집할 때

원본을 직접 열면 `cursor/rules/`가 소스입니다. 소비 프로젝트에서는 sync된 `.cursor/rules/system-crew-*.mdc`를 사용합니다.
