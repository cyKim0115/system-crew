---
description: 프로젝트 전용 Cursor rules는 local/에 두고 sync가 덮어쓰지 않게 합니다.
icon: pen-to-square
---

# Local overrides

프로젝트 전용 Cursor rules는 `.cursor/rules/local/`에 둡니다.

- sync가 **덮어쓰지 않음**
- 소비 프로젝트에서 sync된 pack 파일을 직접 편집하지 말 것
- pack을 고치려면 **system-crew** 원본을 수정한 뒤 sync

모드·경로 오버라이드도 local 규칙을 우선하는 편이 안전합니다.
