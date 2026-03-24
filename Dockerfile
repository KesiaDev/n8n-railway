FROM n8nio/n8n:latest

ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=America/Sao_Paulo

USER root
RUN printf '#!/bin/sh\nexport N8N_PORT=${PORT:-5678}\nexec n8n start\n' > /start.sh \
    && chmod +x /start.sh
USER node

ENTRYPOINT []
CMD ["/bin/sh", "/start.sh"]
