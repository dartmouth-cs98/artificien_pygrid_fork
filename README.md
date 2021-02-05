# artificien_pygrid_fork

The majority of this code is pulled directly from [Pygrid](https://github.com/OpenMined/PyGrid) itself. Any edits made by artificien start with the comment "#START ARTIFICIEN EDIT" and end with the comment "#END ARTIFICIEN EDIT". The code, like the pygrid repo itself, builds a Docker image that can be deployed to the elastic container service (ECS) on the cloud. To test any edits you are making to the PyGrid code itself, you can run a local version of the PyGrid server on your computer using this code. To do so, follow these steps:

### With `docker`, and `docker-compose` installed

1. `cd ./local-pygrid`
2. `docker compose up -d`. After everything starts running, you should find PyGrid running on `localhost:5000`.
3. Head to the `model-upload` section of this nodebook, start a `jupyter` notebook running, and run the notebook there to upload a new model to your local pygrid.
4. run `docker compose down` in the `local-pygrid` directory, once you are done.

### Without Docker

1. Install node
2. Install poetry (a `pip` package)
3. Start a postgres database on your machine, which PyGrid needs in order to function properly. You'll have to install and start postgres to do this. Make the password `abadpassword` and the username `pygridUser`
4. Head back to the top-level directory of this repo. Run `poetry install`
5. Finally, from the top-level directory in this repo, run `./run_local.sh`.
6. You should soon see PyGrid running on port 5000 of your machine.
7. Head to the `model-upload` section of this nodebook, start a `jupyter` notebook running, and run the notebook there to upload a new model to your local pygrid.
8. When you are done testing, simply hit `CTRL-C` to end the PyGrid job. You may also want to kill your Postgres Server

Ideally, when testing new changes, you should also test that the Docker build of your newly editied pygrid code succeeds. To do this, run `docker build -t my-pygrid .`, and make sure the build goes through successfully. Alternatively, you can use the `docker`-based test method to get PyGrid running locally, shown above. This repo is set up to auto-push our PyGrid docker image to DockerHub, so that we always have the latest copy accessible to us on the internet. You can view the process and messages associated with the Docker image build process and push to Dockerhub on the Github Actions tab of this repo. You can obtain the published image online at [Matt Kenney's Dockerhub](https://hub.docker.com/r/mkenney1/artificien_pygrid).
