# eduroam with nix

small flake for helping setting up eduroam with the eduroam cat installer by providing the required packages.

# Steps

1. goto the [eduroam cat websit](https://cat.eduroam.org) and download the installer for your organisation. (It should be a python script)
1. enter the environment with

```sh
nix develop github:RTUnreal/eduroam-nix
```

1. execute the installer

```sh
python path/to/eduroam-linux-<something>.py
```

1. follow the install instructions
1. congratulations :fireworks: you should have eduroam set up!
