# ACE-Step 1.5 Docker Image

A Docker image for running ACE-Step 1.5's built-in API server with models pre-baked.

## Features

- **ACE-Step's built-in API server** with full feature set
- **Multi-stage Docker build** with models baked in (~15GB image)
- **GPU support** via NVIDIA CUDA 12.8 runtime
- **LLM-powered features**: random sample generation, lyrics/caption formatting

## Quick Start

### Prerequisites

- Docker with NVIDIA Container Toolkit
- NVIDIA GPU with CUDA support
- HuggingFace token (for downloading gated models during build)

### 1. Build the Docker Image

```bash
# Using the build script
python build_docker.py acestep-api --hf-token YOUR_HF_TOKEN --latest

# Or manually
docker build --build-arg HF_TOKEN=YOUR_HF_TOKEN -t acestep-api:latest .
```

### 2. Run with Docker Compose

```bash
docker compose up -d
```

The API will be available at `http://localhost:8000`.

## API Endpoints

See the [ACE-Step API documentation](https://github.com/ace-step/ACE-Step-1.5/blob/main/docs/en/API.md) for full details.

### Core Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Health check |
| `/v1/models` | GET | List available models |
| `/release_task` | POST | Create music generation task |
| `/query_result` | POST | Batch query task results |
| `/create_random_sample` | POST | Generate random music parameters via LLM |
| `/format_input` | POST | Format and enhance lyrics/caption via LLM |
| `/v1/audio` | GET | Download audio file |

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `ACESTEP_CHECKPOINT_DIR` | `/app/checkpoints` | Model checkpoints directory |
| `ACESTEP_OUTPUT_DIR` | `/app/outputs` | Generated audio output directory |
| `ACESTEP_DEVICE` | `cuda` | Device (cuda, cpu, mps) |
| `ACESTEP_DIT_CONFIG` | `acestep-v15-turbo` | DiT model configuration |
| `ACESTEP_LM_MODEL` | `acestep-5Hz-lm-1.7B` | Language model |
| `ACESTEP_LM_BACKEND` | `vllm` | LLM backend (vllm, transformers) |
| `HOST` | `0.0.0.0` | Server host |
| `PORT` | `8000` | Server port |

## License

See the [ACE-Step 1.5 repository](https://github.com/ace-step/ACE-Step-1.5) for license information.
