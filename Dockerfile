FROM mcr.microsoft.com/windows:1809
WORKDIR /app

RUN Install-WindowsFeature NET-Framework-45-ASPNET ; \  
    Install-WindowsFeature Web-Asp-Net45

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy and build everything else
COPY . ./
RUN dotnet publish -c Release -o out
ENTRYPOINT ["Benchmark", "out/Benchmark.dll"]
