# Web service to return a random number

Go-based web service that returns a random number when queried. Comes with a Dockerfile to build and run the service.

```
# Build
docker build -t simonkrenger/random-webservice:1.0 -t simonkrenger/random-webservice:latest .

# Run
docker run -d -p 8080:8080 simonkrenger/random-webservice:latest

# Query
curl localhost:8080/random
{"number":"81"}
```