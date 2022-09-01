.PHONY: view-pass
view-pass:
	@docker compose exec code less .config/code-server/config.yaml

.PHONY: renew-image
renew-image:
	@docker pull codercom/code-server:latest
