#!/usr/bin/env bash
url="$1"

for i in $(seq 1 15); do
  if curl -fsS "$url/ready" > /dev/null 2>&1; then
    if curl -fsS "$url/add?a=2&b=3" | grep -q '"result":5'; then
      echo "Smoke test OK"
      exit 0
    fi
  fi
  sleep 2
done

echo "Smoke test failed for $url" >&2
exit 1
