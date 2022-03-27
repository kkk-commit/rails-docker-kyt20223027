FROM ruby:2.7

ENV RAILS_ENV=production

# js関連のライブラリをインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn
WORKDIR /app
COPY ./src /app

# ruby関連のライブラリをインストール
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install

# 外だししたshellの条件分岐に応じて処理実行
COPY start.sh /start.sh
# 実行権限付与
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
