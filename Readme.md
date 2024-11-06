# Template creation symfony project with docker

## Prerequisites
- Docker
- Docker-compose
- Make

## Installation
1. Clone the repository
2. Run 'make build' to build the docker image
3. Run 'make init-project' to install the symfony project
4. Run 'make init-db' to install the postgres database and doctrine

## Usage
- Run 'make start' to start the project
- Run 'make stop' to stop the project
- Run 'make prune' to remove the project
- Run 'make build' to build the project