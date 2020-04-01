# `trombik.freebsd_kld`

A thin wrapper of `kld` `ansible` module.

`kld` is not yet part of `ansible`. Until then, this role includes
[dlundgren/ansible-freebsd-modules](https://github.com/dlundgren/ansible-freebsd-modules)
as a `git` `submodule`.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `freebsd_kld` | a list of kernel modules to load (see below) | `[]` |

## `freebsd_kld`

This variable is a list of dict.

| Key | Description | Mandatory? |
|-----|-------------|------------|
| `name` | Name of the kernel module. `.ko` is typically not needed | yes |
| `load` | Load or unload the module. The default is `yes` | no |
| `boot` | Apply the kernel module at boot. The default is `yes` | no |

# Dependencies

None

# Example Playbook

```yaml
---
- hosts: localhost
  roles:
    - ansible-role-freebsd_kld
  vars:
    freebsd_kld:
      - name: u3g
      - name: ichsmb
        load: yes
        boot: yes
```

# License

```
Copyright (c) 2014 David Lundgren
Copyright (c) 2020 Tomoyuki Sakurai <y@trombik.org>

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
