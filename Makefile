.PHONY: clean build

default: build

clean:
	@rm -f hugo

build: clean
	@go mod tidy
	@GO111MODULE=on CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
		go build -v -ldflags="-w -s -buildid=''" -trimpath -o hugo .
