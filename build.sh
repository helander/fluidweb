#!/bin/sh

VERSION=1.0

mkdir -p repo

buildPackage() {
   docker build --build-arg="ARCH=${ARCH}" --build-arg="VERSION=${VERSION}" -t build-fluidweb-${ARCH} .
   docker create --name build-fluidweb-${ARCH} build-fluidweb-${ARCH}
   docker cp build-fluidweb-${ARCH}:fluidweb_${VERSION}-1_${ARCH}.deb repo
   docker rm build-fluidweb-${ARCH}
}

ARCH=arm64
buildPackage

ARCH=amd64
buildPackage

cd repo;dpkg-scanpackages -m . | gzip -c > Packages.gz
