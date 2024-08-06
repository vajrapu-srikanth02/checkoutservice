FROM golang:1.21.3-alpine as builder

WORKDIR /app

COPY . .

RUN go build -o checkoutservice

########################
FROM alpine:3.18.4

WORKDIR /app

COPY --from=builder /app/checkoutservice /app/checkoutservice

EXPOSE 5050

ENTRYPOINT ["/app/checkoutservice"]
