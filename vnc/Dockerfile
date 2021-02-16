FROM thewtex/opengl

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get upgrade -y \
    && apt-get -y clean

COPY build-files/xdummy.conf build-files/xhost.conf /etc/supervisor/conf.d/
RUN rm /etc/supervisor/conf.d/graphical-app-launcher.conf

EXPOSE 6000
