# DeveloperPortfolio

A structured, beginner-friendly developer ecosystem capstone portfolio demonstrating core Linux administration, Bash shell automation, Python REST API integration, Git/GitHub workflows, technical Markdown documentation, and career readiness artifacts aligned with the ZoSIMA evaluation rubric.

---

## About This Portfolio

This repository serves as an end-to-end semester capstone showcasing foundational software engineering and DevOps habits. Every folder maps directly to a capstone question and course outcome (`Q1/CO1` through `Q4/CO4`), designed so an academic evaluator can inspect the code, run the scripts, verify genuine outputs, and review career portfolio materials cleanly.

---

## Repository Structure

```text
DeveloperPortfolio/
│
├── Linux/
│   └── Q1/
│       └── CO1/
│           ├── README.md
│           ├── linux_commands.md
│           ├── system_profile.md
│           └── commands.sh
│
├── ShellScripts/
│   └── Q2/
│       └── CO2/
│           ├── README.md
│           ├── system_info.sh
│           ├── backup.sh
│           ├── file_report.sh
│           ├── menu.sh
│           └── test_commands.md
│
├── API/
│   └── Q3/
│       └── CO3/
│           ├── README.md
│           ├── api_client.py
│           ├── api_response.json
│           └── requirements.txt
│
├── Portfolio/
│   └── Q4/
│       └── CO4/
│           ├── README.md
│           ├── resume.md
│           ├── resume.pdf
│           ├── learning_roadmap.md
│           ├── linkedin_setup.md
│           └── linkedin_evidence_checklist.md
│
├── Screenshots/
│   ├── README.md
│   ├── Linux/
│   ├── ShellScripts/
│   ├── API/
│   ├── Portfolio/
│   └── GitHub/
│
├── .gitignore
├── README.md
├── PERSONALIZATION_REQUIRED.md
├── PROJECT_STATUS.md
└── SUBMISSION_CHECKLIST.md
```

---

## Skills Demonstrated

- **Linux:** Filesystem navigation, permissions, process inspection, disk analysis, and text search
- **Bash:** Modular functions, variables, conditionals, loops, input validation, and exit-code handling
- **Python:** Standard-library HTTP requests, JSON parsing, exception handling, and CLI design
- **APIs & JSON:** Consuming public REST endpoints (`GET`), status verification, and structured data persistence
- **Git & GitHub:** Version control initialization, `.gitignore`, clean commits, and public repository hosting
- **Markdown & Documentation:** Clear technical guides, tables, checklists, and architecture documentation
- **Debugging & Testing:** Reproducible test cases, negative/error-path checks, and syntax validation
- **Professional Development:** ATS-friendly resume authoring, structured multi-stage learning roadmap, and LinkedIn alignment

---

## Q1 — Linux / CO1

Demonstrates core Linux command-line fluency and non-destructive system inspection:
- Comprehensive documentation of 23 essential Linux commands (syntax, realistic examples, expected results, and practical rationale)
- A command-based system profile template for recording real host metrics
- A safe, runnable diagnostic script (`commands.sh`)

Explore the module: [Linux/Q1/CO1/](Linux/Q1/CO1/README.md)

---

## Q2 — ShellScripts / CO2

Demonstrates practical Bash automation using functions, variables, loops, conditionals, input validation, and meaningful exit codes:
- `system_info.sh`: Hostname, user, OS/kernel, uptime, disk, and memory summary
- `backup.sh`: Validated, non-destructive timestamped directory backup utility
- `file_report.sh`: Regular file and subdirectory counter with largest-file reporting
- `menu.sh`: Interactive CLI menu unifying the utility scripts

Explore the module: [ShellScripts/Q2/CO2/](ShellScripts/Q2/CO2/README.md)

---

## Q3 — API / CO3

Demonstrates Python REST API integration without unnecessary external dependencies:
- `api_client.py`: Sends an HTTP `GET` request to `https://jsonplaceholder.typicode.com/users`, checks `200 OK`, handles HTTP/network/timeout/JSON errors, processes user city/domain/company summaries, and writes `api_response.json`
- Includes clear documentation of request flow, JSON schema, and error-path testing

Explore the module: [API/Q3/CO3/](API/Q3/CO3/README.md)

---

## Q4 — Portfolio / CO4

Demonstrates career readiness and long-term technical planning:
- ATS-friendly beginner developer resume in Markdown (`resume.md`) and PDF (`resume.pdf`)
- Structured 4-stage learning roadmap (`learning_roadmap.md`) from Foundation to Advanced
- Step-by-step LinkedIn profile optimization guide (`linkedin_setup.md`) and genuine screenshot checklist (`linkedin_evidence_checklist.md`)

Explore the module: [Portfolio/Q4/CO4/](Portfolio/Q4/CO4/README.md)

---

## Screenshots

Organized placeholder directory structure (`Linux/`, `ShellScripts/`, `API/`, `Portfolio/`, `GitHub/`) with an itemized checklist of real terminal, script, API, portfolio, and GitHub screenshots to capture without fabricating evidence.

See instructions: [Screenshots/README.md](Screenshots/README.md)

---

## How to Run

### Run Shell Scripts (`Q1` and `Q2`)

On Linux, macOS, WSL, or Git Bash:

```bash
# Q1 safe Linux diagnostics
cd Linux/Q1/CO1
chmod +x commands.sh
./commands.sh

# Q2 automation scripts
cd ../../../ShellScripts/Q2/CO2
chmod +x system_info.sh backup.sh file_report.sh menu.sh
./system_info.sh
./backup.sh ../../Linux/Q1/CO1 ./backups
./file_report.sh ../..
./menu.sh
```

### Run Python API Client (`Q3`)

```bash
cd API/Q3/CO3
python api_client.py
```

---

## Git Workflow

Commands used to initialize, commit, and publish this repository to GitHub:

```bash
git init
git status
git add .
git commit -m "Initial DeveloperPortfolio submission"
git branch -M main
git remote add origin <YOUR_GITHUB_REPOSITORY_URL>
git push -u origin main
```

---

## Learning Outcomes

- Navigating and inspecting Linux environments safely from the command line
- Writing defensive, maintainable Bash scripts with clear validation and exit codes
- Consuming, validating, persisting, and summarizing JSON data from REST APIs in Python
- Structuring clean, evaluator-ready technical documentation and version-controlled repositories
- Translating technical coursework into an ATS-ready resume, LinkedIn profile, and multi-stage career roadmap

---

## Future Improvements

- Add automated CI checks via GitHub Actions (`shellcheck` for Bash scripts and `pytest`/`unittest` for Python API client tests)
- Expand `api_client.py` with retry logic, CSV export, and unit tests using mocked HTTP responses
- Containerize the Python and Bash utilities with a lightweight `Dockerfile` for reproducible execution across environments
- Add automated Markdown link checking before every release
