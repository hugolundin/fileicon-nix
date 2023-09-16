
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ (pkgs.callPackage ./fileicon.nix {}) ];
}
