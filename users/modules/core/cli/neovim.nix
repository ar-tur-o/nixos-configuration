{inputs, ...}: {
  imports = [inputs.nixvim.homeManagerModules.nixvim];
  programs.nixvim = {
    enable = true;
    opts = {
      number = true; # show line numbers?
      shiftwidth = 2; # spaces per indent
      tabstop = 2; # spaces per tab
      expandtab = true; # should tabs be represented as spaces?
      autoindent = true; # auto indent when inserting a new line?
      smartindent = true; # auto indent based on syntax?
    };

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true; # Nix
          bashls.enable = true; # Bash

          # more performant langs
          ccls.enable = true; # C / C++
          cmake.enable = true;

          # web dev langs
          ts_ls.enable = true; # typescipt
          tailwindcss.enable = true;
          svelte.enable = true;
          html.enable = true;
          cssls.enable = true; # css
          eslint.enable = true; # eslint? idk i use eslint so imma add it

          # misc
          marksman.enable = true; # markdown
          taplo.enable = true; # TOML
          jsonls.enable = true; # Json
          yamlls.enable = true; # Yaml
          pylsp.enable = true; # python
          typos_lsp.enable = true; # Typo autocorrect :)
        };
      };

      web-devicons.enable = true;

      treesitter.enable = true;
      treesitter-context.enable = true; # shows the line where the function is declared at the top of the screen
      ts-autotag.enable = true; # automatically creates closing html tags
      rainbow-delimiters.enable = true; # Alternates the color of delimiters
      ts-context-commentstring.enable = true; # language aware string short cut

      telescope.enable = true;
      nvim-autopairs.enable = true;
      nvim-tree.enable = true;

      # autocomplete
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
          ];
          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };
    };
  };
  home.sessionVariables.EDITOR = "nvim";
}
