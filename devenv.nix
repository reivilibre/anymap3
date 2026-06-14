{ pkgs, lib, config, inputs, ... }:

{
  cachix.enable = false;

  # https://devenv.sh/packages/
  packages = with pkgs; [
    mold

    cargo-insta
    cargo-release

    mdbook
  ];

  # https://devenv.sh/languages/
  languages.rust = {
    enable = true;
  };

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
