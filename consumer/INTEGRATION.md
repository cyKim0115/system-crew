# Consuming system-crew from another project

## Goal

- Keep the shared 4-role pack in the **system-crew** repo
- Use it from game repos via **git submodule**
- When system-crew changes, consumer runs update + sync

## Modes

| Mode | When | Behavior |
|------|------|----------|
| `Always` (default) | Crew is the default workflow | Rules keep upstream `alwaysApply` |
| `OnDemand` | Use only when explicitly called | All synced rules forced `alwaysApply: false` + invoke Skill |

## Layout in consumer

```
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

## Install

```powershell
# Always-on
powershell -File ..\system-crew\scripts\install-as-submodule.ps1

# Call-to-use
powershell -File ..\system-crew\scripts\install-as-submodule.ps1 -Mode OnDemand
```

## Update from upstream

```powershell
git submodule update --remote .cursor/system-crew
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1 -Mode Always
# or
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1 -Mode OnDemand
```

Keep the same `-Mode` the project chose. Mode is also stored in `.cursor/rules/.system-crew-mode`.

## OnDemand invocation

Say one of: `system-crew`, `시스템 크루`, `Producer로`, `참고 재현`, `아이디어 평가해줘`  
Or enable the `system-crew` Cursor skill.

OnDemand sync writes `.cursor/SYSTEM-CREW.md` from `consumer/SYSTEM-CREW.on-demand.md` (UTF-8 template — Korean is not embedded in the `.ps1` source, to avoid Windows PowerShell encoding corruption).

## Local overrides

Put project-only Cursor rules in `.cursor/rules/local/`.  
Do not edit synced pack files in the consumer — edit **system-crew** and sync again.

## Remote recommendation

Push `system-crew` to a git host and point `.gitmodules` at that URL so clones can fetch the submodule.
