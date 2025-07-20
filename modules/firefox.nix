{
  home-manager.users.jade.programs.firefox = {
    enable = true;

    profiles.personal = {
      id = 0;
      isDefault = true;
      userChrome = ''
        .tab-close-button {
           display: none;
        }
      '';
      extensions = {
        # TODO
      };
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "trailhead.firstrun.didSeeAboutWelcome" = true;
      };
      bookmarks = {
        settings = [
          {
            name = "toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "home-manager option search";
                url = "https://home-manager-options.extranix.com/?query=&release=master";
              }
              {
                name = "nixos option search";
                url = "https://search.nixos.org/options?channel=unstable";
              }
            ];
          }
        ];
        force = true;
      };
    };
  };
}
