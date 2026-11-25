#!/usr/bin/env bash
url="$1"
timeout="${SMOKE_TIMEOUT:-30}"
end=$((SECONDS + timeout))

while [ "$SECONDS" -lt "$end" ]; do
  if curl -fsS --max-time 10 "$url/ready" > /dev/null 2>&1; then
    if curl -fsS --max-time 10 "$url/add?a=2&b=3" | grep -q '"result":5'; then
      echo "Smoke test OK on $url"
      exit 0
    fi
  fi
  sleep 5
done

echo "Smoke test failed for $url" >&2
exit 1
