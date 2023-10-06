FROM golang:1.21.1-alpine AS builder

WORKDIR /app

COPY . .

RUN go build main.go

FROM scratch
COPY --from=builder ./app .
ENTRYPOINT [ "./main" ]
