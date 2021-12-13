FROM golang:alpine as builder

WORKDIR /go/src/

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /app main.go

FROM scratch 

COPY --from=builder /app /app

CMD [ "/app" ] 