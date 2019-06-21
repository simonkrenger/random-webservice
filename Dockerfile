FROM golang:1.12 AS builder
WORKDIR $GOPATH/src/simonkrenger/random-webservice/
COPY random.go .

# Needed to compile static binary
ENV CGO_ENABLED 0

RUN go get
RUN go build -o /go/bin/random-webservice .

# Runtime

FROM scratch
COPY --from=builder /go/bin/random-webservice /go/bin/random-webservice
ENV GIN_MODE release
ENTRYPOINT ["/go/bin/random-webservice"]