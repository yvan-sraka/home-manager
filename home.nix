{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "yvan";
  home.homeDirectory = "/Users/yvan";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  # List packages installed in home-manager profile. To search, run:
  # $ nix search wget
  home.packages = [
    (pkgs.neovim.override {
      configure = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [ editorconfig-vim vim-airline vim-lastplace vim-nix ];
          opt = [ ];
        };
      };
    })
    pkgs.glow
    pkgs.htop
    pkgs.mosh
    pkgs.most
    pkgs.nixfmt
    pkgs.nodejs
    pkgs.pandoc
    pkgs.pipenv
    pkgs.pass
    pkgs.taskwarrior
    pkgs.tmux
    pkgs.tree
    pkgs.wget
    pkgs.yarn
  ];

  programs.direnv = {
    enable = true;
    enableNixDirenvIntegration = true;
  };

  programs.broot = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    history = { save = 1000; };
    envExtra = builtins.readFile ./.zshenv;
    initExtraBeforeCompInit = ''
      source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
    '';
  };

  home.file.".gitconfig".text = ''
    [user]
      name = Yvan Sraka
      email = yvan@sraka.xyz
    [core]
      editor = nvim
    [pull]
      ff = only
    [init]
      defaultBranch = main
    [filter "lfs"]
      process = git-lfs filter-process
      required = true
      clean = git-lfs clean -- %f
      smudge = git-lfs smudge -- %f
      '';

  programs.browserpass = {
    enable = true;
    browsers = [ "chrome" "firefox" ];
  };
}
