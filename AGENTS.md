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
- Rust and Node.js (with `pnpm`).
- Windows users may need `LLVM` and GNU `patch`.

### Commands
- **Initialization**: `pnpm run prebuild` (Downloads Mihomo core binaries).
- **Development**: `pnpm dev` (Runs Tauri in dev mode with `verge-dev` feature).
- **Production Build**: `pnpm build`.
- **Fast Build**: `pnpm build:fast` (Optimized for development/testing).
- **Cleanup**: `pnpm clean`.

## Development Conventions

### Code Quality & Formatting
- **Frontend**: 
    - Linting: `pnpm lint` (ESLint).
    - Formatting: `pnpm format` (Biome).
- **Backend**:
    - Linting: `cargo clippy` (Custom clippy rules defined in workspace `Cargo.toml`).
    - Formatting: `cargo fmt`.

### IPC Guidelines
- Use the `tauri-plugin-mihomo` for interacting with the Mihomo core.
- New IPC commands should be added to `src-tauri/src/cmd.rs` and registered in `src-tauri/src/lib.rs`.

### Internationalization (i18n)
- Localized strings are in `src/locales/`.
- Use the provided scripts for maintenance:
    - `pnpm i18n:check`: Check for unused keys.
    - `pnpm i18n:format`: Format and align locale files.
    - `pnpm i18n:types`: Generate TypeScript types for locale keys.

### Git Commits
- **Signing**: All commits MUST be signed (`git commit -S -s`).
- **Attribution**: Follow standard attribution tags for AI-generated changes.

## Key Directories Reference
- `src/`: Frontend React application.
- `src-tauri/`: Tauri backend application (Rust).
- `crates/`: Internal Rust libraries and plugins.
- `scripts/`: Build, release, and maintenance scripts.
- `docs/`: Multi-language documentation.
- `sidecar/`: (Generated) Contains Mihomo core binaries after `prebuild`.
<!-- End: Gemini CLI Code Intelligence -->
