``` ini

BenchmarkDotNet=v0.11.4, OS=Windows 10.0.17134.590 (1803/April2018Update/Redstone4)
Intel Core i7-4712MQ CPU 2.30GHz (Haswell), 1 CPU, 8 logical and 4 physical cores
Frequency=2240918 Hz, Resolution=446.2457 ns, Timer=TSC
.NET Core SDK=2.2.104
  [Host]     : .NET Core 2.2.2 (CoreCLR 4.6.27317.07, CoreFX 4.6.27318.02), 64bit RyuJIT
  DefaultJob : .NET Core 2.2.2 (CoreCLR 4.6.27317.07, CoreFX 4.6.27318.02), 64bit RyuJIT


```
| Method |     Mean |     Error |    StdDev |
|------- |---------:|----------:|----------:|
| Sha256 | 48.69 us | 0.9690 us | 2.1065 us |
|    Md5 | 21.69 us | 0.0827 us | 0.0733 us |
