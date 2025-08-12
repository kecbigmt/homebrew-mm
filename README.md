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
- **Date-Based Organization**: Smart time-based filtering with default 15-day range
- **Project & Context Tagging**: Using `+project` and `@context` syntax (todo.txt compatible)
- **Flexible Date Support**: Various date formats, relative dates (today/tomorrow), and date ranges
- **Shell Tab Completion**: Auto-complete for commands, projects, and contexts
- **Advanced Date Input Support**: Date aliases (td/tm/yd), relative offsets (+3d/-7d), weekday specs (next-friday/nf), and enhanced M/D format
- **Inline Metadata Parsing**: Parse metadata directly in node titles using +project, @context, and .date syntax
- **Streaming Display**: Date-grouped output with system pager integration and enhanced event formatting
- **MCP Integration**: Use as Model Context Protocol server for AI assistants
- **Simplified Commands**: Intuitive command structure with helpful aliases

### Quick Start Guide

#### Basic Usage

```bash
# Create nodes (simplified syntax)
mm note "Meeting insights" --project work
mm task "Review PR" --date 2025-01-15
mm event "Team meeting" --date "2025-01-15 14:00"

# Create nodes with inline metadata parsing
mm note "Meeting insights +work @office"
mm task "Review PR +development @github .tomorrow"
mm event "Team meeting +work @office .2025-01-15"

# Using aliases for faster typing
mm n "Quick note +personal"    # 'n' alias for 'note'
mm t "Quick task @home"        # 't' alias for 'task'
mm ev "Quick event +work"      # 'ev' alias for 'event'

# List nodes with date-based filtering
mm list                    # Default range (last-7d..next-7d)
mm list today              # Today only
mm list last-7d            # Last 7 days
mm list this-week          # This week
mm tasks --status closed   # Only closed tasks
mm events tomorrow         # Tomorrow's events

# Show and edit (with aliases)
mm show abc123             # Show details
mm s abc123                # 's' alias for 'show'
mm edit abc123 --title "New title"
mm e abc123 --project work # 'e' alias for 'edit'

# Workspace management (unified under 'workspace')
mm workspace add work      # or 'mm ws add work'
mm workspace use work      # or 'mm ws use work'
mm workspace list          # or 'mm ws ls'
mm workspace remove old    # or 'mm ws rm old'

# List projects and contexts
mm projects                # List projects from nodes
mm contexts                # List contexts from nodes
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
- `mm note [title]` (`mm n [title]`) - Create a note
- `mm task [title]` (`mm t [title]`) - Create a task
- `mm event [title]` (`mm ev [title]`) - Create an event

#### Node Operations
- `mm list [date]` (`mm ls [date]`) - List nodes within date range (default: last-7d..next-7d)
- `mm notes [date]` (`mm ns [date]`) - List notes only
- `mm tasks [date]` (`mm ts [date]`) - List tasks only
- `mm events [date]` (`mm evs [date]`) - List events only
- `mm show <id>` (`mm s <id>`) - Show node details
- `mm edit <id>` (`mm e <id>`) - Edit a node
- `mm close <id>` (`mm cl <id>`) - Close a task/event
- `mm reopen <id>` (`mm op <id>`) - Reopen a closed task/event
- `mm remove <id>` (`mm rm <id>`) - Delete a node

#### Project and Context Management
- `mm projects` - List projects from nodes
- `mm contexts` - List contexts from nodes

#### Workspace Management
- `mm workspace` (`mm ws`) - Workspace commands
  - `list` (`ls`) - List workspaces
  - `add <name>` - Create workspace
  - `use <name>` - Switch to workspace
  - `remove <name>` (`rm <name>`) - Delete workspace

#### Date Input Options
- `today`, `tomorrow`, `yesterday`
- `this-week`, `last-week`, `next-week`
- `this-month`, `last-month`, `next-month`
- `last-7d`, `next-7d` (relative ranges)
- `1/15`, `2025/1/15` (flexible formats)
- `2025-01-15..2025-01-31`, `1/1..1/7` (date ranges)

## Shell Completion Setup

mm supports shell completion for both bash and zsh to provide auto-completion for commands, options, node IDs, projects, and contexts.

### Bash Setup

1. **Generate completion script:**
   ```bash
   mm completions bash > ~/.mm-completion.bash
   ```

2. **Source the completion in your shell:**
   ```bash
   # Add to your ~/.bashrc or ~/.bash_profile
   source ~/.mm-completion.bash
   ```

3. **Or install system-wide (requires sudo):**
   ```bash
   mm completions bash | sudo tee /etc/bash_completion.d/mm-completion.bash
   ```

### Zsh Setup

1. **Generate completion script:**
   ```bash
   mm completions zsh > ~/.mm-completion.zsh
   ```

2. **Source the completion in your shell:**
   ```bash
   # Add to your ~/.zshrc
   source ~/.mm-completion.zsh
   ```


### Completion Features

- **Command completion**: Tab completion for all commands and aliases (`note`, `n`, `task`, `t`, etc.)
- **Node ID completion**: Auto-completion of 7-character short IDs for `show`, `edit`, `close`, `remove` commands
- **Project/Context completion**: Tab completion for existing `+project` and `@context` tags
- **Date completion**: Smart completion for date inputs (`today`, `tomorrow`, `last-7d`, etc.)
- **Option completion**: Auto-completion for command flags and options
- **Workspace completion**: Tab completion for workspace names in `workspace use/remove` commands

After setup, restart your shell or run `source ~/.bashrc` (bash) / `source ~/.zshrc` (zsh) to enable completions.

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
