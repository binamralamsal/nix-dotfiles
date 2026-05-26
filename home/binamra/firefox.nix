{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      ExtensionSettings = {
        "*" = {
          installation_mode = "allowed";
        };

        # Force enable extensions
        "bitwarden@bitwarden.com" = {
          installation_mode = "force_installed";
        };

        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
        };

        "sponsorBlocker@ajay.app" = {
          installation_mode = "force_installed";
        };

        "{b41ed7c9-5f22-47ce-a662-46b12fde6448}" = {
          installation_mode = "force_installed";
        };
      };
    };

    profiles.default = {
      extensions.packages =
        with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          ublock-origin
          sponsorblock
          wappalyzer
        ];
    };
  };
}
