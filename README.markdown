# Hello-World-Docker
This repository was developed for educational purposes as part of my **hello-world** series of repos to show how to use different software technologies in Common Lisp (CL) projects.

In this repository, called **hello-world-docker**, we show how to build Docker images and containers for the [hello-world](https://github.com/jeosol/hello-world) project.

Docker containers are important because they provide a portable mechanism for deploying applications. The rest of the article assumes that the reader is familiar with Docker and Dockerfiles. Please see [docker](https://docs.docker.com/engine/reference/builder/) for more details.

## Introduction
This example project shows how to build and run docker containers. We will be using the simple [hello-world](https://github.com/jeosol/hello-world) project to illustrate this. This project contains a single function that takes an optional argument **name** that defaults to the string "john":
```
(greet-user &optional (name "john") ...)
```
The function can be called with or without an argument. These cases are shown next:
### with arguments
Here the function is called with argument set as "mary".
```
(greet-user "mary")
Hello Mary!
```
### without arguments:
Here the function is called with no argument - the default name "john" is used.
```
(greet-user)
Hello John!
```

Please note that the **hello-world** project does not do much and this is intentional. The focus is to show how to build Docker images for CL projects. The methods for building images and running containers are largely independent of the project.

## Build Docker Image

Building a docker image starts from a base image on which we write further instructions specified in a file called **Dockerfile**. From this base image, we can install required libraries, copy our source code and perform any other required operations, e.g., compile source code to create artifacts, e.g., a binary/executable file. Finally, we save the updated image by tagging it with a new name and version. The new image is then run as a container later. Please see [Docker](https://docs.docker.com/engine/reference/builder/) website for more details. 

We are going to build two docker images for the **hello-world** project. The two images illustrate one of many ways to build and run docker containers for CL projects.

In the first image, we build the container to load the hello-world project and
drop us into a REPL (READ-EVAL-PRINT-LOOP) with the **\*package\*** initialized such that we can just type
**greet-user** function into the REPL without the package name. In the second case, we set up the image so then when the container is run, the hello-world executable is called with the specified name and the result (i.e., greeting) is printed to the standard output and then the application exits.

In the next section, we will describe the base docker image used for building the docker images, and other base images that can be used.

### Base SBCL Docker Image
It should be noted that I used a custom SBCL image as the base image (please see **FROM** statement in the Dockerfile for detail). This base SBCL image is based on debian bullseye and uses SBCL version 2.1.10 and quicklisp version 2021-10-21.

There are other SBCL images (for example, see [fukamachi/sbcl](https://hub.docker.com/r/fukamachi/sbcl) and [clfoundation/sbcl](https://hub.docker.com/r/clfoundation/sbcl) that support multiple linux distros (e.g., debian, alpine, ubuntu) and SBCL versions (2.1.10, 2.1.9, ...). The interested user can also use these base SBCL images in the Dockerfiles for different combination of distros and/or SBCL versions.

## Running Docker Container
The hello-world-docker repository includes a Makefile with all the required targets to create the two images described earlier and additional commands to run the Docker containers.

After cloning the **hello-world-docker** repository, change to the hello-world-docker directory and issue the following command:
```
make clone
```
The above command will clone the **hello-world** repository into the current directory. We want to build Docker images for the hello-world project. (Note that we set the .gitignore file ignore the hello-world folder)

After cloning the repository, we can proceed to build the two Docker images as described below. Note that the commands described here are the **make** targets. Please refer to the Makefile and related Dockerfiles for detailed syntax.

### Building the REPL-based image:
This image is built such that when we run the container, we are dropped into a Common Lisp REPL. The REPL-based image is built using the following command:
```
make hello-world-repl-image
```
To run the container, type the following command at the console:
```
make run-hello-world-repl-container
```
The container starts and the user is dropped into a REPL. The *greet-user* function is defined in the **hello-world/src/hello-world** package. Type **\*package\*** in the REPL to confirm that the current package is **hello-world/src/hello-world**. We can then run call the function (greet-user <name>), where <name> is the string argument to the function.

Please see the included **Dockerfile**, Makefile, and associated lisp and bash script files for details on how to bild the REPL-based image.

### Building the executable-based image:
Here, we create an exectuable and setup the image to run the executable as the final command in the docker file (see Dockerfile-exe in the repository). To build the image, type the following command at the console:
```
make hello-world-exe-image
```
To run this container, type the following command:
```
make run-hello-world-exe-container NAME=mary
```
In the above make command, the variable NAME contains the argument that is passed to the executable in the container. This is equivalent to calling (greet-user "mary"). Additionally, the container runs, prints "Hello Mary!" and then exits. Note there, we do not enter a repl as described earlier.

Please see the included **Dockerfile-exe**, Makefile and associated lisp and bash scripts for this setup. 

## Installation
To clone the repository to your local machine, enter the following command in a shell:
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
