# SysBot.ACNHOrders.Docker

This repository provides instructions on how to build and run a Docker image of [SysBot.ACHNOrders](https://github.com/berichan/SysBot.ACNHOrders). The Docker image should work on Linux systems with the amd64, arm32v7, and arm64v8 architectures.

## Building the Docker Image

To build the Docker image, use the following command:

```sh
docker compose build --no-cache
```

This will build the latest version of the SysBot.ACNHOrders from source code and save it as a Docker image.

## Running the Docker Container

Before running the Docker container, make sure that you have the following files and directory:

```text
|-presets/
|-Anchors.bin
|-config.json
```

### In Foreground

To run the container in foreground, use the following command:

```sh
docker compose up
```

This command will print logs directly to the terminal, which is useful for quickly testing the container and ensuring everything works as expected.

### In Background

To run the container in background (deteched mode):

```sh
docker compose up -d
```

To check the logs of the dteched container:

```sh
docker compose logs -f
```

This command will print the logs of the container as they become available.
