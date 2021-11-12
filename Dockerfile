# set the base image
FROM tdba/simapi:sbcl_2.1.10 as base-image

# COPY the source code
COPY hello-world /root/quicklisp/local-projects/hello-world

# copy the scripts 
COPY create-hello-world-core.lisp .
COPY create-hello-world-core.sh .
COPY start-hello-world-repl.sh .

# make the scripts executable
RUN chmod +x ./create-hello-world-core.sh
RUN chmod +x ./start-hello-world-repl.sh

# run script to create hello-world.core file
RUN ./create-hello-world-core.sh

# set the startup script when we run the container
ENTRYPOINT ["./start-hello-world-repl.sh"]

