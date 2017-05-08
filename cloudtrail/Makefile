.PHONY: converge verify destroy test kitchen
TERRAFORM_SPEC_VERSION := 0.8.8-1

define execute
	if [ -z "$(CI)" ]; then \
		docker run --rm -it \
			-e AWS_PROFILE=$(AWS_PROFILE) \
			-e AWS_REGION=$(AWS_REGION) \
			-e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
			-e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
			-e USER=$(USER) \
			-v $(shell pwd):/module \
			-v $(HOME)/.aws:/root/.aws:ro \
			-v $(HOME)/.netrc:/root/.netrc:ro \
			johnrengelman/terraform-spec:$(TERRAFORM_SPEC_VERSION) \
			kitchen $(1) $(KITCHEN_OPTS); \
	else \
		echo bundle exec kitchen $(1) $(KITCHEN_OPTS); \
		bundle exec kitchen $(1) $(KITCHEN_OPTS); \
	fi;
endef

converge:
	@$(call execute,converge)

verify:
	@$(call execute,verify)

destroy:
	@$(call execute,destroy)

test:
	@$(call execute,test)

kitchen:
	@$(call execute,$(COMMAND))

