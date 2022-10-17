FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /App

# Copy everything from locally App folder to container's App folder
COPY ./App ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image (The [mcr.microsoft.com/dotnet/runtime:6.0] image could be used)
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT [ "dotnet", "DotNet.Docker.dll" ]