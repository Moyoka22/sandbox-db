{ pkgs ? import <nixpkgs> {} }:
with pkgs;
let 
  buildInputs = [ pgcli ];
in
  mkShell {
    inherit buildInputs;
  }

