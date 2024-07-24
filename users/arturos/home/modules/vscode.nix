{
  config,
  lib,
  inputs,
  host,
  ...
}: let
  inherit (inputs) nixpkgs nix-vscode-extensions;
  pkgs = nixpkgs.legacyPackages.${host.system}.extend nix-vscode-extensions.overlays.default;
in {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;

    # you have to declare extensions in a nix file.. i might remove later ..
    mutableExtensionsDir = false;

    # no profiles.. ask reddit or some idk
    extensions =
      (with pkgs.vscode-marketplace; [
        # web
        ritwickdey.liveserver
        esbenp.prettier-vscode
        christian-kohler.npm-intellisense

        # misc
        christian-kohler.path-intellisense

        # svelte
        svelte.svelte-vscode
        ardenivanov.svelte-intellisense
        fivethree.vscode-svelte-snippets

        # tailwind
        bradlc.vscode-tailwindcss

        # typescript
        ms-vscode.vscode-typescript-next
      ])
      ++ (with pkgs.vscode-extensions; [
        # Nix - For some reason they don't work too well when fresh?
        bbenoist.nix
        kamadorueda.alejandra
      ]);

    userSettings = {
      "explorer.compactFolders" = false;
      "editor.tabsize" = 2;
      "[nix]" = {
        "editor.tabsize" = 2;
        "editor.defaultFormatter" = "kamadorueda.alejandra";
        "editor.formatOnPaste" = false;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = false;
      };
      "alejandra.program" = "alejandra";
      "[html]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      "[svelte]" = {
        "editor.defaultFormatter" = "svelte.svelte-vscode";
      };
      "svelte.enable-ts-plugin" = true;
      "[javascript]" = {
        "editor.tabsize" = 2;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    };
  };
}
