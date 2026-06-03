#!/usr/bin/env bash
# Sleep until EOD in config timezone, then wake the agent to post conditional Slack chases.
set -euo pipefail

CONFIG_NAME="${1:?Usage: run-eod-chase.sh <config-basename-without-json>}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG="$SCRIPT_DIR/${CONFIG_NAME}.json"

if [[ ! -f "$CONFIG" ]]; then
  echo "Missing config: $CONFIG" >&2
  exit 1
fi

export CONFIG CONFIG_NAME

python3 << 'PY'
import json, os, time
from datetime import datetime
from pathlib import Path
from zoneinfo import ZoneInfo

cfg = json.loads(Path(os.environ["CONFIG"]).read_text())
z = ZoneInfo(cfg.get("eod_timezone", "Europe/Athens"))
now = datetime.now(z)
target = now.replace(
    hour=cfg.get("eod_hour", 18),
    minute=cfg.get("eod_minute", 0),
    second=0,
    microsecond=0,
)
wait = max(0, (target - now).total_seconds())
print(f"Chase scheduled: {target.strftime('%Y-%m-%d %H:%M %Z')} (sleep {int(wait)}s)", flush=True)
time.sleep(wait)
PY

python3 << 'PY'
import json, os
from pathlib import Path

cfg = json.loads(Path(os.environ["CONFIG"]).read_text())
name = os.environ["CONFIG_NAME"]
payload = {
    "action": "slack_eod_chase",
    "config": os.environ["CONFIG"],
    "channel_id": cfg["channel_id"],
    "thread_ts": cfg["thread_ts"],
    "parent_user_id": cfg["parent_user_id"],
    "stakeholder_ids": [s["user_id"] for s in cfg["stakeholders"]],
    "eng_pair": ["U03V676G9H6", "U055MFPDGJF"],
    "chase_message": cfg["chase_message"],
    "prompt": (
        f"EOD Slack chase ({name}). Read {os.environ['CONFIG']}. "
        "1) slack_get_thread_replies(channel_id, thread_ts). "
        "2) Treat a stakeholder as answered if any thread reply (ts > parent) is FROM that user_id. "
        "   For eng: satisfied if EITHER U03V676G9H6 OR U055MFPDGJF replied. "
        "3) If everyone answered: do NOT post; tell user chase skipped. "
        "4) If anyone missing: build chase from chase_message but REMOVE bullet lines for people who already replied; "
        "   if only eng partially answered, only ping the missing eng. "
        "5) slack_reply_to_thread with final text. Summarize sent vs skipped."
    ),
}
print("AGENT_LOOP_WAKE_SLACK_CHASE_CF " + json.dumps(payload))
PY
