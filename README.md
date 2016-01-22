# Heroku Go Docker image using [GB](https://github.com/constabulary/gb)

For use with the [heroku docker plugin](https://github.com/heroku/heroku-docker).

## Image tags

You can see all of the tags [here](https://hub.docker.com/r/heroku/go-gb/tags/).

The `latest` tag will generally refer to the latest, possibly unsupported,
release of [Go](https://golang.org/dl), including betas and release candidates.

Once a final version is cut a separate tag will be used and updated.

## App.json

**Note: Please read the official documentation [here](https://devcenter.heroku.com/articles/docker)**.

To use this image with the heroku docker plugin specify this image in your
application's `app.json` file like so:

```json
{
  "image": "heroku/go-gb:<major go version or `latest`>",
}
```

Then run `heroku docker:init` in your application's directory. This will create
both  `Dockerfile` and `docker-compose.yml` files.

### Example app.json

Source can be found [here](https://github.com/heroku-examples/go-websocket-chat-demo-gb/blob/master/app.json).

```json
{
  "name": "Go Websocket Chat Demo",
  "description": "Go websocket chat demo application.",
  "keywords": [
    "streaming",
    "redis",
    "go"
  ],
  "image": "heroku/go-gb:1.5",
  "website": "http://github.com/heroku-examples/go-websocket-chat-demo",
  "repository": "http://github.com/heroku-examples/go-websocket-chat-demol",
  "scripts": {},
  "addons": [
    "heroku-redis"
  ]
}
```

## Slug Size

The images are large but the slugs created by `heroku docker:release` only
include your application's code, dependencies & compiled binaries so should be
relatively small.
