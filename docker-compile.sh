#!/bin/sh

apt-get update

apt-get install -y --no-install-recommends tree \
  libmodule-build-perl \
  libtest-exception-perl \
  libtest-pod-perl \
  libplack-perl \
  libplack-middleware-crossorigin-perl \
  libyaml-perl \
  libtype-tiny-perl \
  libjson-maybexs-perl \
  libhash-merge-perl \
  libhttp-message-perl \
  libmoose-perl \
  libmoosex-types-perl \
  liblog-dispatch-perl

cd /usr/local/src

cp -r /work/* .

perl ./Build.PL

./Build installdeps

./Build

./Build test

./Build manifest

./Build dist

cp *.tar.gz /work/

cd blib

tar -cvzf /work/Raisin-0.93_delta.tar.gz \
 lib/Raisin.pm \
 lib/Raisin/API.pm \
 lib/Raisin/Encoder/JSON.pm \
 lib/Raisin/Middleware/Formatter.pm \
 lib/Raisin/Param.pm

