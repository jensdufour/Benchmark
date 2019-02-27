FROM mcr.microsoft.com/windows:1809
WORKDIR /app

# install dotnet 
COPY . ./
RUN powershell -command Set-ExecutionPolicy RemoteSigned
RUN powershell -command .\dotnet-install.ps1

# copy csproj and restore as distinct layers
RUN C:\Users\ContainerAdministrator\AppData\Local\Microsoft\dotnet\dotnet restore

# copy and build everything else
RUN C:\Users\ContainerAdministrator\AppData\Local\Microsoft\dotnet\dotnet publish -c Release -o out
ENTRYPOINT ["C:\Users\ContainerAdministrator\AppData\Local\Microsoft\dotnet\dotnet.exe", "C:\app\bin\Release\netcoreapp2.1\Benchmark.dll"]
