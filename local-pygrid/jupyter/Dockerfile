FROM jupyter/datascience-notebook:latest
RUN pip --no-cache-dir install --quiet artificienlib
RUN pip --no-cache-dir install --quiet tornado jupyter jupyterlab
ENV JUPYTER_ENABLE_LAB yes
COPY /notebooks /home/jovyan/work
