{ pkgs ? import <nixpkgs> { } }:
let
  build_deps = import ./default.nix { inherit pkgs; };
in
pkgs.mkShell {
  nativeBuildInputs = [
    build_deps.nativeBuildInputs
  ];
  buildInputs = [
    build_deps.buildInputs
    pkgs.zsh
  ];

  shellHook = ''
    echo Starting ${build_deps.meta.project_name} shell...
  '';
}
