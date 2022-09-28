DDEV := $(shell command -v ddev 2> /dev/null)

DDEV_CONFIGURED := $(shell command ddev describe 2> /dev/null)

DIR_BASENAME := $(shell echo $$(TMP=$${PWD##*/}; echo $${TMP%.*};))

dev:
ifndef DDEV
	$(error "🙀 Ddev is not available, install it first!")
endif
ifndef DDEV_CONFIGURED
	@echo "🪄 Setting up dev environment"
	@ddev config \
		--database=mariadb:10.6 \
		--project-type=php \
		--php-version=8.1 \
		--project-name=$(DIR_BASENAME) \
		--project-tld=test
endif
	@echo "🚀 Dev environment is configured, go to lightspeed!"

clean:
	@echo "🧹 Cleaning project..."
	@git clean -e .env -e public/app/themes/* -xdfq && rm -rf vendor
