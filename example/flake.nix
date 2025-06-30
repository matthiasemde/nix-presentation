{
 description = "Hello with Clang";
 inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
 outputs = { self, nixpkgs }:
  let pkgs = import nixpkgs { system = "x86_64-linux"; }; in {
    packages.x86_64-linux.hello = pkgs.stdenv.mkDerivation {
        name = "hello-clang";
        src = ./.  ;
        buildInputs = [ pkgs.clang ];
        buildPhase = "clang -o hello hello.c";
        installPhase = ''
          mkdir -p $out/bin
          cp hello $out/bin/
        '';
      };
    };
}
