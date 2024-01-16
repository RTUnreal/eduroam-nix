{ pkgs ? import <nixpkgs> {} }:
let
  my-python = pkgs.python3;
  python-with-my-packages = my-python.withPackages (p: with p; [
    dbus-python
    # other python packages you want
  ]);
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    libsForQt5.kdialog
    python-with-my-packages
    # other dependencies
  ];
  shellHook = ''
    PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
    '';
}
