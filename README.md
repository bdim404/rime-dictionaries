# rime-dictionaries

Bdim's personal rime dictionaries repo.

## **You should read the [blog](https://blog.bdim.moe/zh/posts/2025-2-28) first!**

## How to use on macOS

**One-click update:** create a new Shortcut, add a "Run Shell Script" action, and paste the content of [macOS-shortcut.sh](./macOS-shortcut.sh).

**Automatic updates:** schedule the script with launchd. Create `~/Library/LaunchAgents/com.yourname.rime-dicts.plist` pointing to the script and load it with `launchctl load`.

## How to use on Debian

```shell
curl -sS https://api.bdim.moe/rime-deploy | bash
```

Or run [rime-deploy.sh](./rime-deploy.sh) directly. For automatic daily updates, deploy the provided [systemd service](./rime-dictionaries.service) and [timer](./rime-dictionaries.timer).
