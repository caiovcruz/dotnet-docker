# .NET 6 Docker Sample

This sample demonstrates how to build a container image for .NET 6 webapps.

The sample builds an application in a [.NET SDK container](https://hub.docker.com/_/microsoft-dotnet-sdk/) and then copies the build result into a new image (the one you are building) based on the smaller [.NET Docker Runtime image](https://hub.docker.com/_/microsoft-dotnet-runtime/) or [.NET Docker ASP.NET Core Runtime image](https://hub.docker.com/_/microsoft-dotnet-aspnet/).

The instructions assume that you have cloned this repo, have [Docker](https://www.docker.com/) installed, and have a command prompt open within the cloned repo directory.

## Try a pre-built version of the sample

If want to skip ahead, you can try a pre-built version with the following command and access it in your web browser at `http://localhost:8080` endpoint.

```console
docker run --rm -it -p 8080:80 caiovcruz/dotnet-docker
```

## Build an ASP.NET Core image

You can build and run a .NET-based container image using the following instructions:

```console
docker build --pull -t dotnet-docker .
docker run --rm -it -p 8080:80 dotnet-docker
```

You should see the following console output as the application starts:

```console
> docker run --rm -it -p 8080:80 dotnet-docker
Hosting environment: Production
Content root path: /app
Now listening on: http://[::]:80
Application started. Press Ctrl+C to shut down.
```

After the application starts, navigate to `http://localhost:8080` in your web browser.

> Note: The `-p` argument maps port 8080 on your local machine to port 80 in the container (the form of the port mapping is `host:container`). See the [Docker run reference](https://docs.docker.com/engine/reference/commandline/run/) for more information on command-line parameters. In some cases, you might see an error because the host port you select is already in use. Choose a different port in that case.

In production, you will typically start your container with `docker run -d`. This argument starts the container as a service, without any console interaction. You then interact with it through other Docker commands or APIs exposed by the containerized application.