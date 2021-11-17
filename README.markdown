# Hello-World-Docker
This repository was developed for educational purposes as part of my **hello-world** series of repos to show how to use different software technologies in Common Lisp (CL) projects.

In this repository, called **hello-world-docker**, we show how to build Docker images and containers for the [hello-world](https://github.com/jeosol/hello-world) project.

Docker containers are important because they provide a portable mechanism for deploying applications. Please see [docker](https://docs.docker.com/engine/reference/builder/) for more details.

## Introduction
This example project shows how to build and run docker containers. We will be using the simple [hello-world](https://github.com/jeosol/hello-world) project to illustrate this. This project contains a single function that takes an optional argument **name** that defaults to "john":
```
(greet-user &optional (name "john") ...)
```
The function can be called with or without argument and the output for each case is shown below:
```
(greet-user)
Hello John!
```
```
(greet-user "mary")
Hello Mary!
```
Please note that the **hello-world** project does not do much and this is intentional. The focus is on building docker images for CL projects and the methods for building the images and running the containers are largely independent of the project.

## Build Docker Image

Build a docker image requires a base image on which we write further instructions using specifications in a file called **Dockerfile**. From this base image, we can install required libraries, copy our source code and perform any other required operations, e.g., source compilations to generate an executable. Finally, we save the updated image with a new name and this image can be run as a docker container later on. Please see [docker](https://docs.docker.com/engine/reference/builder/) for more details. 

We are going to build two docker images for the **hello-world** project. The two images illustrate one of many ways to use docker containers.

In the first image, we build the container to load the hello-world project and
drop us in a repl with the package initialized such that we can run the
**greet-user** function. In the second case, we setup up the image so when the container is run, it presents the greeting to standard output and then exits.

### Base SBCL image
It should be noted that I used a custom SBCL container as the base image (see Dockerfile for detail). This base SBCL image is based on debian bullseye and uses SBCL version 2.1.10 and quicklisp version 2021-10-21. There are other SBCL images (e.g., see [fukamachi/sbcl](https://hub.docker.com/r/fukamachi/sbcl) and [clfoundation/sbcl](https://hub.docker.com/r/clfoundation/sbcl) that support multiple linux distros type and versions (e.g., debian, alpine, ubuntu) and SBCL versions. The interested user can also use these base images in the docker files or when targetting other distros (other than debian) and/or SBCL versions.

## Running Docker Container
The repository contains a Makefile that contains the required targets to create the two images mentioned above and to run the containers.

After cloning the **hello-world-docker** repository, change to the directory hello-world-docker and issue the command:
```
make clone
```
This will clone the **hello-world** repository in the current directory. This folder contains the source codes for which we want to build the images for. (Note the .gitignore file is set to ignore the hello-world folder)

After cloning setup above, you can build one of the two images mentioned above.

### Build repl-based image:
To build a repl-based image, i.e., we drop into a repl when the container is run, issue the following command:
```
make hello-world-repl-image
```
To run this container, issue the following command
```
make run-hello-world-repl-container
```
and the user is dropped into a repl. The *greet-user* is defined in the hello-world/src/hello-world package. Type **\*package\*** in the repl to confirm that the current package is hello-world/src/hello-world. We can then run call the function (greet-user <name>).

Please see the included **Dockerfile**, Makefile, and associated lisp and bash script files for this particular setup.

### Build executable image:
Here, we create an exectuable and setup the image to run the executable as the final command in the docker file (see Dockerfile-exe in the repository). To build the image, issue the following command:
```
make hello-world-exe-image
```
To run this container, issue the following command:
```
make run-hello-world-exe-container NAME=mary
```
In the above make command, the variable NAME contains the argument that is passed to the executable in the container. This is equivalent to calling (greet-user "mary"). Additionally, the container runs, prints "Hello Mary!" and then exits. Note there, we do not enter a repl as described earlier.

Please see the included **Dockerfile-exe**, Makefile and associated lisp and bash scripts for this setup. 

## Installation
To clone the repository to your local machine, issue the following command in a shell:
```
git clone https://github.com/jeosol/hello-world-docker.git
```
Then change to the **hello-world-docker** directory and issue one or both make commands described above to build the repl- or executable-based images (see previous section). Please ensure that you have Docker installed and running on your local machine before executing the **make** commands.

Please file an issue if you encounter problems creating the docker images.

## Author

* jeosol (jeronwunalu@gmail.com)

## Copyright

* Copyright(c) 2021 jeosol (jeronwunalu@gmail.com)


## License

* Copyright 2021 jeosol Released under the MIT License [http://opensource.org/licenses/mit-license.php](http://opensource.org/licenses/mit-license.php)
