FROM kapone89/docker-rbenv:raw

ENV RUBY_VERSION "2.4.2"
RUN rbenv install $RUBY_VERSION
RUN rbenv global $RUBY_VERSION
RUN gem install bundler
RUN rbenv rehash
