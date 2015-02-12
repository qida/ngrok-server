ngrok-server
===========

Usage
-----

    docker run -d \
        -e TLS_CERT="`awk 1 ORS='\\n' <TLS_CERT_FILE>`" \
        -e TLS_KEY="`awk 1 ORS='\\n' <TLS_KEY_FILE>`" \
        -e CA_CERT="`awk 1 ORS='\\n' <CA_CERT_FILE>`" \
        -e DOMAIN="your.domain" \
        ngrok

Environment Variables
---------------------
    TLS_CERT        TLS cert file for setting up tls connection
    TLS_KEY         TLS key file for setting up tls connection
    CA_CERT         CA cert file for compiling ngrok
    DOMAIN          domain name that ngrok running on
    TUNNEL_ADDR     address that ngrok server's control channel listens to, ":4443" by default
    HTTP_ADDR       address that ngrok server's http tunnel listents to, ":80 by default"
    HTTPS_ADDR      address that ngrok server's https tunnel listents to, ":80 by default"
