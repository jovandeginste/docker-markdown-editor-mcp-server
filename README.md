# Markdown Editor MCP Server (Docker)

This repository provides a Dockerized version of the `markdown-editor-mcp-server` wrapped in an SSE (Server-Sent Events) proxy using `mcp-proxy`.

This allows the MCP server to be accessed over HTTP/SSE.

## Overview

-   **Base Image**: `python:3.13-slim`
-   **Tools**: `uv`, `mcp-proxy`, `markdown-editor-mcp-server`
-   **Port**: 8083

## Usage

### Build

```bash
docker build -t markdown-editor-mcp-server .
```

### Run

```bash
docker run -p 8083:8083 -v $(pwd):/projects markdown-editor-mcp-server
```

This mounts the current directory to `/projects` inside the container, allowing the markdown editor to access and modify files in your current working directory.

### Connection

The MCP server will be available at:

-   **SSE Endpoint**: `http://localhost:8083/sse`
-   **Message Endpoint**: `http://localhost:8083/message`
