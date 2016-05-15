FROM mhart/alpine-node:6
MAINTAINER Jimmy Fung @Psisous

RUN apk upgrade --update \
  && apk add --no-cache python \
  && apk add --no-cache libatomic readline readline-dev libxml2 libxml2-dev \
    ncurses-terminfo-base ncurses-terminfo \
    libxslt libxslt-dev zlib-dev zlib \
    ruby ruby-dev yaml yaml-dev \
    libffi-dev build-base \
    ruby-io-console ruby-irb ruby-json ruby-rake \
  && gem install --no-document redcarpet kramdown maruku rdiscount RedCloth liquid pygments.rb sass safe_yaml \
  && gem install --no-document jekyll -v 2.5 \
  && gem install --no-document jekyll-paginate jekyll-sass-converter jekyll-sitemap jekyll-feed jekyll-redirect-from \
  && npm install surge -g \
  && npm cache clean \
  && rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
  && apk del build-base zlib-dev ruby-dev readline-dev \
    yaml-dev libffi-dev libxml2-dev
