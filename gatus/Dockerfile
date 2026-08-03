# Build the go application into a binary
FROM golang:1.26.3-alpine AS builder
RUN apk --update add ca-certificates

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

RUN addgroup -S gatus && adduser -S gatus -G gatus

COPY . . 
RUN CGO_ENABLED=0 GOOS=linux go build -o /gatus


FROM scratch
COPY --from=builder /gatus /gatus
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group
COPY config.default.yaml /config/config.yaml
USER gatus
EXPOSE 8080
ENTRYPOINT ["/gatus"]
