# Consuming system-crew from another project

## Goal

- Keep the shared 4-role pack in the **system-crew** repo
- Use it from game repos (e.g. narak) via **git submodule**
- When system-crew changes, consumer runs update + sync

## Layout in consumer

```
your-game/
  .cursor/
    system-crew/          ← submodule
    rules/
      system-crew.mdc     ← copied by sync
      role-*.mdc          ← copied by sync
      local/              ← YOUR overrides (never overwritten by sync)
  AGENTS.md               ← includes system-crew section
```

## Install

From the game repo root:

```powershell
powershell -File ..\system-crew\scripts\install-as-submodule.ps1
# or with remote:
# powershell -File ..\system-crew\scripts\install-as-submodule.ps1 -CrewUrl git@github.com:<you>/system-crew.git
```

## Update from upstream

```powershell
git submodule update --remote .cursor/system-crew
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1
```

Pin a version (optional):

```powershell
cd .cursor/system-crew
git checkout v0.1.0
cd ../..
powershell -File .cursor/system-crew/scripts/sync-to-project.ps1
```

## Local overrides

Put project-only Cursor rules in `.cursor/rules/local/`.  
Do not edit synced `system-crew*.mdc` / `role-*.mdc` in the consumer — edit the **system-crew** repo and sync again.

## Remote recommendation

Push `system-crew` to GitHub and point `.gitmodules` at that URL so clones of the game repo can fetch the submodule.
