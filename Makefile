# Clone the hello-world github repository
clone:
	@echo "Cloning the hello-world repository ..."
	git clone https://github.com/jeosol/hello-world.git hello-world
	@echo "Finished cloning hello-world repository ..."

# Build the images taking advantage of any caching
hello-world-repl-image:
	@echo "Building hello-world (repl version) docker image ..."
	docker image build -t hello-world-repl -f Dockerfile . 
	@echo "Built hello-world-repl image ..."

hello-world-exe-image:
	@echo "Building hello-world (exe version) docker image ..."
	docker image build -t hello-world-exe -f Dockerfile-exe .
	@echo "Built hello-world-exe image ..."

# Buid the images without caching
hello-world-repl-image-nocache:
	@echo "Building hello-world-repl docker image ..."
	docker image build --no-cache -t hello-world-repl -f Dockerfile . 
	@echo "Built hello-world-repl image ..."

hello-world-exe-image-nocache:
	@echo "Building hello-world-exe docker image ..."
	docker image build --no-cache -t hello-world-exe -f Dockerfile-exe . 
	@echo "Built hello-world-exe image ..."

# Run the docker containers
run-hello-world-repl-container:
	@echo "Running the hello-world container ..."
	docker run --rm --name hello-world-repl -it hello-world-repl:latest

run-hello-world-exe-container:
	@echo "Running the hello-world-exe container ..."
	docker run --rm --name hello-world-exe -it hello-world-exe:latest

# docker exec into the hello-world-repl container
run-hello-world-repl-exec:
	docker exec -it hello-world-repl bash

# List hello-world* images
list-images:
	docker images | grep hello-world
