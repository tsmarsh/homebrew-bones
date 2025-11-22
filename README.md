# homebrew-bones

Homebrew tap for [bones](https://github.com/tsmarsh/bones) - a Makefile-based pipeline for generating books in multiple formats with AI assistance.

## Installation

### Using the tap

```bash
# Add the tap
brew tap tsmarsh/bones

# Install bones
brew install bones

# Or install with optional dependencies
brew install bones --with-pandoc --with-tectonic
```

### Install optional dependencies separately

```bash
# For full functionality, install pandoc and tectonic
brew install pandoc tectonic
```

## Quick Start

```bash
# Create a new book project
mkdir my-novel && cd my-novel
bones init

# Start writing
vim chapters/01-chapter-one.md

# Build your book
bones pdf        # Generate PDF
bones epub       # Generate EPUB
bones help       # See all options
```

## What is bones?

**Bones** is a zero-dependency, Makefile-based build system for authors who write books in Markdown. It transforms your Markdown chapters into professional PDFs, EPUB files, DOCX documents, and even audiobooks with AI-powered editing tools.

### Key Features

- Multiple output formats: PDF, EPUB, DOCX, and MP3 audiobooks
- Professional typesetting using Pandoc and Tectonic/XeLaTeX
- AI-assisted editing with built-in LLM-powered line editor and copy editor
- Zero Python dependencies (uses only Python standard library)
- Flexible AI backends: Supports Ollama (local), OpenAI, and Anthropic Claude
- Incremental builds: Only rebuilds what changed
- Git-integrated workflow for easy review of AI edits

## Documentation

For complete documentation, see the [bones repository](https://github.com/tsmarsh/bones).

## License

MIT License
