---
description: 게임 프로젝트에 system-crew를 submodule로 설치하고 Cursor rules를 sync합니다.
icon: download
---

# Install

소비 프로젝트(게임 레포) 루트에서 submodule을 추가한 뒤 sync 스크립트로 Cursor rules를 배포합니다.

{% stepper %}
{% step %}
### submodule 추가

GitHub에 `system-crew`를 올린 뒤 (권장):

```powershell
git submodule add git@github.com:<you>/system-crew.git .cursor/system-crew
```

로컬 절대 경로만 쓸 때 (이 PC 전용; file 프로토콜 허용 필요):

```powershell
git -c protocol.file.allow=always submodule add --force C:/path/to/system-crew .cursor/system-crew
```

또는 설치 스크립트:

```powershell
# Always (기본)
powershell -File ..\system-crew\scripts\install-as-submodule.ps1

# OnDemand만
powershell -File ..\system-crew\scripts\install-as-submodule.ps1 -Mode OnDemand
```

{% endstep %}
{% step %}
### init + sync

```powershell
git submodule update --init --recursive
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1
# OnDemand면: -Mode OnDemand
```

{% endstep %}
{% step %}
### 모드 확인

| 모드 | 언제 |
|------|------|
| Always | 크루가 기본 워크플로 |
| OnDemand | 명시적으로 호출할 때만 |

모드는 [Always vs OnDemand](always-vs-ondemand.md)에서 고릅니다.
{% endstep %}
{% endstepper %}

{% hint style="warning" %}
이미 원격이 있는 저장소에서 `../system-crew`만 쓰면 호스트의 동일 이름 원격 URL로 해석될 수 있습니다. 원격이 없으면 **로컬 절대 경로** 또는 **GitHub URL**을 쓰세요.
{% endhint %}

다음: [첫 요청 예시](first-request.md) · [소비 프로젝트 레이아웃](../integration/consumer-layout.md)
