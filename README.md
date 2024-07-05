# fluidweb
Web interface for fluidsynth


* ./build.sh    # Results in packages in the repo sub directory (structured to be used as a repo for apt)

* in case you need other packaging than deb, please modify Dockerfile and build.sh

* to use with apt, copy fluidweb.list to your target's /etc/apt/sources.list.d folder and do apt update

When done, please cleanup docker images on host
* docker rmi build-fluidweb-arm64
* docker rmi build-fluidweb-amd64


