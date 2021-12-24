# base with ruby and nodejs step
FROM ruby:2.7.1-alpine3.10 AS base

RUN apk add --repository https://dl-cdn.alpinelinux.org/alpine/v3.10/main/ --no-cache \
    "nodejs<12" \
    "nodejs-npm<12" \
    yarn

RUN set -eux; \
	apk add --no-cache \
		tzdata \
		postgresql-dev \
	;

RUN addgroup -g 1000 app \
    && adduser -u 1000 --ingroup app --shell /bin/false --disabled-password --home /home/app app 


# builder with dev tools
FROM base AS builder

RUN set -eux; \
	apk add --no-cache \
		shared-mime-info \
		build-base \
	;

ENV HOME=/home/app
USER app

# COPY --chown=app:app Gemfile $HOME/web/
COPY --chown=app:app Gemfile Gemfile.lock $HOME/web/
WORKDIR $HOME/web
RUN bundle


# final image from base with builder binary
FROM base

ENV HOME=/home/app
USER app
WORKDIR $HOME/web

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0"]

COPY --chown=app:app . $HOME/web/

# ENV RAILS_ENV=production
# ENV SECRET_KEY_BASE="enter_your_secret"
# RUN bundle exec rake assets:precompile