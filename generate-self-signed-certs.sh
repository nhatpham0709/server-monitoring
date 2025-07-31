#!/bin/bash

# Generate self-signed certificates for IP-based hosting
# Replace YOUR_SERVER_IP with your actual IP address

SERVER_IP="YOUR_SERVER_IP"  # Replace with your actual IP
CERT_DIR="./certs"

# Create certificates directory
mkdir -p $CERT_DIR

# Generate private key
openssl genrsa -out $CERT_DIR/private.key 2048

# Generate certificate signing request
openssl req -new -key $CERT_DIR/private.key -out $CERT_DIR/cert.csr -subj "/C=US/ST=State/L=City/O=Organization/CN=$SERVER_IP"

# Generate self-signed certificate
openssl x509 -req -days 365 -in $CERT_DIR/cert.csr -signkey $CERT_DIR/private.key -out $CERT_DIR/cert.crt

echo "Self-signed certificates generated in $CERT_DIR/"
echo "Private key: $CERT_DIR/private.key"
echo "Certificate: $CERT_DIR/cert.crt"
echo ""
echo "Remember to:"
echo "1. Replace YOUR_SERVER_IP with your actual IP in compose.yml"
echo "2. Update Traefik configuration to use these certificates" 