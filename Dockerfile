# syntax=docker/dockerfile:1
FROM ruby:2.6.5
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client

RUN mkdir -p /usr/src/test-app
WORKDIR /test-app
COPY Gemfile /test-app/Gemfile
COPY Gemfile.lock /test-app/Gemfile.lock
RUN bundle install
RUN yarn install
# Copy app files
RUN mkdir -p /usr/src/test-app/tmp/pids
ADD . /usr/src/test-app/
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]