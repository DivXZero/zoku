FROM ruby:2.3.3

ENV APP_PATH /zoku_base

MAINTAINER Nicholaus Brabant <nicholaus.brabant@gmail.com>

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    libpq-dev

RUN mkdir $APP_PATH
WORKDIR $APP_PATH
ADD . .
RUN bundle install
