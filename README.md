# Go Docker image

For use with the [heroku-docker](https://github.com/heroku/heroku-docker) cli plugin.

app.json requirements ATM:

```json
{
  ...
  "image": "heroku/go:latest",
  "mount_dir": "src/<go package name; eg github.com/heroku-examples/go-websocket-chat-demo>",
  ...
}
```
