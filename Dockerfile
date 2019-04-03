FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV SOURCE_HOME .
ENV APP_HOME /src
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV REDIS_URL redis

COPY $SOURCE_HOME $APP_HOME
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
# Add bundle entry point to handle bundle cache

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
