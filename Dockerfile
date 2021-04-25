# syntax=docker/dockerfile:1
FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir -p /usr/src/test-app
WORKDIR /test-app
COPY Gemfile /test-app/Gemfile
COPY Gemfile.lock /test-app/Gemfile.lock
RUN bundle install
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