# Project Status — DeveloperPortfolio

This file tracks what has already been built and verified versus what requires your personal details, local captures, and GitHub publication.

---

## 1. Completed Items

- **Repository Structure:** Created `Linux/Q1/CO1/`, `ShellScripts/Q2/CO2/`, `API/Q3/CO3/`, `Portfolio/Q4/CO4/`, and `Screenshots/` (`Linux/`, `ShellScripts/`, `API/`, `Portfolio/`, `GitHub/`).
- **Root Documentation:** Created `README.md`, `.gitignore`, `PERSONALIZATION_REQUIRED.md`, `SUBMISSION_CHECKLIST.md`, and `PROJECT_STATUS.md`.
- **Q1 (Linux / CO1):** Created `README.md`, `linux_commands.md` (23 commands), `system_profile.md` (command-based template), and `commands.sh` (syntax-checked).
- **Q2 (ShellScripts / CO2):** Created `README.md`, `system_info.sh`, `backup.sh`, `file_report.sh`, `menu.sh`, and `test_commands.md` (all scripts syntax-checked and tested).
- **Q3 (API / CO3):** Created `README.md`, `api_client.py`, `requirements.txt`, and `api_response.json` (executed and verified valid JSON).
- **Q4 (Portfolio / CO4):** Created `README.md`, `resume.md`, `resume.pdf`, `learning_roadmap.md`, `linkedin_setup.md`, and `linkedin_evidence_checklist.md`.

---

## 2. Items Requiring Your Personal Input

See `PERSONALIZATION_REQUIRED.md` for the full field list:
- Replace all `[YOUR ...]` placeholders in `Portfolio/Q4/CO4/resume.md`, then regenerate/export `Portfolio/Q4/CO4/resume.pdf`.
- Update `Linux/Q1/CO1/system_profile.md` with real terminal output from your Linux/WSL machine.
- Update your personal LinkedIn account following `Portfolio/Q4/CO4/linkedin_setup.md`.

---

## 3. Commands You Need to Run

### Capture Q1 & Q2 Evidence (Linux / WSL / Git Bash)
```bash
cd Linux/Q1/CO1
chmod +x commands.sh
./commands.sh

cd ../../../ShellScripts/Q2/CO2
chmod +x system_info.sh backup.sh file_report.sh menu.sh
./system_info.sh
./backup.sh ../../Linux/Q1/CO1 ./backups
./file_report.sh ../..
./menu.sh
```

### Run Q3 API Client
```bash
cd API/Q3/CO3
python api_client.py
python api_client.py --url https://jsonplaceholder.typicode.com/invalid
```

### Publish to GitHub
```bash
git init
git status
git add .
git commit -m "Initial DeveloperPortfolio submission"
git branch -M main
gh repo create DeveloperPortfolio --public --source=. --remote=origin --push
```

---

## 4. Screenshots You Need to Capture

Follow `Screenshots/README.md` and `Portfolio/Q4/CO4/linkedin_evidence_checklist.md` to capture genuine screenshots into:
- `Screenshots/Linux/`
- `Screenshots/ShellScripts/`
- `Screenshots/API/`
- `Screenshots/Portfolio/`
- `Screenshots/GitHub/`

---

## 5. Final Submission Steps

1. Complete personalization and capture all genuine screenshots.
2. Add, commit, and push your updated screenshots and personalized files to `origin main`.
3. Verify every checklist box in `SUBMISSION_CHECKLIST.md`.
4. Submit your public repository URL: `https://github.com/<your-username>/DeveloperPortfolio`.
