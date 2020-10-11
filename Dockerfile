FROM golang:alpine AS build
RUN GO111MODULE=on go get golang.zx2c4.com/wireguard@


FROM alpine:latest

RUN apk add --no-cache bash wireguard-tools
COPY --from=build /go/bin/wireguard /usr/bin/wireguard-go
COPY run.sh .

ENTRYPOINT ["/run.sh"]
