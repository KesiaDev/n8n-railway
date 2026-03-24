FROM n8nio/n8n:latest

ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=America/Sao_Paulo

EXPOSE 5678

CMD ["sh", "-c", "N8N_PORT=${PORT:-5678} n8n start"]
