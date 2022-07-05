FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /src

COPY *.csproj ./
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o out --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
RUN touch Nlog.config
COPY --from=build-env /src/out .

ENTRYPOINT ["dotnet", "SAS.dll"]