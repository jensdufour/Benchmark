FROM mcr.microsoft.com/windows/servercore:1709
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
RUN dotnet run -c Release
