FROM mcr.microsoft.com/windows:1809
WORKDIR /app

# install dotnet
SHELL ["cmd", "/S", "/C"]    
RUN powershell -noexit "& ""https://dot.net/v1/dotnet-install.ps1"""

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy and build everything else
COPY . ./
RUN dotnet publish -c Release -o out
ENTRYPOINT ["Benchmark", "out/Benchmark.dll"]
