FROM openjdk:16-jdk-slim-bullseye

LABEL maintainer="Nate Catelli <ncatelli@packetfire.org>"
LABEL description="A wrapper container for running rr."

ARG UID=1000
ARG RELEASE="1.63"
ARG RELEASE_URL="https://github.com/GuntherRademacher/rr/releases/download/v${RELEASE}/rr-${RELEASE}-java8.zip"
ENV RELEASE_URL=${RELEASE_URL}
ENV RELEASE=${RELEASE}

RUN addgroup --system rr \
    && useradd -g rr -u ${UID} rr

RUN apt-get update \
    && apt-get install -y curl unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/

RUN mkdir /opt/rr \
    && cd /opt/rr \
    && curl -L -o rr_${RELEASE}.zip ${RELEASE_URL}

RUN cd /opt/rr \
    && unzip rr_${RELEASE}.zip \
    && rm rr_${RELEASE}.zip \
    && ls -lah

USER rr
WORKDIR /home/rr

ENTRYPOINT [ "java", "-jar", "/opt/rr/rr.war" ]
