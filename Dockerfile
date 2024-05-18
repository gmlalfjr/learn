FROM golang:1.22.2-alpine

WORKDIR app

COPY go.mod go.sum ./

RUN go mod tidy 

COPY . .

# Compile aplikasi Go
RUN go build -o main ./main.go

EXPOSE 4040

CMD ["./main"]