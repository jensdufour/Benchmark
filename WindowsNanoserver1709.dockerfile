FROM mcr.microsoft.com/windows/nanoserver:1709
WORKDIR /app

# install dotnet
RUN @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
RUN choco feature enable -n allowGlobalConfirmation
RUN choco install dotnetcore
RUN choco install dotnetcore-sdk --pre

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy and build everything else
COPY . ./
RUN dotnet publish -c Release -o out
RUN dotnet run -c Release
