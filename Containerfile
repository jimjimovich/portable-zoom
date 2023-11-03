FROM quay.io/toolbx/ubuntu-toolbox:22.04 as portable-zoom

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="Portable Zoom" \
      maintainer="jim@starryhope.com"

COPY ./extra-packages /extra-packages

RUN apt-get update &&   \ 
    apt-get upgrade -y &&  \
    DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        $(cat extra-packages | xargs) && \
    rm -rd /var/lib/apt/lists/*

RUN curl -sSL https://zoom.us/client/latest/zoom_amd64.deb -o /tmp/zoom_setup.deb && \
	dpkg -i /tmp/zoom_setup.deb && \
	apt-get -f install && \
		rm -rf /var/lib/apt/lists/* && \
	rm /tmp/zoom_setup.deb

