name: agent-media-generate
args:
  prompt:
    default: ""
  model:
    default: ""
  duration:
    default: "5"
steps:
  - id: check_credits
    command: agent-media credits --json

  - id: pick_model
    command: agent-media models --json
    stdin: $check_credits.json

  - id: confirm_generation
    command: |
      echo "Model: ${model:-auto-selected}"
      echo "Prompt: ${prompt}"
      echo "Duration: ${duration}s"
      echo "Ready to generate?"
    approval: required

  - id: generate
    command: agent-media generate ${model} -p "${prompt}" --duration ${duration} --json
    condition: $confirm_generation.approved

  - id: poll_status
    command: agent-media status $generate.json.job_id --json
    condition: $confirm_generation.approved

  - id: download
    command: agent-media download $generate.json.job_id --json
    condition: $confirm_generation.approved
