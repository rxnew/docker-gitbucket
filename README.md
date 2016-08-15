# GitBucket on Docker
### Install docker-compose
https://docs.docker.com/compose/install/

### Settings
    $ cp env/gitbucket.env.template env/gitbucket.env
    $ vi env/gitbucket.env # Please modify
    $ source set_environments env/gitbucket.env

### Build images
    $ docker-compose build

### Run containers
    $ docker-compose up -d