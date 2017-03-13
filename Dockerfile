FROM swift
MAINTAINER Alban Linard <alban@linard.fr>

ADD   .  /src/swift-exercises
RUN   cd /src/swift-exercises \
  &&  swift build \
  &&  swift test
