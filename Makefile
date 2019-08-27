GOPATH := $(PWD)
PATH := "$(PATH):$(GOPATH)/bin"
PKGS := go-oracle

.PHONY:

prepare:
	@go get -v github.com/golang/dep/cmd/dep
	@go get -v golang.org/x/lint/golint
	@go get -v github.com/golangci/golangci-lint/cmd/golangci-lint

dep:
	@bash $(GOPATH)/scripts/dep.sh $(PKGS)

lint:
	@bash $(GOPATH)/scripts/golangci-lint.sh $(PKGS)
	@bash $(GOPATH)/scripts/golint.sh $(PKGS)

build:
	@cd $(GOPATH)/src/go-oracle && go build

run:
	@cd $(GOPATH)/src/go-oracle && go run main.go

oracle-instantclient:
	@bash $(GOPATH)/scripts/oracle-instantclient.sh