.PHONY: view-pass
view-pass:
	@docker-compose exec code less .config/code-server/config.yaml
