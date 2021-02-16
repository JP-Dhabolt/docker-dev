version = manual
.PHONY: container

container:
	cd ${label} && docker build . --tag ghcr.io/jp-dhabolt/dev:${label} --tag ghcr.io/jp-dhabolt/dev:${label}.${version}
