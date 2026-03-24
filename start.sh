#!/bin/sh
echo "Starting N8N on port ${PORT:-5678}"
export N8N_PORT=${PORT:-5678}
exec n8n start
