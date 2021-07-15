FROM ruby:2.7-alpine

RUN apk add --no-cache git openssh

ENV VERSION=1.8.0
RUN gem install git-pr-release --version ${VERSION} --no-document

VOLUME /root/.ssh /work
WORKDIR /work

ENTRYPOINT ["git-pr-release"]
CMD ["--help"]

