FROM golang:alpine AS build
RUN GO111MODULE=on go get golang.zx2c4.com/wireguard@VERSION


FROM alpine:latest

RUN apk add --no-cache bash wireguard-tools
COPY --from=build /go/bin/wireguard /usr/bin/wireguard-go
COPY run.sh .

ENTRYPOINT ["/run.sh"]
