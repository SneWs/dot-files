local M = {
    { "nicholasmata/nvim-dap-cs",
        dependencies = { "mfussenegger/nvim-dap" },
        setup = function()
		local dap = require("dap")

        dap.adapters.coreclr = {
            type = "executable",
            command = "netcoredbg",
            args = {"--interpreter=vscode"}
        }
        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    local progPath = os.getenv("DOTNET_DBG_DLL")
                    if progPath == nil then
                        print("DOTNET_DBG_DLL is not set")
                    end

                    return progPath
                end,
              },
        }
        end,
    },
}

return M
