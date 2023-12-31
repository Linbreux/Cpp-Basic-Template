{ pkgs ? import <nixpkgs> { } }:
let
  project_name = "cpp_template";
  build_type = "Debug";
in
pkgs.stdenv.mkDerivation {
  name = project_name;
  pname = project_name;
  src = ./.;

  buildInputs = [
    pkgs.stdenv.cc.cc.lib
    pkgs.boost
    pkgs.cmake
    pkgs.ninja
    pkgs.spdlog
    pkgs.yaml-cpp
    pkgs.openssl
    pkgs.protobuf
    pkgs.gnulib
    pkgs.nlohmann_json
    pkgs.catch2_3
  ];

  nativeBuildInputs = [ pkgs.gcc12 pkgs.pkg-config ];

  configurePhase = ''
    cmake -DCMAKE_BUILD_TYPE=${build_type} \
    -DPROJECT_NAME=${project_name} \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=YES .
  '';

  buildPhase = ''
    cmake --build .
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv bin/* $out/bin
    cp compile_commands.json $out/
  '';

  meta = with pkgs; {
    # Export project_name as an attribute
    project_name = project_name;
  };
}
