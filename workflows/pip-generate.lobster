name: agent-media-pip-ugc
args:
  script:
    default: ""
  actor:
    default: ""
  style:
    default: "hormozi"
  duration:
    default: "15"
steps:
  - id: check_credits
    command: agent-media credits --json

  - id: list_actors
    command: agent-media actor list --json

  - id: confirm_generation
    command: |
      echo "PIP UGC Video Generation"
      echo "Script: ${script}"
      echo "Actor: ${actor:-auto-selected}"
      echo "Style: ${style}"
      echo "Duration: ${duration}s"
      echo "Mode: PIP (talking head + B-roll overlays)"
      echo "Ready to generate?"
    approval: required

  - id: generate
    command: agent-media ugc "${script}" --actor ${actor} --style ${style} --duration ${duration} --pip --sync --json
    condition: $confirm_generation.approved

  - id: download
    command: agent-media download $generate.json.job_id --json
    condition: $confirm_generation.approved
