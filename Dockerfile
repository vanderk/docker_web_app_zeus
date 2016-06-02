FROM golang:alpine

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/vanderk/docker_web_app_zeus

# Build the docker_web_app command inside the container.
RUN apk add --no-cache git \
	&& go get github.com/CiscoZeus/go-zeusclient \
	&& apk del git
RUN go install github.com/vanderk/docker_web_app_zeus

# Run the docker_web_app command by default when the container starts.
ENTRYPOINT /go/bin/docker_web_app_zeus

# Document that the service listens on port 8080.
EXPOSE 8080






