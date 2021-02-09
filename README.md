# Web service to return a random number

Go-based web service that returns a random number when queried on port 8080. Comes with a Dockerfile to build and run the service.

```
# Build
docker build .

# Run locally
docker run -d -p 8080:8080 quay.io/simonkrenger/random-webservice:latest

# Run and expose on OpenShift
oc run random-webservice --image=quay.io/simonkrenger/random-webservice:latest
oc expose dc random-webservice --port 8080
oc create route edge random-webservice --service=random-webservice --port=8080

# Query
curl localhost:8080/random
{"number":"81"}
```
