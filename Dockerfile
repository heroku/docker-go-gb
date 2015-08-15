FROM heroku/cedar:14

RUN mkdir -p /app/user && \
    mkdir -p /app/.cache/gotools && \
    mkdir -p /app/.profile.d

WORKDIR /app/user

ENV GOVERSION=1.4.2
ENV STACK "cedar-14"
ENV HOME /app
ENV GOROOT /app/.cache/go
ENV GOPATH /app/.cache/gotools

RUN curl -s --retry 3 -L https://storage.googleapis.com/golang/go$GOVERSION.linux-amd64.tar.gz | tar xz -C /app/.cache
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

RUN go get -v github.com/tools/godep
RUN curl -s --retry 3 -L https://github.com/stedolan/jq/releases/download/jq-1.4/jq-linux-x86_64 -o $GOPATH/bin/jq && \
    chmod a+x $GOPATH/bin/jq

ENV GOPATH /app/user

ENV PATH $GOPATH/bin:$PATH

COPY ./compile /app/.cache/gotools/bin/compile

COPY ./go-docker.sh /app/.profile.d/go-docker.sh

ONBUILD COPY . /app/.temp
ONBUILD RUN /app/heroku/gotools/bin/compile
