{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs =
    { flake-utils, ... }:
    {
      __functor =
        self: nixpkgs: mkShellArgs:
        flake-utils.lib.eachDefaultSystem (
          system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
          in
          {
            devShell = pkgs.mkShell (mkShellArgs pkgs);
          }
        );
    };
}
