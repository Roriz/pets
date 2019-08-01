FROM ruby:2.6-alpine

ARG RAILS_ENV

ENV RAILS_ENV=$RAILS_ENV

RUN apk add --no-cache build-base ruby-nokogiri postgresql postgresql-dev && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY . .

RUN bundle install

EXPOSE 80/tcp

ENTRYPOINT bin/start
