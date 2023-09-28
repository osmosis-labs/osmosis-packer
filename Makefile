build:
	packer build marketplace-image.json

update_mainnet:
	@echo "Usage make update_mainnet version=19.3.0"
	sed -i 's/\(MAINNET_VERSION="\)[^"]*"/\1$(version)"/' files/join.sh
	sed -i 's/\(MAINNET_VERSION="\)[^"]*"/\1$(version)"/' scripts/01-osmosis.sh

	sed -i 's/\("image_name": "osmosis-v\)[^"]*"/\1$(version)-ubuntu-22-04-{{timestamp}}"/' marketplace-image.json
	sed -i 's/\("application_version": "v\)[^"]*"/\1$(version)"/' marketplace-image.json


update_testnet:
	@echo "Usage make update_testnet version=19.3.0"
	sed -i 's/\(MAINNET_VERSION="\)[^"]*"/\1$(version)"/' files/join.sh
	sed -i 's/\(MAINNET_VERSION="\)[^"]*"/\1$(version)"/' scripts/01-osmosis.sh

	sed -i 's/\("image_name": "osmosis-v\)[^"]*"/\1$(version)-ubuntu-22-04-{{timestamp}}"/' marketplace-image.json
	sed -i 's/\("application_version": "v\)[^"]*"/\1$(version)"/' marketplace-image.json
