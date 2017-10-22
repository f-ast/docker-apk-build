BUILD_ID=yijun

.PHONY: builder
builder:
	docker build -t apk_builder:${BUILD_ID} builder/

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

build: builder target aports
	docker run -w /work/testing/fast -ti \
		-v ${PWD}/fast/user.abuild/:/home/packager/.abuild \
		-v ${PWD}/aports:/work \
		-v ${PWD}/fast/target:/target \
		-v ${HOME}/.gitconfig/:/home/packager/.gitconfig \
		apk_builder:${BUILD_ID} \
		sh ./p

.PHONY: tester
tester:
	docker build -t apk_testing:${BUILD_ID} testing/

test: tester target
	docker run -ti \
		-v ${PWD}/fast/target:/repo \
		-v ${PWD}/fast/user.abuild/:/home/abuild/ \
		--privileged \
		apk_testing:${BUILD_ID}

faster:
	docker build -t fast:${BUILD_ID} fast/

fast: faster target
	docker tag fast:yijun yijun/fast
	docker push yijun/fast

tf: fast
	docker build -t tensorflow:${BUILD_ID} tensorflow
	docker run -ti \
		-v ${PWD}/fast/target:/repo \
		-v ${PWD}/fast/user.abuild/:/home/abuild/ \
		--privileged \
		tensorflow:${BUILD_ID}


