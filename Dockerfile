FROM mcr.microsoft.com/windows:1809
WORKDIR /app

# install dotnet
RUN powershell -command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN powershell -command choco feature enable -n allowGlobalConfirmation
RUN powershell -command choco install dotnetcore
RUN powershell -command choco install dotnetcore-sdk --pre

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy and build everything else
COPY . ./
RUN dotnet publish -c Release -o out
ENTRYPOINT ["dotnet", "C:\app\bin\Release\netcoreapp2.1\Benchmark.dll"]
