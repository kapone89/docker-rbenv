FROM alpine:3.6

RUN apk add --update --no-cache \
  bash \
  build-base \
  git \
  wget \
  curl \
  vim \
  linux-headers \
  imagemagick-dev \
  qt-webkit \
  xvfb \
  mysql-client \
  postgresql-client \
  autoconf \
  bison \
  bzip2 \
  bzip2-dev \
  ca-certificates \
  coreutils \
  gcc \
  gdbm-dev \
  glib-dev \
  libc-dev \
  libffi-dev \
  libxml2-dev \
  libxslt-dev \
  make \
  ncurses-dev \
  openssl \
  openssl-dev \
  procps \
  readline-dev \
  tar \
  yaml-dev \
  zlib-dev

RUN update-ca-certificates

ENV RBENV_ROOT /rbenv
ENV APP_HOME /app
ENV CONFIGURE_OPTS "--disable-install-doc"
ENV PATH $RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH
ENV RUBY_CFLAGS "-O2"

RUN mkdir $APP_HOME
RUN mkdir $RBENV_ROOT
VOLUME $APP_HOME
WORKDIR $APP_HOME

RUN git clone https://github.com/rbenv/rbenv.git ${RBENV_ROOT}
RUN git clone https://github.com/rbenv/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /root/.bashrc
