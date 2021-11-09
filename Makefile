# Clone the hello-world github repository
clone:
	@echo "Cloning the hello-world repository ..."
	git clone https://github.com/jeosol/hello-world.git hello-world
	@echo "Finished cloning hello-world repository ..."

# Build the images taking advantage of any caching
docker-repl:
	@echo "Building hello-world (repl version) docker image ..."
	docker image build -t hello-world-repl -f Dockerfile . 
	@echo "Built hello-world-repl image ..."

docker-exe:
	@echo "Building hello-world (exe version) docker image ..."
	docker image build -t hello-world-exe -f Dockerfile-exe .
	@echo "Built hello-world-exe image ..."

# Buid the images without caching
docker-repl-nocache:
	@echo "Building hello-world-repl docker image ..."
	docker image build --no-cache -t hello-world-repl -f Dockerfile . 
	@echo "Built hello-world-repl image ..."

docker-exe-nocache:
	@echo "Building hello-world-exe docker image ..."
	docker image build --no-cache -t hello-world-exe -f Dockerfile . 
	@echo "Built hello-world-exe image ..."

# Run the docker containers
run-docker-repl:
	@echo "Running the hello-world container ..."
	docker run --rm --name hello-world-repl -it hello-world-repl:latest

run-docker-exe:
	@echo "Running the hello-world-exe container ..."
	docker run --rm --name hello-world-exe -it hello-world-exe:latest

# List hello-world* images
list-images:
	docker images | grep hello-world
