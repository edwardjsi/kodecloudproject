#!/bin/bash

# Fixed Script: Requires GITHUB_TOKEN
set -euo pipefail

REPO_URL="${1:-}"

if [[ -z "$REPO_URL" ]]; then
    echo "Usage: $0 <github-repo-url>"
    exit 1
fi

if [[ -z "${GITHUB_TOKEN:-}" ]]; then
    echo "Error: Export GITHUB_TOKEN first!"
    echo "Generate PAT at https://github.com/settings/tokens (classic, scope: repo or public_repo)"
    exit 1
fi

if [[ "$REPO_URL" =~ ^https://github.com/([^/]+)/([^/]+) ]]; then
    OWNER="${BASH_REMATCH[1]}"
    REPO="${BASH_REMATCH[2]%.git}"
else
    echo "Error: Invalid GitHub URL"
    exit 1
fi

API_URL="https://api.github.com/repos/${OWNER}/${REPO}/collaborators"

echo "Fetching collaborators for ${OWNER}/${REPO}..."
echo "User                  | Admin | Pull  | Push  | Maintain"
echo "-------------------------------------------------------------"

page=1
per_page=100
found_any=false

while true; do
    response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        "${API_URL}?per_page=${per_page}&page=${page}")

    if echo "$response" | grep -q '"message"'; then
        error_msg=$(echo "$response" | jq -r '.message')
        echo "API Error: $error_msg"
        if [[ "$error_msg" == "Not Found" ]]; then
            echo "Hint: Repo doesn't exist or wrong URL."
        elif [[ "$error_msg" == "Requires authentication" ]]; then
            echo "Hint: Token invalid or missing repo scope."
        fi
        exit 1
    fi

    users=$(echo "$response" | jq -r '.[] | select(.permissions.pull == true) | "\(.login)\t\(.permissions.admin // "false")\t\(.permissions.pull // "false")\t\(.permissions.push // "false")\t\(.permissions.maintain // "false")"')

    if [[ -n "$users" ]]; then
        found_any=true
        echo "$users" | awk '{printf "%-20s | %-5s | %-5s | %-5s | %-8s\n", $1, $2, $3, $4, $5}'
    fi

    if [[ $(echo "$response" | jq '. | length') -lt $per_page ]]; then
        break
    fi
    ((page++))
done

if ! $found_any; then
    echo "(No collaborators with pull access found – often just the owner)"
fi

echo "Done."
