# esp — agent guide

Stephen's ESP32 work on Espressif's **ESP-IDF** (C, not Arduino and not MicroPython; see `esptool`
for flashing MicroPython). Personal hub project (`~/local/personal/projects/esp`); remote `origin` is
GitHub `shepner/esp` (`master`). The core rules in `~/local/personal/AGENTS.md` and `core/` apply.

## Layout

| Path | What |
| --- | --- |
| `install_tools.sh`, `update_shell.sh` | Install ESP-IDF v4.0 into `~/src/esp` (assumes that path; Python 2 era) and export its environment. Dated: v4.0 is from 2020. Check Espressif's current install guide before reusing. |
| `hello_world/` | ESP-IDF hello-world copy |
| `garage_thermostat/` | DS18B20 temperature read on GPIO 14 (a 25-line `main.c` stub). `install_ds18b20.sh` clones `feelfreelinux/ds18b20` into `components/ds18b20`. |

## Working here

- **Ignored on purpose:** `esp-idf*` (the toolchain checkout, ~700 MB, with 17 nested upstream repos),
  `xtensa-esp32-elf*`, `build/`. They are upstream clones, re-created by `install_tools.sh`; our
  work is never in them.
- `garage_thermostat/components/ds18b20` is an upstream clone tracked as a gitlink. Our local
  edit there (a commented-out `include ... component_common.mk` line and an `include/`
  symlink made by `install_ds18b20.sh`) is uncommitted in that nested repo; record any further
  change as a patch or fork rather than assuming this repo holds it.
- Do not run `update_git.sh`: it does `git add .` and an unreviewed 'automatic update' commit,
  which violates commit-by-path (non-negotiable 7).
- Pushing to GitHub needs the operator's go-ahead.
