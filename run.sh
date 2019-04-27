if [ 0 ]; then
	docker build -t yijun/fast:apk_builder builder
	docker push yijun/fast:apk_builder
fi
make build
make fast
make upload
