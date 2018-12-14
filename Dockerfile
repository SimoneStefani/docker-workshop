FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /kth-app

WORKDIR /kth-app

COPY Gemfile /kth-app/Gemfile
COPY Gemfile.lock /kth-app/Gemfile.lock

RUN bundle install

COPY . /kth-app

EXPOSE 8000

CMD ["rails", "server", "-p", "8000", "-b", "0.0.0.0"]