# agent-media-skill

Claude Code skill for AI video and image generation via the [agent-media](https://agent-media.ai) CLI.

## What it does

This skill gives Claude Code the ability to generate AI videos and images on your behalf using the `agent-media` CLI. It supports 7 models across video and image generation:

| Model | Slug | Type |
|-------|------|------|
| Kling 3.0 Pro | `kling3` | Video |
| Veo 3.1 | `veo3` | Video |
| Sora 2 Pro | `sora2` | Video |
| Seedance 1.0 Pro | `seedance1` | Video |
| Flux 2 Pro | `flux2-pro` | Image |
| Flux 2 Flex | `flux2-flex` | Image |
| Grok Imagine | `grok-image` | Image |

## Install

### 1. Install the CLI

```bash
npm install -g agent-media-cli
```

### 2. Log in

```bash
agent-media login
```

### 3. Add the skill to Claude Code

Copy `SKILL.md` into your project's `.claude/skills/` directory, or reference this repo directly.

## MCP Server

agent-media also ships as an MCP server for direct tool integration with Claude Code and other MCP-compatible clients.

```bash
npx agent-media-mcp
```

Add to your Claude Code config (`.claude/settings.json` or `~/.claude/settings.json`):

```json
{
  "mcpServers": {
    "agent-media": {
      "command": "npx",
      "args": ["agent-media-mcp"]
    }
  }
}
```

The MCP server exposes 9 tools: `generate`, `models`, `credits`, `status`, `list_jobs`, `download`, `pricing`, `cancel`, and `whoami`.

## Usage

Once installed, ask Claude Code things like:

- "Generate a video of a robot walking through a forest"
- "Create an image of a cyberpunk cityscape at sunset"
- "Show me what models are available and their pricing"
- "Check my credit balance"
- "Generate 3 variations of a sunset timelapse"

## Links

- [agent-media.ai](https://agent-media.ai) — Dashboard & account
- [Documentation](https://agent-media.ai/docs)
- [agent-media-cli on npm](https://www.npmjs.com/package/agent-media-cli)
- [agent-media-mcp on npm](https://www.npmjs.com/package/agent-media-mcp)

## License

Apache-2.0
