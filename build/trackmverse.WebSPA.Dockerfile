# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY ["/src/Web/WebSPA/WebSPA.csproj", "Web/WebSPA/"]
RUN dotnet restore "Web/WebSPA/WebSPA.csproj"

# Copy everything else and build
COPY ["/src/Web/WebSPA/", "Web/WebSPA/"]
RUN dotnet build "Web/WebSPA/WebSPA.csproj"
RUN dotnet publish "Web/WebSPA/WebSPA.csproj" -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "WebSPA.dll"]