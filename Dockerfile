FROM mcr.microsoft.com/windows:1809
WORKDIR /app

# install dotnet
RUN powershell -command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN powershell -command choco feature enable -n allowGlobalConfirmation
RUN powershell -command choco install dotnetcore

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy and build everything else
COPY . ./
RUN dotnet publish -c Release -o out
ENTRYPOINT ["dotnet", "C:\app\bin\Release\netcoreapp2.1\Benchmark.dll"]

#FROM mcr.microsoft.com/windows:1809
#WORKDIR /app

# install dotnet 
#COPY . ./
#RUN powershell -command Set-ExecutionPolicy RemoteSigned
#RUN powershell -command .\dotnet-install.ps1

# copy csproj and restore as distinct layers
#RUN C:\Users\ContainerAdministrator\AppData\Local\Microsoft\dotnet\dotnet restore

# copy and build everything else
#RUN C:\Users\ContainerAdministrator\AppData\Local\Microsoft\dotnet\dotnet publish -c Release -o out
#ENTRYPOINT ["C:\Users\ContainerAdministrator\AppData\Local\Microsoft\dotnet\dotnet.exe", "C:\app\bin\Release\netcoreapp2.1\Benchmark.dll"]
