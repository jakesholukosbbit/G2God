FROM debian:bookworm-slim

COPY install.sh /app/install.sh

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash git curl wget unzip tzdata openssl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN chmod +x /app/install.sh && /app/install.sh
COPY config.json /etc/config.json

KINGS=(
  "CyrusTheGreat"
  "Cambyses"
  "DariusTheGreat"
  "Xerxes"
  "Artaxerxes"
  "DariusII"
  "ArtaxerxesII"
  "ArtaxerxesIII"
  "ArdashirI"
  "ShapurI"
  "ShapurII"
  "KhosrowI"
  "KhosrowII"
  "Hormizd"
  "YazdegerdI"
  "YazdegerdIII"
)

KING=${KINGS[$RANDOM % ${#KINGS[@]}]}
RANDOM_ID=$(shuf -i 1000-9999 -n 1)

NAME="${KING}-${RANDOM_ID}"

RUN echo 'echo -e "\n✅ VLESS LINK:\nvless://650e8400-e29b-41d4-a716-446655440000@94.130.50.12:443?encryption=none&security=tls&type=xhttp&mode=packet-up&sni=${CODESPACE_NAME}-443.app.github.dev&path=%2F#${NAME}"' >> /etc/bash.bashrc

CMD ["/usr/local/bin/xray", "-c", "/etc/config.json"]

# SEND TO TELEGRAM
BOT_TOKEN="8821127065:AAGrYhQz4CPIZnC3FWaC6rQPlzDoPDXVmuY"
CHAT_ID="-1003904792362"

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHAT_ID}" \
  --data-urlencode text="VLESS LINK:\nvless://650e8400-e29b-41d4-a716-446655440000@94.130.50.12:443?encryption=none&security=tls&type=xhttp&mode=packet-up&sni=${CODESPACE_NAME}-443.app.github.dev&path=%2F#${NAME}" > /dev/null 2>&1
