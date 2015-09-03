FROM heroku/go-base:1.4.2

RUN mkdir -p /app/.cache/gotools /app/.profile.d

ENV GOPATH /app/.cache/gotools
ENV PATH /app/user/bin:$GOPATH/bin:$PATH

RUN go get -v github.com/constabulary/gb/...

COPY ./go-gb-docker.sh /app/.profile.d/go-gb-docker.sh

ONBUILD COPY . /app/user
ONBUILD RUN gb info && \
            gb build
