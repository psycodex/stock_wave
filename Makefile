API_PROTO_FILES=$(shell cd server && find api -name *.proto)
VERSION=$(shell git describe --tags --always)
PROTO_DIR=./server/api

.PHONY: version
#  version
version: ; $(info VERSION="$(VERSION)")

.PHONY: prepare
# prepare
prepare:
	./prepare-sources.sh --proto ./server/api/service.proto --flutterDir ./ --pythonDir ./server

.PHONY: build
# builds python first and then electron app with python embedded
build:
	rm -rf dist/
	make buildpy
	npm run build

.PHONY: buildpy
# builds python
buildpy:
	rm -rf buildpy/
	pyinstaller server/app.spec --distpath buildpy --noconfirm # --onefile

.PHONY: api
# generate api proto
api:
	cd server && protoc -I=. \
	        --proto_path=./third_party \
            --python_out=. \
            $(API_PROTO_FILES)
	make apic

.PHONY: apic
# generate api client proto   --ts_proto_out
apic:
	cd server && protoc -I=. \
	        --proto_path=./third_party \
	        --ts_proto_out=import_style=commonjs,binary:. \
            $(API_PROTO_FILES)
	mv server/api/*.ts renderer/src/api

# show help
help:
	@echo ''
	@echo 'Usage:'
	@echo ' make [target]'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
	helpMessage = match(lastLine, /^# (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 2, RLENGTH); \
			printf "\033[36m%-22s\033[0m %s\n", helpCommand,helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
