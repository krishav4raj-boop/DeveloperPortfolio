# System Profile (Q1 / CO1)

> **Important Notice:** This file is a **command-based template**. No hardware or OS values have been fabricated. Before final submission, run the commands below on your Linux system (Ubuntu, Fedora, WSL, or university lab machine) and replace each `[PASTE OUTPUT HERE]` placeholder with your genuine terminal output.

Alternatively, you can run `./commands.sh` inside `Linux/Q1/CO1/` to inspect most of these values at once.

---

## Machine & Environment Profile

| Field | Command to Run | Recorded Output |
| :--- | :--- | :--- |
| **Operating System** | `cat /etc/os-release` (or `lsb_release -a`) | `[PASTE OUTPUT HERE]` |
| **Kernel Information** | `uname -a` | `[PASTE OUTPUT HERE]` |
| **CPU Information** | `lscpu \| grep -E "Model name\|CPU\(s\):"` | `[PASTE OUTPUT HERE]` |
| **Memory Information** | `free -h` | `[PASTE OUTPUT HERE]` |
| **Disk Information** | `df -h` | `[PASTE OUTPUT HERE]` |
| **Current User** | `whoami` | `[PASTE OUTPUT HERE]` |
| **Current Directory** | `pwd` | `[PASTE OUTPUT HERE]` |
| **Date & Time** | `date` | `[PASTE OUTPUT HERE]` |

---

## Step-by-Step Commands to Capture Evidence

Run these commands in your Linux terminal and save screenshots to `Screenshots/Linux/`:

```bash
# 1. User, directory, and timestamp
whoami
pwd
date

# 2. OS and kernel details
uname -a
cat /etc/os-release

# 3. CPU, memory, and disk resources
lscpu
free -h
df -h
```

---

## Verification Checklist

- [ ] Replaced all `[PASTE OUTPUT HERE]` placeholders with genuine outputs from my Linux terminal.
- [ ] Captured matching terminal screenshots and saved them in `Screenshots/Linux/`.
