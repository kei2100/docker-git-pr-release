FROM ruby:2.7-alpine

RUN set -ex; \
  apk add --no-cache \
    git \
    openssh \
    su-exec \
    tini \
    ;


ENV VERSION=1.9.0
RUN gem install git-pr-release --version ${VERSION} --no-document

RUN addgroup -g 10001 app && adduser -u 10000 -D -G app app

VOLUME /home/app/.ssh /work
WORKDIR /work

ENTRYPOINT ["tini", "--", "su-exec", "app", "git-pr-release"]
CMD ["--help"]
