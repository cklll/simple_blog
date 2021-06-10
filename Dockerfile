FROM ruby:2.7.2-alpine

RUN apk --update add build-base nodejs yarn tzdata postgresql-dev postgresql-client shared-mime-info

WORKDIR /opt/app

COPY Gemfile /opt/app/Gemfile
COPY Gemfile.lock /opt/app/Gemfile.lock

RUN bundle install
COPY . /opt/app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]
