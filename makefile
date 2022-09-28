DDEV := $(shell command -v ddev 2> /dev/null)

DDEV_CONFIGURED := $(shell command ddev describe 2> /dev/null)

DIR_BASENAME := $(shell echo $$(TMP=$${PWD##*/}; echo $${TMP%.*};))

dev:
ifndef DDEV
	$(error 🙀 Ddev is not available, install it first!)
endif
ifndef DDEV_CONFIGURED
	@echo "\033[95m🪄 Setting up dev environment...\033[0m"
	@ddev config \
		--database=mariadb:10.6 \
		--project-type=php \
		--php-version=8.1 \
		--nodejs-version=18 \
		--project-name=$(DIR_BASENAME) \
		--project-tld=test
	@ddev get drud/ddev-cron
endif
	@echo "\033[95m🚀 Dev environment is configured, go to lightspeed!\033[0m"
	@ddev start

clean:
	@echo "\033[95m🧹 Cleaning project...\033[0m"
	@git clean -e .env -e public/app/themes/* -xdfq && rm -rf vendor
