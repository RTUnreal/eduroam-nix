{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
  };
  outputs = {
    systems,
    nixpkgs,
    ...
  }: let
    # Small tool to iterate over each systems
    eachSystem = f:
      nixpkgs.lib.genAttrs (import systems) (system:
        f (import nixpkgs {
          inherit system;
        }));
  in {
    devShells = eachSystem (pkgs: {
      default = let
        my-python = pkgs.python3;
        python-with-my-packages = my-python.withPackages (p:
          with p; [
            dbus-python
            # other python packages you want
          ]);
      in
        pkgs.mkShell {
          packages = with pkgs; [
            libsForQt5.kdialog
            python-with-my-packages
            # other dependencies
          ];
          shellHook = ''
            PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
          '';
        };
    });
  };
}
