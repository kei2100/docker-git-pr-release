docker-git-pr-release
====

docker image for [git-pr-release gem](https://rubygems.org/gems/git-pr-release)

```
docker pull kei2100/git-pr-release

docker run -v <YOUR GIT SSH CONFIG AND KEY DIR>:/root/.ssh \
           -v <YOUR GIT REPO DIR>:/work \
           -e 'GIT_PR_RELEASE_TOKEN=<YOUR GITHUB TOKEN>' \
           -e 'GIT_PR_RELEASE_BRANCH_STAGING=<e.g. staging>' \
           -e 'GIT_PR_RELEASE_BRANCH_PRODUCTION=<e.g. production>' \
           kei2100/git-pr-release      # default show help

           # kei2100/git-pr-release -- # execute
```

