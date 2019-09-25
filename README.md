# `trombik.acpid`

`ansible` role for `acpid`

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `acpid_service` | Service name of `acpid` | `acpid` |
| `acpid_package` | Package name of `acpid` | `acpid` |
| `acpid_extra_packages` | A list of extra packages to install | `[]` |
| `acpid_conf_dir` | Path to configuration directory | `{{ __acpid_conf_dir }}` |
| `acpid_events_dir` | Path to event configuration file directory | `{{ acpid_conf_dir }}/events` |
| `acpid_flags` | Default options to pass `acpid` | `""` |
| `acpid_events` | See below | `[]` |

## `acpid_events`

This variable is a list of dict.

| Key | Description | Mandatory? |
|-----|-------------|------------|
| `state` | Either `present` or `absent` | No |
| `content` | Content of the file | No |
| `name` | File name | Yes |

## Debian

| Variable | Default |
|----------|---------|
| `__acpid_conf_dir` | `/etc/acpi` |

# Dependencies

None

# Example Playbook

```yaml
---
- hosts: localhost
  roles:
    - ansible-role-acpid
  vars:
    acpid_flags: |
      OPTIONS=""
    acpid_events:
      - name: foo
        state: present
        content: |
          event=foo/bar
          action=/bin/echo foo
```

# License

```
Copyright (c) 2019 Tomoyuki Sakurai <y@trombik.org>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <y@trombik.org>

This README was created by [qansible](https://github.com/trombik/qansible)
