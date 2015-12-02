FROM heroku/go-base:1.5.1

RUN mkdir -p /app/.cache/gotools /app/.profile.d

ENV GOPATH /app/.cache/gotools
ENV PATH /app/user/bin:$GOPATH/bin:$PATH
ENV GBVERSION v0.3.3

RUN mkdir -p $GOPATH/src/github.com/constabulary && \
    cd $GOPATH/src/github.com/constabulary && \
    git clone https://github.com/constabulary/gb.git && \
    cd gb && \
    git checkout $GBVERSION && \
    go install -v ./... && \
    cd $GOPATH && \
    rm -rf src pkg

COPY ./go-gb-docker.sh /app/.profile.d/go-gb-docker.sh

ONBUILD COPY . /app/user
ONBUILD RUN gb info && \
            gb build
