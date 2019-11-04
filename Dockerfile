FROM ruby:2.6.5
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
 && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install mysql2 -v '0.5.2' --source 'https://rubygems.org/' -- --with-cppflags=-I/usr/local/opt/openssl/include --with-ldflags=-L/usr/local/opt/openssl/lib
RUN bundle update
RUN bundle install --path=vendor/bundle

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME