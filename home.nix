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

  home.packages = [
    pkgs.htop
    pkgs.neovim
    pkgs.nodejs
    pkgs.pandoc
    pkgs.pipenv
    pkgs.pass
    pkgs.tree
    pkgs.wget
    pkgs.yarn
  ];

  programs.direnv = {
    enable = true;
    enableNixDirenvIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    envExtra = builtins.readFile ./.zshenv;
    # wget -O grml.zsh http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
    initExtraBeforeCompInit = builtins.readFile ./grml.zsh;
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
}
