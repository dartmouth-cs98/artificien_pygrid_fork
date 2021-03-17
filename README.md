# artificien_pygrid_fork

This repocontains the Pygrid code, along with all of Artificien's modifications to it. PyGrid is the backend service we use to faciliate machine learning. It is the place that all new models get sent to, the place where IOS devices pull down models to train from, and the place where model's are iteratively updated and improved *a la* federated learning. 

## Architecture

The changes we've made from the standard Pygrid are mainly these 2:

1. We've made it so that all of the Pygrid nodes we launch as an organization all connect to the same, serverless AWS Aurora PostgreSQL database. This means that our I/O is virtually unlimited, since this serverless database scales wtih demand (both resolution speed and storage).
2. We've made it so that the Pygrid nodes that we launch notify our master node about model progress (i.e. how close a model is to done training) every time a model completes a training cycle.

The vast majority of this code is pulled directly from [Pygrid](https://github.com/OpenMined/PyGrid) itself. Any edits made by artificien start with the comment "#START ARTIFICIEN EDIT" and end with the comment "#END ARTIFICIEN EDIT".

## Setup/ Usage

To test any edits you are making to the PyGrid code itself, you can run a local version of the PyGrid server on your computer using this code. To do so, follow these steps:

### Either Method
1. Make sure your AWS credentials are set up

### With `docker`, and `docker-compose` installed

1. `cd ./local-pygrid`
3. `docker compose up`. After everything starts running, you should find PyGrid running on `localhost:5000`. You should also find our master node running at `localhost:5001`.
4. Using the logs in your terminal, find the jupyterlab URL, and click it to enter jupyter lab. You can interact with your local stack from this jupyter lab instance, which has the artificien library (`artificienlib`) preinstalled and ready to go for testing purposes.
6. run `docker compose down` in the `local-pygrid` directory, once you are done testing

### Without Docker

1. Install node
2. Install poetry (a `pip` package)
3. Start a postgres database on your machine, which PyGrid needs in order to function properly. You'll have to install and start postgres to do this. Make the password `abadpassword` and the username `pygridUser`
4. Head back to the top-level directory of this repo. Run `poetry install`
5. Finally, from the top-level directory in this repo, run `./run_local.sh`.
6. You should soon see PyGrid running on port 5000 of your machine.
7. Head to the `model-upload` section of this nodebook, start a `jupyter` notebook running, and run the notebook there to upload a new model to your local pygrid.
8. When you are done testing, simply hit `CTRL-C` to end the PyGrid job. You may also want to kill your Postgres Server

Ideally, when testing new changes, you should also test that the Docker build of your newly editied pygrid code succeeds. To do this, run `docker build -t my-pygrid .`, and make sure the build goes through successfully. Alternatively, you can use the `docker`-based test method to get PyGrid running locally, shown above. 


## Deployment
The code, like the pygrid repo itself, builds a Docker image that can be deployed to the elastic container service (ECS) on the cloud. Every time this code is changed, a Github Action is triggered, which in turn builds and publishes the new Docker image.

## Authors
- Matt Kenney
