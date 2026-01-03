# `SoapySDR-hs`: [SoapySDR](https://github.com/pothosware/SoapySDR) haskell bindings
Write once. Run anywhere.

> [!WARNING]
> This project is in very early stages of active development.

## Project goals
A unified and extensible API for running programs on arbitrary hardware

```haskell
import SoapySDR

main :: IO ()
main = do
  deviceArgs <- enumerate
  case deviceArgs of
    (deviceArg : _) -> withDevice deviceArg $ \device -> do
      setFrequency device RX (Channel 0) 101.1e6
      setSampleRate device RX (Channel 0) 2.4e6
      withStream device RX CF32 [Channel 0] $ \stream -> do
        samples <- readStream device stream
        -- Process samples...
    [] -> putStrLn "No SDR devices found"
```

## TODO
- [X] Generate C API bindings with `hs-bindgen`
- [ ] Implement high-level API wrapper
  - [ ] Add streaming I/O
  - [ ] Add frequency, sample rate, gain control
- [ ] Device specific modules and capabilities
- [ ] Documentation and working examples
