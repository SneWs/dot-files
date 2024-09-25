-- Don't forget to install https://github.com/Samsung/netcoredbg for dotnet debugging
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
        "nicholasmata/nvim-dap-cs",
        "mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
        require("dapui").setup({
            icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
            layouts = {
            {
              elements = {
              -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
              },
              size = 40, -- 40 columns
              position = "left",
            },
            {
              elements = {
                "repl",
                "console",
              },
              size = 0.25, -- 25% of total lines
              position = "bottom",
            },
          },
            controls = {
                enabled = true,
                -- Display controls in this element
                element = "repl",
                icons = {
                     pause = "",
                     play = "",
                     step_into = "",
                     step_over = "",
                     step_out = "",
                     step_back = "",
                     run_last = "↻",
                     terminate = "□",
                },
          },
          floating = {
              max_height = nil, -- These can be integers or a float between 0 and 1.
              max_width = nil, -- Floats will be treated as percentage of your screen.
              border = "single", -- Border style. Can be "single", "double" or "rounded"
              mappings = {
                  close = { "q", "<Esc>" },
              },
          },
          windows = { indent = 1 },
          render = {
              max_type_length = nil, -- Can be integer or nil.
              max_value_lines = 100, -- Can be integer or nil.
          },
        })

		local dap, dapui = require("dap"), require("dapui")

        -- Go debugging
		require("dap-go").setup()

        dap.adapters.coreclr = {
            type = "executable",
            command = os.getenv("NETCORE_DBG_BINARY") or "netcoredbg",
            args = {"--interpreter=vscode"}
        }

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                cwd = function()
                    local path = os.getenv("DOTNET_DBG_PATH")
                    if path == nil then
                        print("DOTNET_DBG_PATH is not set, falling back to nvim cwd")
                        path = vim.fn.getcwd()
                    end

                    return path
                end,
                program = function()
                    local progPath = os.getenv("DOTNET_DBG_DLL")
                    if progPath == nil then
                        print("DOTNET_DBG_DLL is not set")
                    end

                    return progPath
                end,
              },
        }

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<F9>", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
		vim.keymap.set("n", "<sc-F5>", ":DapTerminate<CR>")
		vim.keymap.set("n", "<F10>", ":DapStepOver<CR>")
        vim.keymap.set("n", '<F11>', ":DapStepInto<CR>")
		-- vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
		-- vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
		-- vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		-- vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
        -- vim.keymap.set("n", '<Leader>di', ":DapStepInto<CR>")
	end,
}
