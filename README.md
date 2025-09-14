# Homebrew Tap for exec's Tools

This is a Homebrew tap that provides formulae for various command-line tools.

## Installation

```bash
# Add the tap
brew tap exec/tap

# Install httpping
brew install httpping
```

## Available Formulae

### httpping
Advanced HTTP monitoring and ping utility for modern infrastructure.

**Features:**
- Single URL ping with smart User-Agent rotation
- Multi-target monitoring with YAML configuration
- Health scoring and uptime tracking  
- Slack/Discord webhook alerts
- Response time analytics
- JSON output for automation

**Usage:**
```bash
# Simple ping
httpping https://example.com

# Generate monitoring config
httpping init

# Run advanced monitoring
httpping monitor -c httpping.yml
```

## Updating

Formulae in this tap are automatically updated when new releases are published to their respective repositories.

## Contributing

This tap is automatically maintained. To request changes, please open an issue in the source repository.