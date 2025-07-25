Shorthand for creating devShell-only flakes with minimum syntax.

Example usage:

```nix
{
  inputs.mkShell.url = "github:jeremyschlatter/mkShell";
  outputs =
    { mkShell, nixpkgs, ... }:
    mkShell nixpkgs (pkgs: {
      packages = with pkgs; [
        rustup
        zlib
      ];
    });
}
```

This creates a flake with devShells for each default system:


```
└───devShell
    ├───aarch64-darwin: development environment 'nix-shell'
    ├───aarch64-linux: development environment 'nix-shell'
    ├───x86_64-darwin: development environment 'nix-shell'
    └───x86_64-linux: development environment 'nix-shell'
```

See the [nixpkgs](https://nixos.org/manual/nixpkgs/stable/#sec-pkgs-mkShell) and [nix.dev](https://nix.dev/tutorials/first-steps/declarative-shell.html) documentation on the nix function `mkShell`. This flake is a wrapper around that function, and you can use the same attributes (`packages`, `shellHook`, etc).
