# Gunakan image Alpine Linux dari Golang
FROM golang:1.22.2-alpine

# Set working directory di dalam container
WORKDIR /go/src/app

# Salin kode aplikasi Go ke dalam container
COPY . .

# Salin file go.mod dan go.sum untuk mengoptimalkan caching
COPY go.mod go.sum ./

# Download dan instal dependensi menggunakan Go modules
RUN go mod tidy

# Expose port 4040
EXPOSE 4040

# Kompilasi dan jalankan aplikasi Go
CMD ["go", "run", "main.go"]
