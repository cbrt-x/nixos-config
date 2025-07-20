{ config, ... }:

{
  home-manager.users.jade.programs = {
    ranger = {
      enable = true;
      settings = {
        column_ratios = "1,3,3";
      };
    };

    bash = {
      enable = true;
      historyFile = "${config.home-manager.users.jade.xdg.configHome}/bash/.bash_history";
      historyIgnore = [
        "ls"
        "cd"
        "clear"
        "exit"
      ];
    };

    # prompt
    starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        add_newline = false;
        character.success_symbol = "[λ.](bold green)";
        format = "$directory$git_branch$character";
      };
    };
  };
}
