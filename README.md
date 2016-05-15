## jekyllsurge
A small (133.5MB) docker container with jekyll and surge installed.

```
/ # node -v
v6.1.0
/ # npm -v
3.8.9
/ # ruby -v
ruby 2.2.4p230 (2015-12-16 revision 53155) [x86_64-linux-musl]
/ # jekyll -v
jekyll 2.5.0
/ # surge --version
0.18.0
```

### Why would I use this?
Say you have a [jekyll](https://jekyllrb.com/) site deployed with [surge.sh](https://surge.sh/) and you want your CI tool to both build the site **AND** deploy it, but your CI tool only allows the use of one language. This means you can't build (requires ruby) and deploy (requires node.js). That's why this exists, as it has both jekyll and surge.sh installed so you can build and deploy at the same time.

### How to use
Write a Dockerfile using this image as the base. ```FROM psisous/jekyllsurge```. If you want to pass env variables (such as SURGE_LOGIN and SURGE_TOKEN) over to your image when you build it, use the --build-arg flag for docker build (ex. From your root directory. ```docker build -t myBlog --build-arg SURGE_LOGIN=$SURGE_LOGIN --build-arg SURGE_TOKEN=$SURGE_TOKEN```). You can then use this inside your dockerfile by declaring them as an ARG. See [Docker Docs](https://docs.docker.com/engine/reference/builder/#arg) for more details. You can also pass the env variables in with the -e flag when you run the image.
