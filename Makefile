BUILD_ID ?= yijun #${USER}

.PHONY: builder
builder:
#	docker build -t apk_builder:${BUILD_ID} builder/
#	docker tag apk_builder yijun/fast:apk_builder
#	docker push yijun/fast:apk_builder

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

#		apk_builder:${BUILD_ID} \
build: builder target aports
	docker run --rm -w /work/testing/fast -ti \
		-v ${PWD}/fast/user.abuild/:/home/packager/.abuild \
		-v ${PWD}/aports:/work \
		-v ${PWD}/fast/target:/repo \
		-v ${PWD}/fast/target:/target \
		-v ${HOME}/.gitconfig/:/home/packager/.gitconfig \
		-v ${HOME}/Documents/bitbucket.org/yijunyu/fast/.git:/work/testing/fast/.git:ro \
		yijun/fast:apk_builder
		sh ./p

.PHONY: tester
tester:
	docker build -t apk_testing:${BUILD_ID} testing/

test: tester target
	docker run --rm -ti \
		-v ${PWD}/fast/target:/repo \
		-v ${PWD}/fast/user.abuild/:/home/abuild/ \
		--privileged \
		apk_testing:${BUILD_ID}

faster: target
#	docker build -t fast:${BUILD_ID} fast/
#	docker tag fast:${BUILD_ID} yijun/fast:base
#	docker push yijun/fast:base

fast2: target
	docker build -t fast-pytorch:${BUILD_ID} fast-pytorch/

fast: faster
	docker build -t fast:exe exe/
	docker tag fast:exe yijun/fast

upload: fast
	docker push yijun/fast
