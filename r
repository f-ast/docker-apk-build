docker run -w /work/testing/fast -ti \
                -v $(pwd)/fast/user.abuild/:/home/packager/.abuild \
                -v $(pwd)/aports:/work \
                -v $(pwd)/fast/target:/target \
                apk_builder:yijun \
                sh
