{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs =
    { self, flake-utils }:
    {
      lib = {
        mkShell = self.lib.mkShellWith (pkgs: pkgs.mkShell);
        mkShellNoCC = self.lib.mkShellWith (pkgs: pkgs.mkShellNoCC);
        mkShellWith =
          mkShellFn: nixpkgs: mkShellArgs:
          flake-utils.lib.eachDefaultSystem (
            system:
            let
              pkgs = nixpkgs.legacyPackages.${system};
            in
            {
              devShell = (mkShellFn pkgs) (mkShellArgs pkgs);
            }
          );
      };
      noCC = self.lib.mkShellNoCC;
      __functor = _: self.lib.mkShell;
    };
}
