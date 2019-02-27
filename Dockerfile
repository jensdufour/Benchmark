FROM mcr.microsoft.com/dotnet/core/sdk:2.2-nanoserver-1709
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy and build everything else
COPY . ./
RUN dotnet publish -c Release -o out
ENTRYPOINT ["Benchmark", "out/Benchmark.dll"]
