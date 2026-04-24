# rime-dictionaries

Bdim's personal rime dictionaries repo.

## **You should read the [blog](https://blog.bdim.moe/zh/posts/2025-2-28) first!**

## How to use on macOS

Create a new Shortcut, add a "Run Shell Script" action, and paste the content of [macOS-shortcut.sh](./macOS-shortcut.sh). Place it on your desktop or Dock for one-click dictionary updates.

## How to use on Debian

```shell
curl -sS https://api.bdim.moe/rime-deploy | bash
```

Or run [rime-deploy.sh](./rime-deploy.sh) directly. For automatic daily updates, deploy the provided [systemd service](./rime-dictionaries.service) and [timer](./rime-dictionaries.timer).
