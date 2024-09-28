API_PROTO_FILES=$(shell cd server && find api -name *.proto)
THIRD_PARTY_PROTO_FILES=$(shell cd server && find third_party -type f -name '*.proto')
VERSION=$(shell git describe --tags --always)
PROTO_DIR=./server/api

.PHONY: version
#  version
version: ; $(info VERSION="$(VERSION)")

.PHONY: init
# init env
init:
	go install github.com/ktr0731/evans@latest
	python -m venv .venv && source .venv/bin/activate
	poetry install --no-root
	pub global activate protoc_plugin

.PHONY: run
# runs build_runner
run:
	dart run build_runner build --delete-conflicting-outputs

.PHONY: pod
# pod update
pod:
	cd macos && pod repo update && pod install --repo-update

.PHONY: prepare
# prepare
prepare:
	./prepare-sources.sh --proto ./server/api/service.proto --flutterDir ./ --pythonDir ./server

.PHONY: bundle
# bundle
bundle:
	./bundle-python.sh --flutterDir ./ --pythonDir ./server

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
	pyinstaller server/app.spec --distpath buildpy --noconfirm

.PHONY: api
# generate api proto
api:
	cd server && python -m grpc_tools.protoc -I. \
	        --proto_path=./third_party \
			--python_out=. \
			--grpc_python_out=. \
			$(API_PROTO_FILES)
	make apic

.PHONY: apic
# generate api client proto
apic:
	cd server && protoc -I=. \
	        --proto_path=./third_party \
	        --dart_out=grpc:../lib \
            $(API_PROTO_FILES)
	rm -rf lib/api/*.pbserver.dart

.PHONY: debug_grpc
# debug grpc
debug_grpc:
	 cd server && evans api/service.proto api/api.proto --port 50055

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
