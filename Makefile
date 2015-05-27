IMAGE_NAME=repose-playground
PORTS=-p 8080:8080
VOLS=-v $(PWD)/etc/repose:/etc/repose


bootstrap:
	@echo "Building $(IMAGE_NAME) from Dockerfile"
	docker build -t $(IMAGE_NAME) .
	@echo "Copying default config"
	mkdir etc
	docker run -it -v $(PWD)/etc:/code $(IMAGE_NAME) cp -R /etc/repose/ /code/

run-daemon:
	@echo "Running repose as daemon. Set the $PORTS env var to expose more ports."
	@echo "   EX: make -e PORTS='-p 9001:9001' run-daemon"
	@echo "Port 8080 is exposed by default."
	docker run -it -d $(VOLS) $(PORTS) $(IMAGE_NAME)


run:
	@echo "Running repose as daemon. Set the $PORTS env var to expose more ports."
	@echo "   EX: make -e PORTS='-p 9001:9001' run-daemon"
	@echo "Port 8080 is exposed by default."
	docker run -it $(VOLS) $(PORTS) $(IMAGE_NAME)
