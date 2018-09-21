FROM alpine:latest
RUN apk update && apk add jq
COPY update-ddns /usr/local/bin/
CMD update-ddns
