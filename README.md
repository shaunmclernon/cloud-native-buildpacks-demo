
# Cloud Native Buildpacks Demo

## Summary

The goal of this repo is to demonstrate how [Cloud Native Buildpacks] work.  This was demo'ed at talk that I gave at the CNCF Birmingham Meetup on 5th Feb 2020.

## Prerequisites

In order to run this demo, you will need the following;

- docker
- [pack]

### 1st demo - building a nodejs app

This demo shows how a standard nodejs app can be built as a docker container without the need for an explicit dockerfile.

```bash
./demos/pack-nodejs.sh
```

### 2nd demo - rebuilding the nodejs app

This demo shows how the above nodejs app can be rebuilt without having to build all of the layers from scratch.

```bash
./demos/rebuild-nodejs.sh
```

### 3rd demo - rebase the nodejs app

This demo shows how the above nodejs app can be rebased to change the underlying base image using the same application that was previously rebuilt.

```bash
./demos/rebuild-nodejs.sh
```

### 4th demo - what is a builder

This demo shows what is in an actual builder.

```bash
./demos/rebuild-nodejs.sh
```

### 5th demo - how to create buildpack

TODO: Implement this demo.

## demo-magic

These demos were built using [demo-magic], a very useful tool to help with fat-finger syndrome when doing live demos.

[Cloud Native Buildpacks]: http://buildpacks.io
[pack]: https://buildpacks.io/docs/install-pack/
[demo-magic]: https://github.com/paxtonhare/demo-magic