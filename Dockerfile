FROM mcr.microsoft.com/windows:1809
WORKDIR /app

# install dotnet 
COPY . ./
RUN powershell -command Set-ExecutionPolicy RemoteSigned
RUN powershell -command .\dotnet-install.ps1

# copy csproj and restore as distinct layers
# COPY *.csproj ./
RUN dotnet restore

# copy and build everything else
RUN dotnet publish -c Release -o out
ENTRYPOINT ["Benchmark", "out/Benchmark.dll"]
