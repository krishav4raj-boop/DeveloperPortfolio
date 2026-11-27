# Q3 — REST API Integration in Python (CO3)

This module demonstrates consuming a public REST API using Python's built-in standard library (`urllib.request`, `urllib.error`, and `json`) with proper status-code verification, error handling, JSON persistence, and data processing.

---

## API Overview

| Attribute | Details |
| :--- | :--- |
| **API Endpoint** | `https://jsonplaceholder.typicode.com/users` |
| **Authentication** | None required (free public test API) |
| **HTTP Method** | `GET` |
| **Request Headers** | `Accept: application/json`, custom `User-Agent` |
| **Expected Status Code** | `200 OK` |
| **Saved Response File** | [api_response.json](api_response.json) |

---

## Request & Response Flow

1. **HTTP GET Request:** `fetch_json()` builds a `urllib.request.Request` with `method="GET"` and a `15`-second timeout.
2. **Status-Code Handling:** Checks `response.status == 200`. Any non-200 HTTP status raises `urllib.error.HTTPError` or `RuntimeError` and exits with code `1`.
3. **Exception Handling:** Catches:
   - `urllib.error.HTTPError` (4xx/5xx server responses, e.g., `404 Not Found`)
   - `urllib.error.URLError` (DNS failure, offline machine, refused connection)
   - `TimeoutError` (slow/unresponsive host)
   - `json.JSONDecodeError` (malformed response body)
4. **JSON Parsing & Persistence:** Decodes UTF-8 response text via `json.loads()` and writes formatted JSON to [api_response.json](api_response.json).
5. **Basic Data Processing:** `process_users()` counts total users, unique cities, top-level email domains (`.biz`, `.net`, `.org`, etc.), and prints a sorted list of company names.

---

## Expected JSON Structure

Each item in the returned JSON array follows this structure:

```json
{
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "city": "Gwenborough",
    "zipcode": "92998-3874"
  },
  "company": {
    "name": "Romaguera-Crona"
  }
}
```

---

## How to Run

From `API/Q3/CO3/`:

```bash
# Normal execution (fetches live JSON and updates api_response.json)
python api_client.py

# Test error handling with an invalid endpoint (should print error and exit 1)
python api_client.py --url https://jsonplaceholder.typicode.com/nonexistent_endpoint
```

---

## Evidence Status

- Run `python api_client.py` and verify the terminal output and saved [api_response.json](api_response.json).
- Capture screenshots of the script execution, JSON output, and error-handling test in `Screenshots/API/`.
