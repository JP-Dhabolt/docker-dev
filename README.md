# docker-dev
This repo contains images used for development environments, primarily around VS Code Remote Containers.  These images
are NOT suitable for running publicly exposed.

To build an image, run `make container label=dirname`, replacing `dirname` with the actual directory name.  You can
also pass in an optional `version=1.2.3`, but by default the version is `manual`.

## go-gl
This image is Debian Bullseye based, and includes libraries needed for OpenGL development in Golang.  The `DISPLAY`
environment variable is set to `vnc:0.0`, which connects it to the vnc sidecar image also in this repo.

## vnc
This image is a sidecar image, intended to act as the display for a container being used for front-end development.
Once the container is up, you can visit [](http://localhost:6080) to view the desktop, including any forwarded graphics
applications.
