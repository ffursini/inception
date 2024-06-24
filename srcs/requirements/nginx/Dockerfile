# Usa l'immagine di base Alpine Linux 3.19
FROM alpine:3.19

# Aggiorna le repository e installa nginx e openssl
RUN apk update && apk add nginx openssl

# Crea la directory per i certificati SSL
RUN mkdir -p /etc/nginx/ssl

# Genera un certificato SSL autogenerato usando openssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/fursini.crt \
    -keyout /etc/nginx/ssl/fursini.key \
    -subj "/C=IT/ST=Rome/L=Rome/O=42 Roma Luiss/OU=fursini/CN=fursini"

# Copia il file di configurazione nginx personalizzato nella directory di configurazione di nginx
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

# Esponi la porta 443 per le connessioni HTTPS
EXPOSE 443

# Avvia nginx in modalità daemon non demonizzata
CMD ["nginx", "-g", "daemon off;"]
