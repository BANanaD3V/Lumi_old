{...}: {
  autoCmd = [
    {
      event = "TermClose";
      pattern = ["*lazygit"];
      callback = ''
        function()
              local manager_avail, manager = pcall(require, "neo-tree.sources.manager")
              if manager_avail then
                for _, source in ipairs {
                  "filesystem",
                  "git_status",
                  "document_symbols",
                } do
                  local module = "neo-tree.sources." .. source
                  if package.loaded[module] then
                    manager.refresh(require(module).name)
                  end
                end
              end
            end
      '';
    }
  ];
}
