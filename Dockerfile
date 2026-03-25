FROM n8nio/n8n:latest

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=America/Sao_Paulo

# Create startup script during Linux build (no CRLF issues)
# Forces correct DB credentials regardless of Railway dashboard overrides
USER root
RUN printf '#!/bin/sh\n\
export DB_TYPE=postgresdb\n\
export DB_POSTGRESDB_HOST=trolley.proxy.rlwy.net\n\
export DB_POSTGRESDB_PORT=43752\n\
export DB_POSTGRESDB_DATABASE=railway\n\
export DB_POSTGRESDB_USER=postgres\n\
export DB_POSTGRESDB_PASSWORD=lRlwlACgqRkNKoNWCdiSxtIlGRAAXUjg\n\
export DB_POSTGRESDB_SSL_ENABLED=true\n\
export DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false\n\
exec tini -- /docker-entrypoint.sh "$@"\n' > /startup.sh \
    && chmod +x /startup.sh

USER node
ENTRYPOINT ["/startup.sh"]
CMD ["n8n"]
