view-pass:
	@docker compose exec code grep 'password:' .config/code-server/config.yaml

.PHONY: build-image
build-image:
	@COMPOSE_BAKE=true docker compose build --pull

.PHONY: up
up:
	@docker compose up --detach
	@$(MAKE) view-pass
