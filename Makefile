clone:
	@echo "Cloning the hello-world repository ..."
	git clone https://github.com/jeosol/hello-world.git hello-world
	@echo "Finished cloning hello-world repository ..."

docker:
	@echo "Building hello-world docker image ..."
	docker image build -t hello-world -f Dockerfile . 
	@echo "Built hello-world image ..."

docker-nocache:
	@echo "Building hello-world docker image ..."
	docker image build --no-cache -t hello-world -f Dockerfile . 
	@echo "Built hello-world image ..."

run-image:
	@echo "Running the hello-world container ..."
	docker run --rm --name hello-world -it hello-world:latest

