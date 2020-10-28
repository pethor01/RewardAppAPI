
FROM ruby:2.7-alpine
ARG RAILS_ROOT=/reward_app_api
ARG PACKAGES="bash build-base tzdata postgresql-dev postgresql-client nodejs "
# ENV RAILS_ENV=production

RUN mkdir $RAILS_ROOT

WORKDIR $RAILS_ROOT
# install packages
RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $PACKAGES

COPY Gemfile* ./
RUN bundle install 
    # Remove unneeded files (cached *.gem,
COPY . .

# # Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

#######

# RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && update-alternatives --install /usr/bin/pg_dump pg_dump /usr/lib/postgresql/11/bin/pg_dump 1
# RUN mkdir /reward_app_api
# WORKDIR /reward_app_api
# COPY Gemfile*  ./
# RUN bundle install

# COPY . /reward_app_api


# # Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]


