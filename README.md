# agent-media-skill

Claude Code skill for AI-powered UGC video generation via the [agent-media](https://agent-media.ai) CLI.

## What it does

This skill gives Claude Code the ability to generate UGC (User-Generated Content) videos on your behalf. Write a script, pick an AI actor, and get a professional talking head video with lip-sync, subtitles, and music.

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

## Usage

Once installed, ask Claude Code things like:

- "Create a UGC video about our new product launch"
- "Generate a testimonial video with actor Adaeze"
- "Make a 30-second problem-solution video about productivity"
- "Show me available actors"
- "Check my credit balance"

## Links

- [agent-media.ai](https://agent-media.ai) — Dashboard & account
- [Documentation](https://agent-media.ai/docs)
- [agent-media-cli on npm](https://www.npmjs.com/package/agent-media-cli)

## License

Apache-2.0
