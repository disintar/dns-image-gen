FROM golang:1.22-alpine
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o dns-image-gen .

EXPOSE 8080
CMD ["./dns-image-gen", "-host", "0.0.0.0:8080"]