name: agent-media-batch
args:
  prompts:
    default: "[]"
  model:
    default: "kling3"
  duration:
    default: "5"
steps:
  - id: check_credits
    command: agent-media credits --json

  - id: preview_batch
    command: |
      echo "Batch generation:"
      echo "Model: ${model}"
      echo "Duration: ${duration}s"
      echo "Prompts: ${prompts}"
    approval: required

  - id: submit_batch
    command: |
      for prompt in $(echo '${prompts}' | jq -r '.[]'); do
        agent-media generate ${model} -p "$prompt" --duration ${duration} --json
      done
    condition: $preview_batch.approved

  - id: list_results
    command: agent-media list --status completed --limit 10 --json
    condition: $preview_batch.approved
