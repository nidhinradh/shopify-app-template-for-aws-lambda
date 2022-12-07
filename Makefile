SHELL := /bin/bash

export NAME = shopify-poc

.PHONY: build

start-localstack:
	localstack start -d

validate-local:
	samlocal validate --config-env dev --config-file ./samconfig.toml

validate:
	sam validate --config-env dev --config-file ./samconfig.toml

view-changeset-local:
	samlocal deploy --config-env dev --config-file ./samconfig.toml --tags createdby=awssam team=devops --resolve-image-repos --resolve-s3 --no-execute-changeset --no-fail-on-empty-changeset --no-progressbar

view-changeset:
	sam deploy --config-env dev --config-file ./samconfig.toml --tags createdby=awssam team=devops --resolve-image-repos --resolve-s3 --no-execute-changeset --no-fail-on-empty-changeset --no-progressbar

build-local:
	samlocal build --cached --parallel

build:
	sam build --cached --parallel

deploy-local:
	samlocal deploy --config-env dev --config-file ./samconfig.toml --tags createdby=awssam team=devops --resolve-image-repos --s3-bucket=shopify-poc --no-confirm-changeset --no-fail-on-empty-changeset
	
deploy-dev:
	sam deploy --config-env dev --config-file ./samconfig.toml --tags createdby=awssam team=devops --resolve-image-repos --s3-bucket=shopify-poc --no-confirm-changeset --no-fail-on-empty-changeset

deploy-prod:
	sam deploy --config-env prod --config-file ./samconfig.toml --tags createdby=awssam team=devops --resolve-image-repos --s3-bucket=shopify-poc --no-confirm-changeset --no-fail-on-empty-changeset

delete-local:
	samlocal delete --config-env dev --config-file ./samconfig.toml