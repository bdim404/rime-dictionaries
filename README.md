# rime-dictionaries

Bdim's personal rime dictionaries repo.

## **You should read the [blog](https://blog.bdim.moe/zh/posts/2025-2-28) first!**

## How to use on macOS:

```shell
cd ./Rime
```

```shell
git init
```

```shell
git remote add origin https://github.com/bdim404/rime-dictionaries.git
```

```shell
git pull origin main
```
### ShortCuts - Auto update dictionaries

Creat a new shortcuts and search "run shell script."

Paste the [script](./macOS-shortcut.sh) and test.

## How to use on Debian:
```shell
curl -sS https://api.bdim.moe/rime-deploy | bash
```
Or, you can just run [script](./rime-deploy.sh).

The script also can use to update dictionaries.
