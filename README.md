# artificien_pygrid_fork

The majority of this code is pulled directly from [Pygrid](https://github.com/OpenMined/PyGrid) itself. Any edits made by artificien start with the comment "#START ARTIFICIEN EDIT" and end with the comment "#END ARTIFICIEN EDIT". The code, like the pygrid repo itself, builds a Docker image that can be deployed to the elastic container service (ECS) on the cloud. To test any edits you are making to the PyGrid code itself, you can run a local version of the PyGrid server on your computer using this code. To do so, follow these steps:

1. Install node
2. Install poetry (a `pip` package)
3. Install `Docker` and `docker-compose`
4. Start the Docker engine
5. Head over to the `./postgres-start` subdirectory of this repo, and run `docker-compose up -d`. This will start a postgres database on your machine, which PyGrid needs in order to function properly.
6. If you can't manage to get docker working, look online for instructions to start postgres without docker. You will likely have to install postgres.
7. Head back to the top-level directory of this repo. Run `poetry install`
8. Finally, from the top-level directory in this repo, run `./run_local.sh`.
9. You should soon see PyGrid running on port 5000 of your machine.
10. When you are done testing, simply hit `CTRL-C` to end the PyGrid job. Then head back to the `postgres-start` directory, and run `docker-compose down`.


Ideally, you should also test that the Docker build of your newly editied pygrid code succeeds. To do this, run `docker build -t my-pygrid .`, and make sure the build goes through successfully. This repo is set up to auto-push this image to DockerHub, so that we always have the latest copy accessible to us on the internet. You can view the process and messages associated with the Docker image build process and push to Dockerhub on the Github Actions tab of this repo. You can obtain the pushed image online at [Matt Kenney's Dockerhub](`https://hub.docker.com/r/mkenney1/artificien_pygrid_).
