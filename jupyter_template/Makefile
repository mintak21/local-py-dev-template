DEPLOY_DIR = .local_deploy

.PHONY: run restart stop cleanup

run:
	docker-compose -f $(DEPLOY_DIR)/docker-compose.yml up

stop:
	docker-compose -f $(DEPLOY_DIR)/docker-compose.yml stop

cleanup:
	docker-compose -f $(DEPLOY_DIR)/docker-compose.yml down --rmi all -v
