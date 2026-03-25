FROM n8nio/n8n:latest

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=America/Sao_Paulo

# Build startup script using echo (avoids CRLF and printf escape issues)
USER root
RUN echo '#!/bin/sh' > /startup.sh \
 && echo 'export DB_TYPE=postgresdb' >> /startup.sh \
 && echo 'export DB_POSTGRESDB_HOST=trolley.proxy.rlwy.net' >> /startup.sh \
 && echo 'export DB_POSTGRESDB_PORT=43752' >> /startup.sh \
 && echo 'export DB_POSTGRESDB_DATABASE=railway' >> /startup.sh \
 && echo 'export DB_POSTGRESDB_USER=postgres' >> /startup.sh \
 && echo 'export DB_POSTGRESDB_PASSWORD=lRlwlACgqRkNKoNWCdiSxtIlGRAAXUjg' >> /startup.sh \
 && echo 'export DB_POSTGRESDB_SSL_ENABLED=true' >> /startup.sh \
 && echo 'export DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false' >> /startup.sh \
 && echo 'exec tini -- /docker-entrypoint.sh "$@"' >> /startup.sh \
 && chmod +x /startup.sh \
 && cat /startup.sh

USER node
ENTRYPOINT ["/startup.sh"]
CMD ["start"]
