FROM debian:12

RUN apt-get update -yq && apt-get install hugo git -y

ENV HUGO_BASEURL http://localhost:1313
ENV UID 1000
ENV GID 1000
ENV PORT 1313
ENV INIT_SITE 1

RUN addgroup --system hugo --gid ${GID} && adduser --system -u ${UID} --gid ${GID} hugo 
RUN mkdir /sites && chown -R ${UID}:${GID} /sites
COPY ./entrypoint.sh /entrypoint.sh

USER hugo
WORKDIR /sites
EXPOSE 1313
ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
