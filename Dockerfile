FROM alpine:3.6

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --update --no-cache \
  alpine-sdk \
  bash \
  wget \
  vim \
  linux-headers \
  imagemagick-dev \
  qt-webkit \
  xvfb \
  autoconf \
  bison \
  bzip2 \
  bzip2-dev \
  ca-certificates \
  gdbm-dev \
  glib-dev \
  libffi-dev \
  libxml2-dev \
  libxslt-dev \
  ncurses-dev \
  procps \
  readline-dev \
  yaml-dev \
  postgresql \
  postgresql-client \
  postgresql-dev \
  mysql \
  mysql-client \
  mariadb-dev \
  nodejs \
  tzdata

RUN update-ca-certificates

ENV APP_HOME /app
ENV RBENV_ROOT /rbenv
ENV CONFIGURE_OPTS "--disable-install-doc"
ENV PATH $RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH
ENV RUBY_CFLAGS "-O2"
ENV ac_cv_func_isnan yes
ENV ac_cv_func_isinf yes

RUN mkdir $APP_HOME
RUN mkdir $RBENV_ROOT
WORKDIR $APP_HOME

RUN git clone https://github.com/rbenv/rbenv.git ${RBENV_ROOT}
RUN git clone https://github.com/rbenv/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build
RUN git clone https://github.com/jf/rbenv-gemset.git ${RBENV_ROOT}/plugins/rbenv-gemset
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /root/.bashrc

# enable irb history
RUN echo "require 'irb/ext/save-history'; IRB.conf[:SAVE_HISTORY] = 200; IRB.conf[:HISTORY_FILE] = '/root/.irb-history'" >> /root/.irbrc
