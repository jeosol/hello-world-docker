# Hello-World - Common Lisp Hello World project.
This is a simple Common Lisp (CL) project for testing and demonstrating different software technologies including unit testing, building Docker containers, devops CI/CD, etc.

The project contains a **hello-world** system and another system, **hello-world/tests**, which runs the tests for the system. Currently the application doesn't do much other that print a simple greeting. This is intentional because the focus is not on the system but on how different software concepts are implemented.

## Usage
### Cloning the repository

The repository can be cloned into your **quicklisp/local-projects** directory (as shown below) or another directory where it can be found. The following command clones the repository under the ~/quicklisp/local-projects/ directory:
```
git clone https://github.com/jeosol/hello-world.git ~/quicklisp/local-projects/hello-world
```

### Load
You can start a CL REPL using [SBCL](http://sbcl.org) and then load the hello-world project. SBCL can be started by issuing the ```sbcl``` command in a terminal. The hello-world project can then be loaded using quicklisp as follows:

```
(ql:quicklisp "hello-world")
```

**Note**: that this will only work with SBCL because we used some SBCL especific syntax to read in command line argument passed to the executable (described later).

### Unit Testing and Creating Executables
This section describes unit testing in the project. Testing is performed with the **fiveam** library, which is a commn testing library used by many CL projects. 

A Makefile containing **build** and **test** targets is included in the project folder.

#### Running the **test** target
The project uses the [**fiveam**](https://common-lisp.net/project/fiveam/) regression testing framework. We can run the tests defined in the project using one of the following options:

* **Shell** (from within project directory):
```
make test
```

* **Shell** (from any directory):
```
make -f ~/quicklisp/local-projects/hello-world/Makefile test
```

* **REPL**
```
(asdf:test-system "hello-world")
```

#### Running the **build** target
The build target uses asdf to create an executable named **hello-world** in the **bin** of the project. We can create the executable artifact using one of the following options:

* **Shell** (from within project directory):
```
make build
```

* **Shell** (from any directory):
```
make -f ~/quicklisp/local-projects/hello-world/Makefile build
```

* **REPL**:
```
(asdf:make "hello-world")
```

After running the above command, the executable **hello-world** can be found in the **bin** folder. 
Please see the **hello-world.asd** file for the [**ASDF**](https://common-lisp.net/project/asdf/) keywords facilitates creating executables.


#### Run the executable
In this section, we describe how to run the executable **hello-world**. The executable expects a string which represents a name, e.g., Bond. If no name is provided, then the default string **John** is used. The executable outputs the string "Hello <name>!".

So if we run the executable as:
```
./hello-world
```
the output is
```
Hello John!
```

If we pass a name, e.g., Bond, as argument:
```
./hello-world Bond

```
the output is
```
Hello Bond!
```

## Docker containers

## Installation

## Author

* jeosol (jeronwunalu@gmail.com)

## Copyright

* Copyright(c) 2021 jeosol (jeronwunalu@gmail.com)


## License

* Copyright 2021 jeosol Released under the MIT License [http://opensource.org/licenses/mit-license.php](http://opensource.org/licenses/mit-license.php)
