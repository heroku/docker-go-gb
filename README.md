# Heroku Go Docker image using [GB](https://github.com/constabulary/gb)

For use with the [heroku docker
plugin](https://github.com/heroku/heroku-docker).

## App.json

**Note: Please read the official documentation
[here](https://devcenter.heroku.com/articles/docker)**.

To use this image with the heroku docker plugin specify this image in your
application's `app.json` file like so:

```json
{
  "image": "heroku/go-gb:<go version or latest>",
}
```

Then run `heroku docker:init` in your application's directory. This will create
both  `Dockerfile` and `docker-compose.yml` files.

### Example app.json

Source can be found
[here](https://github.com/heroku-examples/go-websocket-chat-demo-gb/blob/master/app.json).

```json
{
  "name": "Go Websocket Chat Demo",
  "description": "Go websocket chat demo application.",
  "keywords": [
    "streaming",
    "redis",
    "go"
  ],
  "image": "heroku/go-gb:1.4.2",
  "website": "http://github.com/heroku-examples/go-websocket-chat-demo",
  "repository": "http://github.com/heroku-examples/go-websocket-chat-demol",
  "scripts": {},
  "addons": [
    "heroku-redis"
  ]
}
```
