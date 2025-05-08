TAG=latest

.PHONY: view-pass
view-pass:
	@docker compose exec code less .config/code-server/config.yaml

.PHONY: build-image
build-image:
	@COMPOSE_BAKE=true docker compose build --pull --build-arg TAG=${TAG}
