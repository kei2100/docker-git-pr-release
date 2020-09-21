IMAGE = kei2100/git-pr-release
USERNAME = kei2100

.PHONY: docker.build
docker.build: docker.init-tag
	docker build -t $(IMAGE) .
	docker tag $(IMAGE):latest $(IMAGE):$(TAG)

.PHONY: docker.push
docker.push: docker.init-password docker.build
	@echo $(PASSWORD) | docker login --username=$(USERNAME) --password-stdin
	docker push kei2100/git-pr-release:$(TAG)

.PHONY: docker.init-tag
docker.init-tag:
ifndef TAG
	$(eval TAG = $(shell \
	  read -p $$'\e[33mPlease enter the TAG name for $(IMAGE)\e[0m: ' val; \
	  echo $${val} \
	))
endif

.PHONY: docker.init-password
docker.init-password:
ifndef PASSWORD
	$(eval PASSWORD = $(shell \
	  read -p $$'\e[33mPlease enter the password for `docker login`\e[0m: ' val; \
	  echo $${val} \
	))
endif

