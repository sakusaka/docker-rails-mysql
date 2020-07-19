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

# install node 10.x
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs \
    && apt-get clean

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install


#EXPOSE 3000
#CMD ["rails", "server", "-b", "0.0.0.0"]