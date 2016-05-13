FROM ruby:2.3.1

MAINTAINER Artem Filatov <bind.disney@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y -qq \
    && apt-get install -y -qq --no-install-recommends locales \
    && echo "ru_RU.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen ru_RU.UTF-8 en_US.UTF-8 \
    && dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=ru_RU.UTF-8

ENV LC_ALL ru_RU.UTF-8

COPY . /usr/src/pptx2markdown

WORKDIR /usr/src/pptx2markdown

RUN gem build pptx2markdown.gemspec \
    && gem install pptx2markdown-0.0.1.gem \
    && rm -f pptx2markdown-0.0.1.gem

VOLUME /data

ENTRYPOINT ["pptx2markdown"]

CMD ["help"]
