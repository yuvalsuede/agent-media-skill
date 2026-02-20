# agent-media Lobster Workflows

Typed workflow pipelines for [OpenClaw](https://openclaw.ai)'s Lobster runtime. These workflows provide guided, multi-step media generation with approval gates.

## Workflows

### `generate.lobster` — Guided Single Generation

Step-by-step generation flow:
1. Check credit balance
2. List available models
3. **Approval gate** — confirm model, prompt, and duration before spending credits
4. Generate media
5. Poll for completion
6. Download result

```json
{
  "action": "run",
  "pipeline": "workflows/generate.lobster",
  "argsJson": "{\"prompt\":\"a robot walking through a neon city\",\"model\":\"kling3\",\"duration\":\"5\"}"
}
```

### `batch-generate.lobster` — Batch Generation

Submit multiple prompts in one go:
1. Check credit balance
2. **Approval gate** — preview the full batch before spending credits
3. Submit all jobs in parallel
4. List completed results

```json
{
  "action": "run",
  "pipeline": "workflows/batch-generate.lobster",
  "argsJson": "{\"prompts\":[\"sunset over mountains\",\"robot in a garden\",\"underwater city\"],\"model\":\"veo3\",\"duration\":\"8\"}"
}
```

## Setup

Enable Lobster in your OpenClaw config:

```json
{
  "tools": {
    "alsoAllow": ["lobster"]
  }
}
```

Then trigger via the Lobster tool or from any connected chat platform.

## Why Approval Gates

Approval gates pause the workflow before any credit-spending action. This keeps side effects explicit — no accidental charges from a misunderstood prompt.
