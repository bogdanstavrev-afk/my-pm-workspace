# Slack MCP setup — Cursor prompt

Use this **after** you have added the `tide-slack` block to `~/.cursor/mcp.json` (see the config shared by your teammate).

1. Open this repo (or any project) in **Cursor Agent** mode.
2. Copy everything inside the prompt block below into a new chat.
3. Run it once; approve shell commands when asked.

---

## Copy-paste prompt

```
I've already added the tide-slack MCP server to ~/.cursor/mcp.json using the Tide config (mcp-remote proxy → https://tide-slack-mcp-server-prod.tide-platform.workers.dev/sse). Finish Slack MCP setup for me end-to-end.

Do this in order:

1. **Verify prerequisites**
   - Check Node is installed (`node --version`). If missing, tell me how to install Node (Homebrew or official installer) and stop until I confirm.
   - Check `mcp-remote` is installed globally (`npm list -g mcp-remote` or confirm `mcp-remote/dist/proxy.js` exists under the global npm prefix).
   - If `mcp-remote` is missing, run: `npm install -g mcp-remote`

2. **Fix ~/.cursor/mcp.json paths for my machine**
   - Read `~/.cursor/mcp.json`.
   - Set `command` to my actual Node binary (`which node` or a stable path like `~/.local/bin/node` if I use one).
   - Set the proxy path in `args` to: `$(npm root -g)/mcp-remote/dist/proxy.js` (resolve to the real absolute path).
   - Keep server name `tide-slack`, URL `https://tide-slack-mcp-server-prod.tide-platform.workers.dev/sse`, and args `--transport` `http-first`.
   - Preserve any other MCP servers already in the file; only update tide-slack.
   - Show me a short diff summary of what you changed.

3. **Reload MCP in Cursor**
   - Tell me to open **Cursor → Settings → Tools & MCP**, ensure **tide-slack** is enabled, and restart Cursor if the server stays disconnected.
   - If you can trigger MCP auth from chat, run `mcp_auth` for tide-slack (or tell me exactly what to click if auth must be manual). I will complete any browser OAuth prompt.

4. **Smoke test**
   - Call `slack_list_channels` with `limit: 5`.
   - If that works, call `slack_search_channel_by_name` for a channel I name when you ask (or skip if I don't provide one).
   - Report: connected ✅ or failed ❌ with the exact error and one fix to try.

5. **Optional PM workspace check** (only if this workspace is `my-pm-workspace` or has `.cursor/agents/slack-secretary.md`)
   - Confirm `.cursor/skills/slack-secretary/SKILL.md` exists.
   - Give me one example prompt: `@slack-secretary brief #<channel> since yesterday, Format A`

**Constraints**
- Do not commit or push anything unless I ask.
- Do not post messages to Slack unless I explicitly ask in this chat.
- Do not put secrets in the repo; tokens stay in Cursor/OAuth only.
- Use plain language in your summary; no need to dump raw JSON unless something fails.

Start now by reading ~/.cursor/mcp.json and checking Node + mcp-remote.
```

---

## Reference: `mcp.json` template

If they still need the JSON block:

```json
{
  "mcpServers": {
    "tide-slack": {
      "command": "/path/to/node",
      "args": [
        "/path/to/mcp-remote/dist/proxy.js",
        "https://tide-slack-mcp-server-prod.tide-platform.workers.dev/sse",
        "--transport",
        "http-first"
      ],
      "env": {
        "PATH": "/Users/<you>/.local/bin:/usr/bin:/bin"
      }
    }
  }
}
```

Replace `/path/to/node` and the proxy path — the Cursor prompt above should fix these automatically.
