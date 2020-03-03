FROM golang:1.13.0-alpine3.10

ENV GOPATH /app
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOPATH/bin
ENV GO111MODULE=on

RUN mkdir /app
RUN mkdir /app/bin

RUN apk update
RUN apk add git

COPY ./api1 /app/src/api1
COPY go.mod /app/src/api1/go.mod
COPY go.sum /app/src/api1/go.sum
WORKDIR /app/src/api1

RUN go mod vendor

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go install
RUN ls
RUN ls /app/bin
CMD /app/bin/traefik-example