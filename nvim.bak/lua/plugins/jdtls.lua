return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local jdtls = require("jdtls")
    local root_markers = { ".git", "mvnw", "pom.xml" }
    local root_dir = require("jdtls.setup").find_root(root_markers)

    if root_dir == nil then
      return
    end

    local home = os.getenv("HOME")
    local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    local config = {
      cmd = {
        "jdtls",
        "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand("$MASON/share/jdtls/lombok.jar")),
      },
      root_dir = root_dir,
      workspace_folder = workspace_dir,
    }

    jdtls.start_or_attach(config)
  end,
}
