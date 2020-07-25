FROM ruby:2.7.1

# install tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update \
    && apt-get -y install yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN yarn add --dev webpack-dev-server

# install node 10.x
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs \
    && apt-get clean

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

#EXPOSE 3000
#CMD ["rails", "server", "-b", "0.0.0.0"]