-include dev/ddev.conf

DDEV := $(shell command -v ddev 2> /dev/null)

DDEV_CONFIGURED := $(shell command ddev describe 2> /dev/null)

DIR_BASENAME := $(shell basename $(CURDIR))

ddev:
ifndef DDEV
	$(error 🙀 Ddev is not available, install it first!)
endif
ifndef DDEV_CONFIGURED
	@echo "\033[95m🪄 Setting up dev environment...\033[0m"
	@ddev config \
		--database=$(DB) \
		--project-type=php \
		--php-version=$(PHP) \
		--nodejs-version=$(NODE) \
		--project-name=$(DIR_BASENAME) \
		--project-tld=$(TLD)
	@ddev get drud/ddev-cron
endif
	@echo "\033[95m🚀 Dev environment is configured, go to lightspeed!\033[0m"
	@ddev start

clean:
	@echo "\033[95m🧹 Cleaning project...\033[0m"
	@git init -q
	@git add .
	@git clean -e .env -e public/app/themes/* -xdfq && rm -rf vendor
