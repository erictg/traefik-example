FROM golang:1.13.0-alpine3.10

ENV GOPATH /app
ENV PATH $PATH:$GOPATH/bin
ENV GO111MODULE=on

RUN mkdir /app
RUN mkdir /app/bin

RUN apk update
RUN apk add git

COPY ./api2 /app/src/api2
COPY go.mod /app/src/api2/go.mod
COPY go.sum /app/src/api2/go.sum
WORKDIR /app/src/api2

RUN go mod vendor

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go install
CMD /app/bin/traefik-example