#!/bin/sh

# Dockerfileに条件分岐は入れられないので、shellに外だし
if [ "${RAILS_ENV}" = "production" ]
# 本番のみrailsのコマンドを実行したい
then
    bundle exec rails assets:precompile
fi

bundle exec rails s -p ${PORT:-3000} -b 0.0.0.0