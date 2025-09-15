# Homebrew Tap for exec's Tools

This is a Homebrew tap that provides formulae for various command-line tools.

## Installation

```bash
# Add the tap
brew tap exec/tap

# Install any tool
brew install httpping
brew install portscope
brew install rune
brew install mlscan
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

### portscope
Advanced network port scanner with intelligent service detection.

**Usage:**
```bash
# Scan a host
portscope 192.168.1.1

# Scan multiple hosts
portscope 192.168.1.1-10
```

### rune
A modern CLI text editor that bridges the gap between nano's simplicity and advanced features.

**Usage:**
```bash
# Edit a file
rune filename.txt

# Create new file
rune
```

### mlscan
Machine learning-enhanced port scanner with adaptive performance.

**Usage:**
```bash
# Basic scan
mlscan 192.168.1.1

# Show version
mlscan --version
```

## Updating

Formulae in this tap are automatically updated when new releases are published to their respective repositories.

## Contributing

This tap is automatically maintained. To request changes, please open an issue in the source repository.