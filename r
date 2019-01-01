#docker run --rm --net=dockernet \
#docker run --rm --add-host="localhost:192.168.1.65" \
docker run --rm --security-opt seccomp=unconfined \
		-w /work/testing/fast -ti \
                -v $(pwd)/fast/user.abuild/:/home/packager/.abuild \
                -v $(pwd)/aports:/work \
		-v ${PWD}/fast/target:/repo \
                -v $(pwd)/fast/target:/target \
		-v ${HOME}/Documents/bitbucket.org/yijunyu/fast/.git:/work/testing/fast/.git:ro \
		apk_builder:yijun sh
