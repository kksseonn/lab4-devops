#!/usr/bin/env bash
set -euo pipefail

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:8000/ || true)

if [ "$STATUS_CODE" = "200" ]; then
    echo "OK: service is available, HTTP $STATUS_CODE"
    exit 0
else
    echo "FAIL: service is unavailable, HTTP $STATUS_CODE"
    exit 1
fi
