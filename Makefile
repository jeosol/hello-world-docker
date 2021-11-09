clone:
	git clone https://github.com/jeosol/hello-world.git hello-world

docker: clone
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

