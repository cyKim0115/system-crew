---
description: 소비 프로젝트에 submodule·rules·skill이 어떻게 배치되는지.
icon: folder-tree
---

# Consumer layout

```text
your-game/
  .cursor/
    system-crew/          ← submodule
    skills/system-crew/   ← OnDemand only
    rules/
      system-crew*.mdc
      role-*.mdc
      local/              ← YOUR overrides (never overwritten)
    SYSTEM-CREW.md        ← OnDemand usage note
```

공유 팩은 **system-crew** 레포에 두고, 게임 레포는 submodule + sync로 가져옵니다.  
자세한 설치: [Install](../getting-started/install.md)
