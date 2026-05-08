<!-- Begin: Gemini CLI Code Intelligence -->
# Clash Verge Rev Project Instructions

This document provides essential context and instructions for AI agents working on the **Clash Verge Rev** codebase.

## Project Overview

Clash Verge Rev is a continuation of the Clash Verge project, built using **Tauri 2**. It provides a GUI for **Mihomo (Clash Meta)**.

- **Frontend**: React 19, TypeScript, Vite, Material UI (MUI) v9, TanStack Query/Table.
- **Backend**: Rust, Tauri 2, Tokio, Anyhow.
- **Internal Core**: Mihomo (Clash Meta) core integrated via sidecars.

## Architecture

The project follows a typical Tauri 2 structure with a clear split between frontend and backend.

### Backend (Rust)

- `src-tauri/src/main.rs`: Entry point, sets up the Tokio runtime.
- `src-tauri/src/lib.rs`: Main library logic, registers Tauri plugins and IPC commands.
- `src-tauri/src/cmd.rs`: Implementation of IPC commands.
- `src-tauri/src/core/`: Core logic including Mihomo lifecycle management and configuration handling.
- `crates/`: Internal workspace members:
    - `clash-verge-draft`: Profile and configuration editing/parsing.
    - `clash-verge-logging`: Unified logging system.
    - `clash-verge-signal`: Signal/Event handling.
    - `clash-verge-i18n`: Internationalization utilities.
    - `clash-verge-limiter`: Resource limiting logic.
    - `tauri-plugin-clash-verge-sysinfo`: System information plugin.

### Frontend (React)

- `src/`: Main frontend source directory.
- `src/main.tsx`: React entry point.
- `src/components/`: UI components organized by feature.
- `src/hooks/`: Custom React hooks for interacting with the backend and state.
- `src/providers/`: Context providers for global state management.
- `src/services/`: External services and core logic (i18n, monaco, query client).
- `src/types/`: TypeScript definitions.

## Building and Running

### Prerequisites

- Rust and Node.js (with `corepack pnpm`).
- Windows users requires _Microsoft Visual Studio IDE_ or _Microsoft Visual Studio Build Tools_ with at lease _Desktop C++ Workloads_
- Windows users may need GNU `patch`.
- Linux users may need `gcc` or even `build-essential`.

### Commands

- **Initialization**: `corepack pnpm run prebuild` (Downloads Mihomo core binaries).
- **Development**: `corepack pnpm dev` (Runs Tauri in dev mode with `verge-dev` feature).
- **Production Build**: `corepack pnpm build`.
- **Fast Build**: `corepack pnpm build:fast` (Optimized for development/testing).
- **Cleanup**: `corepack pnpm clean`.

## Development Conventions

### Code Quality & Formatting

- **Frontend**: 
    - Linting: `corepack pnpm lint` (ESLint).
    - Formatting: `corepack pnpm format` (Biome).
- **Backend**:
    - Linting: `cargo clippy` (Custom clippy rules defined in workspace `Cargo.toml`).
    - Formatting: `cargo fmt`.

### IPC Guidelines

- Use the `tauri-plugin-mihomo` for interacting with the Mihomo core.
- New IPC commands should be added to `src-tauri/src/cmd.rs` and registered in `src-tauri/src/lib.rs`.

### Internationalization (i18n)

- Localized strings are in `src/locales/`.
- Use the provided scripts for maintenance:
    - `corepack pnpm i18n:check`: Check for unused keys.
    - `corepack pnpm i18n:format`: Format and align locale files.
    - `corepack pnpm i18n:types`: Generate TypeScript types for locale keys.

### Git Commits

- **Signing**: All commits MUST be signed-off and GPG-signed (`git commit -S -s`).
- **Attribution**: Follow standard attribution tags for AI-generated changes.
- **AI Assisted claim**: All commits directly commited by AI should add a suffix as following style.
  - `gcc` / `cmake` and any other similar, AI unrelated tools **SHOULD NOT** be mentioned.
  - Tools might be available for you via MCP. You're free to mention them, but **ALWAYS WITH CAUTION**.
  - Ask me when you can't sure if a tool should be mentioned.

```raw
Assisted-by: Gemini:<Model name> [tool1] [tool2]
```

## Key Directories Reference
- `src/`: Frontend React application.
- `src-tauri/`: Tauri backend application (Rust).
- `crates/`: Internal Rust libraries and plugins.
- `scripts/`: Build, release, and maintenance scripts.
- `docs/`: Multi-language documentation.
- `sidecar/`: (Generated) Contains Mihomo core binaries after `prebuild`.
<!-- End: Gemini CLI Code Intelligence -->

<!-- CODEGRAPH_START -->
## CodeGraph

In repositories indexed by CodeGraph (a `.codegraph/` directory exists at the repo root), reach for it BEFORE grep/find or reading files when you need to understand or locate code:

IMPORTANT: When file `.codegraph/.dirty` exists, meaning the CodeGraph project index is currently out-of-date. Run `codegraph sync` first **BEFORE** doing your code search.

- **MCP tool** (when available): `codegraph_explore` answers most code questions in one call — the relevant symbols' verbatim source plus the call paths between them, including dynamic-dispatch hops grep can't follow. Name a file or symbol in the query to read its current line-numbered source. If it's listed but deferred, load it by name via tool search.
- **Shell** (always works): `codegraph explore "<symbol names or question>"` prints the same output.

If there is no `.codegraph/` directory, skip CodeGraph entirely — indexing is the user's decision.
<!-- CODEGRAPH_END -->
