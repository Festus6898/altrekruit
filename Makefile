
build:
	flutter build web

deploy: build
	gcloud app deploy
