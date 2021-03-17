FROM jupyter/datascience-notebook:latest
RUN pip --no-cache-dir install --quiet artificienlib
RUN pip --no-cache-dir install --quiet tornado jupyter jupyterlab pip PyJWT==1.7.1
ENV JUPYTER_ENABLE_LAB yes
# COPY --chown=$NB_USER:$NB_GID /notebooks /home/jovyan/work
