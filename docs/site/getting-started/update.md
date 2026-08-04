---
description: 원본 system-crew 업데이트를 소비 프로젝트에 반영하는 방법.
icon: arrows-rotate
---

# Update from upstream

소비 프로젝트에서:

```powershell
git submodule update --remote .cursor/system-crew
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1
# OnDemand 프로젝트는 -Mode OnDemand 유지
```

{% hint style="info" %}
프로젝트 전용 커스텀은 `.cursor/rules/local/`에 둡니다. sync가 덮어쓰지 않습니다. → [Local overrides](../integration/local-overrides.md)
{% endhint %}

원본 레포를 직접 Cursor로 열어 편집할 때는 `cursor/rules/`가 소스입니다. 소비 프로젝트에서는 sync된 `.cursor/rules/system-crew-*.mdc`를 사용합니다.
