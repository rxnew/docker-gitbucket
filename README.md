# GitBucket on Docker
### Install docker-compose
https://docs.docker.com/compose/install/

### Settings
    $ cp .env.template .env
    $ vi .env # Edit
    $ source set_environments .env

### Build images
    $ docker-compose build

### Run containers
    $ docker-compose up -d