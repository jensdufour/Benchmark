FROM mcr.microsoft.com/windows/nanoserver:1709
ADD publish/ /
ENTRYPOINT Benchmark.exe