{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.org = (
    let system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
      pkgs.stdenv.mkDerivation {
        name = "org-latex";
        src = ./.;
        buildInputs = with pkgs; [
          texlive.combined.scheme-full
        ];
      }
    );

    packages.x86_64-linux.default = self.packages.x86_64-linux.org;

  };
}
