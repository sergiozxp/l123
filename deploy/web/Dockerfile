FROM ubuntu:24.04
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends libfontconfig1 ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && groupadd --gid 10001 l123 \
 && useradd --uid 10001 --gid 10001 --no-create-home --home-dir /work --shell /usr/sbin/nologin l123
COPY target/release/l123 /usr/local/bin/l123
RUN chmod 0555 /usr/local/bin/l123 && mkdir /work && chown 10001:10001 /work
USER 10001:10001
WORKDIR /work
ENV HOME=/work
ENV TERM=xterm-256color
ENTRYPOINT ["/usr/local/bin/l123"]
