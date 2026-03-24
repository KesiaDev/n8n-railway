FROM n8nio/n8n:latest

ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=America/Sao_Paulo

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
