# Gunakan SDK image untuk build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy csproj dan restore
COPY ./*.sln .
COPY ./LearnJenkinsPipelineSysdev/*.csproj ./LearnJenkinsPipelineSysdev/
RUN dotnet restore

# Copy semua file & build
COPY . .
RUN dotnet publish -c Release -o out

# Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .

ENTRYPOINT ["dotnet", "LearnJenkinsPipelineSysdev.dll"]
