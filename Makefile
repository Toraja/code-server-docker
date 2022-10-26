TAG=latest

.PHONY: view-pass
view-pass:
	@docker compose exec code less .config/code-server/config.yaml

.PHONY: renew-image
renew-image:
	@docker pull codercom/code-server:${TAG}
	@docker compose build --build-arg TAG=${TAG}
