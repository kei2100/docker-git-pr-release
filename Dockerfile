FROM ruby:2.5-alpine

RUN apk add --no-cache git openssh

ENV VERSION=0.6.0
RUN gem install git-pr-release --version ${VERSION} --no-document

VOLUME /root/.ssh /work
WORKDIR /work

ENTRYPOINT ["git-pr-release"]
CMD ["--help"]

