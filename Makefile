BUILD_ID ?= yijun #${USER}

target:
	mkdir -p fast/target

aports:
	git clone https://github.com/yijunyu/aports
	cd aports && git checkout fast

.PHONY: aports_update
aports_update: aports
	GIT_DIR=aports/.git git fetch origin -p
	GIT_DIR=aports/.git git pull origin master

fast/user.abuild:
	mkdir -p fast/user.abuild

build: target aports
	docker run --rm -w /work/testing/fast -ti \
		-v ${PWD}/fast/user.abuild/:/home/packager/.abuild \
		-v ${PWD}/aports:/work \
		-v ${PWD}/fast/target:/repo \
		-v ${PWD}/fast/target:/target \
		-v ${HOME}/.gitconfig/:/home/packager/.gitconfig \
		-v ${HOME}/Documents/bitbucket.org/yijunyu/fast/.git:/work/testing/fast/.git:ro \
		yijun/fast:apk_builder \
		sh ./p

faster: target
	docker build -t yijun/fast:base fast/
	docker push yijun/fast:base

fast: faster
	docker build -t yijun/fast exe/

theia2: faster
	docker build -t yijun/theia theia/
	docker push yijun/theia

theia: faster
	cp fast/target/testing/* fast-ubuntu/
	docker build -t yijun/theia fast-ubuntu/
#	docker push yijun/theia

gitpod: faster
	docker build -t yijun/gitpod:fast gitpod/
	docker push yijun/gitpod:fast

docker: faster
	docker build -t yijun/gitpod:docker docker/
	docker push yijun/gitpod:docker

upload: fast
	docker push yijun/fast
