#!/bin/bash
docker build -t coolhva/sym-sac-demo .
docker rm sym-sac-demo && docker run -it --name sym-sac-demo -p 8001-8002:8001-8002 coolhva/sym-sac-demo
