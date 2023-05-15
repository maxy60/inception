FROM alpine:3.16


# update && upgrade packages
# install nginx and openssl
RUN apk update && apk upgrade && apk add --no-cache nginx openssl

COPY ./conf/nginx.conf /etc/nginx/http.d/

RUN openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out etc/ssl/msainton.pem \
        -keyout etc/ssl/msainton.key \
        -subj "/C=FR/ST=France/L=Paris/O=42/OU=student/CN=msainton.42.fr"\
        && chmod 600 etc/ssl/msainton.pem etc/ssl/msainton.key

#set entrypoint on the port 443
EXPOSE 443

#launch the webserver
ENTRYPOINT ["nginx"]

#to dont exec nginx on background
CMD ["-g", "daemon off;"]
