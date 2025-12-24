# NixOS module for zmx - terminal session persistence
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.zmx;
in
{
  options.programs.zmx = {
    enable = lib.mkEnableOption "zmx terminal session persistence";

    package = lib.mkPackageOption pkgs "zmx" {
      nullable = true;
      default = null;
      extraDescription = ''
        The zmx package to use. If null, the package from the zmx flake will be used.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      (if cfg.package != null then cfg.package else pkgs.zmx)
    ];
  };
}
