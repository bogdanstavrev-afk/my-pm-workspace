# Slack chase automations

Config + runner for conditional EOD thread replies via **tide-slack** MCP.

## credit-flex-update-2026-06-03

- **Channel:** `#credit-flex-cards`
- **Thread:** [progress update](https://tide.enterprise.slack.com/archives/C0AMNU3DQ7M/p1780404796966589)
- **Send at:** 18:00 `Europe/Athens` on 3 Jun 2026
- **Condition:** Post chase only if listed stakeholders have not replied in the thread after the parent message.

Cancel: kill the background shell running `run-eod-chase.sh credit-flex-update-2026-06-03`.
