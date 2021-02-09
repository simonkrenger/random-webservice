FROM registry.fedoraproject.org/fedora-minimal:latest as build
LABEL maintainer="Simon Krenger <simon@krenger.ch>"

WORKDIR /go/src/github.com/simonkrenger/random-webservice
RUN microdnf install golang && go get github.com/gin-gonic/gin
COPY random.go .

# http://blog.wrouesnel.com/articles/Totally%20static%20Go%20builds/
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' .

FROM scratch
LABEL maintainer="Simon Krenger <simon@krenger.ch>"
LABEL description="A small container with a web service that returns a random number"

WORKDIR /
COPY --from=0 /go/src/github.com/simonkrenger/random-webservice/random-webservice .

EXPOSE 8080
USER 1001
ENV GIN_MODE release

ENTRYPOINT ["/random-webservice"]
