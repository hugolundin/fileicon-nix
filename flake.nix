{
  description = "A flake for fileicon.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ... 
  }: flake-utils.lib.eachDefaultSystem(system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        packageName = "fileicon";
      in {
        packages.${packageName} = pkgs.callPackage ./${packageName}.nix {};
        defaultPackage = self.packages.${system}.${packageName};
      });
}
