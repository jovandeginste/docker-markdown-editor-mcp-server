# Use a lightweight Python base image
FROM python:3.13-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Install mcp-proxy and markdown-editor-mcp-server
RUN pip install mcp-proxy markdown-editor-mcp-server

# Set the working directory
WORKDIR /projects

# Expose the port mcp-proxy will run on
EXPOSE 8083

# The command to run mcp-proxy with the markdown-editor-mcp-server
# We bind to 0.0.0.0 so the server is accessible from outside the container
CMD ["mcp-proxy", "--port=8083", "--host=0.0.0.0", "--", "markdown-editor-mcp-server"]
