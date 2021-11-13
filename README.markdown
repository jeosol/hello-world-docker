# Hello-World-Docker

## Introduction
This is a simple example of how to build a docker image and container for a simple common lisp project. We will be using the simple [hello-world](https://github.com/jeosol/hello-world) project to illustrate this. This project contains a single function:
```
(greet-user &optional (name "john") ...)
```
The function can be called with or without argument and the output for each case is shown below:
```
(greet-user) => $Hello John!
```
```
(greet-user "mary") => Hello Mary!
```
Please note that the **hello-world** project does not do much and this is intentional. The focus is on building docker images for CL projects and the methods
are largely independent on the project.

## Build Docker Image

Build a docker image requires a base image on which we write further instructions using specifications in a file called Dockerfile. Building an image often involves starting from a base image. From this base image, we can install required libraries, copy our source code and perform any other required operations, e.g., source compilations to generate an executable. Finally, we save the updated image with a new name and this image can be run as a docker container later on. Please see [docker](https://docs.docker.com/engine/reference/builder/) for more details. 

We are going to build two docker images for the **hello-world** project. The two images illustrate one of many ways to use docker containers.

In the first image, we build the container to load the hello-world project and
drop us in a repl with the package initialized such that we can run the
**greet-user** function. In the second case, we setup up the image so when the container is run, it presents the greeting to standard output and then exits.

##
Running Docker Container

## Installation

## Author

* jeosol (jeronwunalu@gmail.com)

## Copyright

* Copyright(c) 2021 jeosol (jeronwunalu@gmail.com)


## License

* Copyright 2021 jeosol Released under the MIT License [http://opensource.org/licenses/mit-license.php](http://opensource.org/licenses/mit-license.php)
