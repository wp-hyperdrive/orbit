clean:
	@echo "Cleaning project..."
	find public \
		! -path public \
		! -path public/index.php \
		! -path public/wp-config.php \
		! -path public/app \
		! -path '*/.gitkeep' \
		! -path public/app/themes \
		! -path 'public/app/themes/*' \
		! -path public/app/uploads \
		! -path public/app/plugins \
		! -path public/app/mu-plugins \
		! -path public/app/mu-plugins/wp-hyperdrive-motivator.php \

