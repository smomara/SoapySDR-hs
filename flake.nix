{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    hs-bindgen.url = "github:well-typed/hs-bindgen";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      hs-bindgen,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ hs-bindgen.overlays.default ];
        };
        SoapySDR-hs = pkgs.haskellPackages.callCabal2nix "SoapySDR-hs" ./. { };
      in
      {
        apps.generate = {
          type = "app";
          program = "${pkgs.writeShellScript "generate" ''
            set -e
            ${hs-bindgen.packages.${system}.default}/bin/hs-bindgen-cli preprocess \
              --hs-output-dir ./bindings \
              --module SoapySDR.Bindings \
              --create-output-dirs \
              --overwrite-files \
              -I ${pkgs.soapysdr}/include \
              --unique-id com.soapysdr.bindings \
              SoapySDR/Types.h \
              SoapySDR/Device.h
          ''}";
        };

        packages.default = SoapySDR-hs;

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            ghc
            cabal-install
            haskell-language-server
            fourmolu
            soapysdr
            haskellPackages.cabal-fmt
          ];
          inputsFrom = [ SoapySDR-hs.env ];
        };
      }
    );
}
