GOCMD=go

test:
	$(GOCMD) test -v ./...

release:
	npx github:escaletech/releaser
