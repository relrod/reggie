FROM registry.access.redhat.com/ubi7/ubi-minimal
RUN microdnf install -y ruby rubygems \
 && rm -rf /var/cache/yum

COPY . /opt/reggie
WORKDIR /opt/reggie
RUN gem install bundler -v 1.17.3 \
 && bundle \
 && gem sources --clear-all

CMD ["/usr/bin/ruby", "reggie.rb"]
