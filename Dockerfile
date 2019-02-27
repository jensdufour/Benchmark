FROM mcr.microsoft.com/windows:1809
WORKDIR /app

# install dotnet 
COPY . ./
RUN powershell -command Set-ExecutionPolicy RemoteSigned
RUN powershell -command .\dotnet-install.ps1
#RUN powershell -command $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

# copy csproj and restore as distinct layers
# COPY *.csproj ./
RUN C:\Users\ContainerAdministrator\AppData\Local\Microsoft\dotnet\dotnet restore

# copy and build everything else
RUN C:\Users\ContainerAdministrator\AppData\Local\Microsoft\dotnet\dotnet publish -c Release -o out
ENTRYPOINT ["Benchmark", "out\Benchmark.dll"]
