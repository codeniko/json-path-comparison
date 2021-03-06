FROM ubuntu:20.10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y upgrade && apt-get -y update && apt-get -y dist-upgrade \
        && apt-get install -y --no-install-recommends bash ninja-build python3 markdown curl coreutils locales \
        && locale-gen en_US.UTF-8

# Golang
RUN apt-get install -y --no-install-recommends golang-go git

# Rust
RUN apt-get install -y --no-install-recommends cargo

# PHP
RUN apt-get install -y --no-install-recommends php php-intl php-tokenizer composer

# JavaScript
RUN apt-get install -y --no-install-recommends nodejs npm unzip

# Java + Clojure + Kotlin
RUN apt-get install -y --no-install-recommends openjdk-11-jdk maven

# Perl
RUN apt-get install -y --no-install-recommends perl make wget

# C
RUN apt-get install -y --no-install-recommends gcc libjson-glib-dev

# Haskell
# Get newest cabal outside of Ubuntu channel
RUN apt-get install -y --no-install-recommends ghc xz-utils \
        && curl -L https://downloads.haskell.org/~cabal/cabal-install-3.2.0.0/cabal-install-3.2.0.0-x86_64-unknown-linux.tar.xz -o cabal-install.tar.xz \
        && tar -xf cabal-install.tar.xz \
        && mv cabal /usr/local/bin/ \
        && rm cabal-install.tar.xz

# Erlang
# rebar3 as pkg only found in alpine:edge
RUN apt-get install -y --no-install-recommends erlang erlang-crypto erlang-asn1 erlang-public-key erlang-ssl erlang-dev g++ \
        && curl -L https://s3.amazonaws.com/rebar3/rebar3 -o /usr/local/bin/rebar3 && chmod +x /usr/local/bin/rebar3

# Python
RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && python3 /tmp/get-pip.py

# .NET
ENV PATH="/root/.dotnet:${PATH}"
ENV DOTNET_ROOT="/root/.dotnet"
RUN curl -OL https://dotnetwebsite.azurewebsites.net/download/dotnet-core/scripts/v1/dotnet-install.sh \
        && chmod a+x dotnet-install.sh && ./dotnet-install.sh

# Elixir
RUN apt-get install -y --no-install-recommends elixir && mix local.hex --force

# Bash
RUN apt-get install -y --no-install-recommends sed grep gawk

# Objective-C
RUN apt-get install -y --no-install-recommends build-essential cmake clang libblocksruntime-dev libicu-dev libdispatch-dev
ADD installObjectiveC.sh /tmp/installObjectiveC.sh
RUN chmod a+x /tmp/installObjectiveC.sh
RUN /tmp/installObjectiveC.sh

# Raku
RUN curl -L https://rakudo.org/downloads/star/rakudo-star-2020.01.tar.gz -o rakudo-star.tar.gz \
        && tar -xzf rakudo-star.tar.gz && rm rakudo-star.tar.gz && \
        cd rakudo-star-* && perl Configure.pl --gen-moar --make-install --prefix ~/rakudo
ENV PATH="/root/rakudo/share/perl6/site/bin:/root/rakudo/bin:${PATH}"
