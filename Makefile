### setup

setup: setup-node-tools setup-swift-tools gen-project setup-ruby-tools

setup-ruby-tools:
	-rbenv install -s
	gem install bundler
	bundle config set path 'vendor/bundle'
	bundle install
	bundle exec pod install --repo-update

setup-swift-tools:
	-swiftenv install -s
	-git clone https://github.com/yonaskolb/Mint.git .mint
	cd .mint ; make
	mint bootstrap

setup-node-tools:
	-nodenv install -s
	npm install

bootstrap: setup register-devices match signing

### test

test:
	bundle exec fastlane scan -s "App $(XCODE_ENVIRONMENT_NAME)"

### generate Xcode project files

gen-project:
	node .gen_xcodegen_file.js
	mint run xcodegen generate

### linter

lint:
	mint run swiftlint

autocorrect:
	mint run swiftlint autocorrect --format

### register device for development ###

register-devices:
	bundle exec fastlane store_devices

### match ###

match:
	bundle exec fastlane produce \
		-u $(APPLE_ID_MAIL_ADDRESS) \
		-a $(APP_ID) \
		--language Japanese \
		--app_name $(APP_NAME) \
		--skip_itc
	bundle exec fastlane match $(MATCH_OPERATION_TYPE) -a $(APP_ID)

delete-match:
	-bundle exec fastlane match nuke $(MATCH_DELETE_TYPE)

### signing ###

signing:
	bundle exec fastlane signing_cer
