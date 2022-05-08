# Build an agent for Java, Python, and Node builds
ARG BASE_IMAGE_NAME=unknown
FROM $BASE_IMAGE_NAME
USER root
RUN apt-get update && \
	apt-get install -y maven && \
	apt-get install -y python3 && \
	apt-get install -y python3-venv && \
	apt-get install -y npm

