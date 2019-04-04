FROM ruby:2.4.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client  

# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    apt-get install nodejs    




RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock



RUN bundle install




COPY . /app

# Add a script to be executed every time the container starts.
## COPY entrypoint.sh /usr/bin/
## RUN chmod +x /usr/bin/entrypoint.sh
## ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3088

# Start the main process.
## CMD ["rails", "server", "-b", "0.0.0.0"]
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
