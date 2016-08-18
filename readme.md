# GitBucket on Docker
### Install docker-compose
https://docs.docker.com/compose/install/

### Settings
    $ cd gitbucket
    $ cp .env.template .env
    $ vi .env # Edit
    $ source set_environments .env

### Build images
    $ cd gitbucket
    $ docker-compose build

### Run containers
    $ cd gitbucket
    $ docker-compose up -d
