FROM ruby:2.5.1
 
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
 
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano 
 
ENV INSTALL_PATH /exchange
 
RUN mkdir -p $INSTALL_PATH
 
WORKDIR $INSTALL_PATH
 
COPY Gemfile ./
 
ENV BUNDLE_PATH /gems
 
COPY . .