DDEV := $(shell command -v ddev 2> /dev/null)

DDEV_CONFIGURED := $(shell command ddev describe 2> /dev/null)

DDEV_DB ?= $(shell bash -c 'read -p "Database version [mariadb:10.6]" tmp; echo $${tmp:-mariadb:10.6}')
DDEV_PHP ?= $(shell bash -c 'read -p "PHP version [8.1]" tmp; echo $${tmp:-8.1}')
DDEV_NODE ?= $(shell bash -c 'read -p "Node version [18]" tmp; echo $${tmp:-18}')
DDEV_TLD ?= $(shell bash -c 'read -p "Domain tld [test]" tmp; echo $${tmp:-test}')

DDEV_NAME := $(shell echo $$(TMP=$$(basename $(CURDIR)); echo $${TMP%.*}))

ddev:
ifndef DDEV
	$(error 🙀 Ddev is not available, install it first!)
endif
ifndef DDEV_CONFIGURED
	@echo "\033[95m🪄 Setting up dev environment...\033[0m"
	@ddev config \
		--database=$(DDEV_DB) \
		--project-type=php \
		--php-version=$(DDEV_PHP) \
		--nodejs-version=$(DDEV_NODE) \
		--project-name=$(DDEV_NAME) \
		--project-tld=$(DDEV_TLD)
	@ddev get drud/ddev-cron
endif
	@echo "\033[95m🚀 Dev environment is configured, go to lightspeed!\033[0m"
	@ddev start

clean:
	@echo "\033[95m🧹 Cleaning project...\033[0m"
	@git init -q
	@git add .
	@git clean -e .env -e public/app/themes/* -xdfq && rm -rf vendor
