"""Public REST API client for Q3 / CO3 using the Python standard library."""

from __future__ import annotations

import argparse
from collections import Counter
import json
from pathlib import Path
import sys
from typing import Any, Dict, List
import urllib.error
import urllib.request

DEFAULT_API_URL = "https://jsonplaceholder.typicode.com/users"
DEFAULT_OUTPUT_PATH = Path(__file__).resolve().parent / "api_response.json"
REQUEST_TIMEOUT_SECONDS = 15


def fetch_json(url: str, timeout: int = REQUEST_TIMEOUT_SECONDS) -> tuple[int, Any]:
    """Send an HTTP GET request, validate status code, and parse JSON."""
    request = urllib.request.Request(
        url,
        method="GET",
        headers={
            "Accept": "application/json",
            "User-Agent": "DeveloperPortfolio-APIClient/1.0 (Python-urllib)",
        },
    )

    try:
        with urllib.request.urlopen(request, timeout=timeout) as response:
            status_code = response.status
            if status_code != 200:
                raise RuntimeError(f"Unexpected HTTP status code: {status_code}")

            raw_body = response.read().decode("utf-8")
            parsed = json.loads(raw_body)
            return status_code, parsed
    except urllib.error.HTTPError as exc:
        raise RuntimeError(
            f"HTTP error {exc.code} ({exc.reason}) while requesting {url}"
        ) from exc
    except urllib.error.URLError as exc:
        raise ConnectionError(
            f"Network/connection error while requesting {url}: {exc.reason}"
        ) from exc
    except TimeoutError as exc:
        raise ConnectionError(f"Request to {url} timed out after {timeout}s") from exc
    except json.JSONDecodeError as exc:
        raise ValueError(f"Response from {url} is not valid JSON: {exc}") from exc


def save_json(data: Any, output_path: Path) -> Path:
    """Save parsed JSON payload to disk with clean indentation."""
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
    return output_path


def process_users(users: List[Dict[str, Any]]) -> Dict[str, Any]:
    """Perform basic data processing on the user records."""
    cities: Counter[str] = Counter()
    email_tlds: Counter[str] = Counter()
    companies: List[str] = []

    for user in users:
        city = user.get("address", {}).get("city", "Unknown")
        cities[city] += 1

        email = user.get("email", "")
        if "." in email:
            tld = "." + email.rsplit(".", 1)[-1].lower()
            email_tlds[tld] += 1

        company_name = user.get("company", {}).get("name")
        if company_name:
            companies.append(company_name)

    return {
        "total_users": len(users),
        "unique_cities": len(cities),
        "cities": dict(sorted(cities.items())),
        "email_tlds": dict(email_tlds.most_common()),
        "companies": sorted(companies),
    }


def display_report(
    url: str, status_code: int, users: List[Dict[str, Any]], summary: Dict[str, Any]
) -> None:
    """Print parsed user details and processed summary metrics."""
    print(f"Endpoint       : {url}")
    print(f"HTTP Status    : {status_code} OK")
    print(f"Records Loaded : {summary['total_users']}")
    print("")
    print(f"{'ID':<4} {'Name':<24} {'Username':<16} {'City':<18} {'Company'}")
    print("-" * 86)

    for user in users:
        uid = str(user.get("id", "-"))
        name = str(user.get("name", "-"))[:23]
        username = str(user.get("username", "-"))[:15]
        city = str(user.get("address", {}).get("city", "-"))[:17]
        company = str(user.get("company", {}).get("name", "-"))
        print(f"{uid:<4} {name:<24} {username:<16} {city:<18} {company}")

    print("")
    print("=== Basic Data Processing Summary ===")
    print(f"Total Users   : {summary['total_users']}")
    print(f"Unique Cities : {summary['unique_cities']}")
    print(f"Email TLDs    : {summary['email_tlds']}")
    print(f"Companies     : {', '.join(summary['companies'])}")


def parse_args(argv: List[str] | None = None) -> argparse.Namespace:
    """Parse optional CLI flags for endpoint URL and output JSON file."""
    parser = argparse.ArgumentParser(
        description="Fetch and process public user JSON data via HTTP GET."
    )
    parser.add_argument(
        "--url",
        default=DEFAULT_API_URL,
        help=f"API endpoint URL (default: {DEFAULT_API_URL})",
    )
    parser.add_argument(
        "--output",
        default=str(DEFAULT_OUTPUT_PATH),
        help=f"Output JSON file path (default: {DEFAULT_OUTPUT_PATH})",
    )
    return parser.parse_args(argv)


def main(argv: List[str] | None = None) -> int:
    """Program entry point."""
    args = parse_args(argv)
    output_path = Path(args.output)

    try:
        status_code, payload = fetch_json(args.url)
    except (RuntimeError, ConnectionError, ValueError) as exc:
        print(f"API Request Failed: {exc}", file=sys.stderr)
        return 1

    if not isinstance(payload, list):
        print(
            "Error: Expected a JSON array of user objects from the API.",
            file=sys.stderr,
        )
        return 1

    saved_file = save_json(payload, output_path)
    summary = process_users(payload)
    display_report(args.url, status_code, payload, summary)
    print(f"\nSaved JSON response to: {saved_file}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
