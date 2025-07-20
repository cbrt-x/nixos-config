{
  home-manager.users.jade.programs.alacritty = {
    enable = true;
    theme = "catppuccin_frappe";
    settings = {
      window = {
        padding = {
          x = 15;
          y = 15;
        };
        dynamic_title = true;
        opacity = 0.7;
      };

      font = {
        size = 12;
        normal = {
          family = "Jetbrains Mono Nerd Font";
          style = "Regular";
        };
      };
    };
  };
}
