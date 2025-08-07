# homebrew-mm

Homebrew tap for installing mm tools - a fast and lightweight CLI tool for personal knowledge management.

## Installation

### Install Homebrew Tap

```bash
brew tap kecbigmt/mm
```

### Install mm CLI Tool

```bash
brew install mm-cli
```

### Install mm MCP Server

```bash
brew install mm-mcp
```

## mm - Personal Knowledge Management CLI Tool

mm is a personal knowledge management tool that helps you organize notes, tasks, and events with date-based filtering and project/context tagging.

### Features

- **Three Node Types**: Notes, Tasks, and Events
- **Date-Based Organization**: Smart time-based filtering with default 7-day range
- **Project & Context Tagging**: Using `+project` and `@context` syntax (todo.txt compatible)
- **Flexible Date Support**: Various date formats, relative dates (today/tomorrow), and date ranges
- **MCP Integration**: Use as Model Context Protocol server for AI assistants
- **Simplified Commands**: Intuitive command structure with helpful aliases

### Quick Start Guide

#### Basic Usage

```bash
# Create nodes
mm note "Meeting insights" --project work
mm task "Review PR" --date 2025-01-15
mm event "Team meeting" --date "2025-01-15 14:00"

# Using aliases for faster typing
mm n "Quick note"          # 'n' alias for 'note'
mm t "Quick task"          # 't' alias for 'task'
mm ev "Quick event"        # 'ev' alias for 'event'

# List nodes
mm list                    # Last 7 days (default)
mm list --date today       # Today only
mm tasks --status closed   # Only closed tasks
mm events --date tomorrow  # Tomorrow's events

# Show and edit
mm show abc123             # Show details
mm edit abc123 --title "New title"
mm close abc123            # Close a task/event
```

#### Workspace Management

```bash
mm workspace add work      # Create workspace
mm workspace use work      # Switch workspace
mm workspace list          # List workspaces
mm workspace remove old    # Delete workspace
```

### Command Reference

#### Node Creation
- `mm note [title]` (`mm n`) - Create a note
- `mm task [title]` (`mm t`) - Create a task
- `mm event [title]` (`mm ev`) - Create an event

#### Node Operations
- `mm list` (`mm ls`) - List all nodes (last 7 days)
- `mm notes` (`mm ns`) - List notes only
- `mm tasks` (`mm ts`) - List tasks only
- `mm events` (`mm evs`) - List events only
- `mm show <id>` (`mm s`) - Show node details
- `mm edit <id>` (`mm e`) - Edit a node
- `mm close <id>` (`mm cl`) - Close a task/event
- `mm reopen <id>` (`mm op`) - Reopen a closed task/event
- `mm remove <id>` (`mm rm`) - Delete a node

#### Date Filtering Options
- `today`, `tomorrow`, `yesterday`
- `this-week`, `last-week`, `next-week`
- `this-month`, `last-month`, `next-month`
- `last-7d`, `last-30d` (relative ranges)
- `2025-01-15..2025-01-31` (explicit date ranges)

## mm-mcp - MCP Server for AI Assistants

The mm-mcp tool allows AI assistants like Claude Desktop to interact with your personal knowledge management system.

### Configure Claude Desktop

Add the following to your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "mm": {
      "command": "mm-mcp",
      "args": [],
      "env": {
        "MM_WORKSPACE": "home"
      }
    }
  }
}
```

### Available MCP Tools

#### List and Show
- **`list_all`**: List nodes with date filtering
- **`list_notes`**: List notes only
- **`list_tasks`**: List tasks only
- **`list_events`**: List events only
- **`show`**: Show detailed information about a specific node

#### Create
- **`create_note`**: Create a new note
- **`create_task`**: Create a new task
- **`create_event`**: Create a new event

#### Edit and Manage
- **`edit_node`**: Edit existing node
- **`close_task`**: Mark task as completed
- **`reopen_task`**: Mark task as not completed
- **`remove_node`**: Delete a node

### Example MCP Usage with Claude

Once configured, you can ask Claude Desktop:

- "Show me all my tasks from today"
- "Create a note titled 'Meeting insights' with project 'work'"
- "Add a task 'Review PR' for tomorrow"
- "Close task abc123"
- "List my events for this week"

## Troubleshooting

### Installation Issues

If you encounter issues during installation:

```bash
# Update Homebrew
brew update

# Reinstall the tap
brew untap kecbigmt/mm
brew tap kecbigmt/mm

# Try installing again
brew install mm-cli
brew install mm-mcp
```
