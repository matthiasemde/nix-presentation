defaultInputs = [ nixpkgs.reveal-md ];

{
  description = "Nix Presentation with Reveal.js";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in {
      devShell = pkgs.mkShell {
        packages = [ pkgs.nodejs pkgs.reveal-md ];
      };
      # Optional: Nix run target
      defaultPackage = pkgs.reveal-md;
      apps.x86_64-linux = {
        serve = {
          type = "app";
          program = [ "reveal-md" "slides.md" "--static" "_site" ];
        };
      };
    }
  );
}
