IMAGE_NAME = s2i-jdk8

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .
	docker push $(IMAGE_NAME)

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
