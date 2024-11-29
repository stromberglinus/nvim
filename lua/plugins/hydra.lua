return {
    {
        "nvimtools/hydra.nvim",
        keys = {
            {
                "<leader>t",
                function()
                    -- Create Hydra inside the keybinding for <leader>o
                    local Hydra = require("hydra")

                    -- Calculating max length for descriptions
                    local max_length = 0
                    for _, config in pairs(OPTIONS) do
                        local length = config.description:len()
                        max_length = length > max_length and length or max_length
                    end

                    -- Helper functions for spacing and building hints
                    local get_offset = function(name)
                        return max_length - name:len() + 3
                    end

                    local hint_builder = function(name, key, description)
                        local spacing = string.rep(" ", get_offset(description))
                        local key_spacing = string.rep(" ", 3 - key:len())
                        return "  _"
                            .. key
                            .. "_"
                            .. key_spacing
                            .. "│"
                            .. " "
                            .. description
                            .. spacing
                            .. "%{"
                            .. name
                            .. "}"
                            .. "  "
                    end

                    -- Type-based hint builders
                    local hint_builders = {
                        boolean = hint_builder,
                        string = hint_builder,
                        number = hint_builder,
                        table = hint_builder,
                    }

                    -- Function to build Hydra heads (keybindings)
                    local function head_builder(name, key, do_exit, func)
                        return {
                            key,
                            function()
                                func()
                            end,
                            {
                                exit = do_exit,
                                desc = name,
                                exit_before = do_exit,
                            },
                        }
                    end

                    -- Function to trigger after setting an option
                    local on_set = function(name)
                        require("options.filehandler").save() -- Save the options
                        if OPTIONS[name].callback then
                            OPTIONS[name].callback() -- Call the callback function if defined
                        end
                    end

                    -- Head builders for different types of values (boolean, string, number, table)
                    local head_builders = {
                        boolean = function(name, key, _)
                            return head_builder(name, key, false, function()
                                OPTIONS[name].value = not OPTIONS[name].value -- Toggle boolean
                                on_set(name)
                            end)
                        end,

                        string = function(name, key, prompt)
                            return head_builder(name, key, true, function()
                                if type(OPTIONS[name].prompt) == "table" then
                                    vim.ui.select(
                                        OPTIONS[name].prompt,
                                        { prompt = "Choose an option" },
                                        function(selected)
                                            if selected ~= nil then
                                                OPTIONS[name].value = selected
                                                on_set(name)
                                            end
                                        end
                                    )
                                elseif type(OPTIONS[name].prompt) == "string" then
                                    vim.ui.input(
                                        { default = OPTIONS[name].value, prompt = prompt },
                                        function(input)
                                            if input ~= nil then
                                                OPTIONS[name].value = input
                                                on_set(name)
                                            end
                                        end
                                    )
                                end
                            end)
                        end,

                        number = function(name, key, prompt)
                            return head_builder(name, key, true, function()
                                vim.ui.input(
                                    { default = tostring(OPTIONS[name].value), prompt = prompt },
                                    function(input)
                                        if input ~= nil then
                                            OPTIONS[name].value = tonumber(input) or 0
                                            on_set(name)
                                        end
                                    end
                                )
                            end)
                        end,

                        table = function(name, key, _)
                            return head_builder(name, key, true, function()
                                local choices = {}
                                for option, _ in pairs(OPTIONS[name].prompt) do
                                    table.insert(choices, option)
                                end

                                vim.ui.select(choices, {
                                    prompt = "Choose an option to configure:",
                                    format_item = function(item)
                                        return "> " .. item
                                    end,
                                }, function(choice)
                                    local prompt_choice = OPTIONS[name].prompt[choice]
                                    if choice == "add" then
                                        for prompt_name, options in pairs(prompt_choice) do
                                            local config_name = ""
                                            vim.ui.input({
                                                default = tostring(prompt_name),
                                                prompt = "New config name",
                                            }, function(
                                                input
                                            )
                                                if input ~= nil then
                                                    config_name = input
                                                    OPTIONS[name].value[input] = {}
                                                    on_set(name)
                                                end
                                            end)

                                            for _, option in pairs(options) do
                                                vim.ui.input({
                                                    default = tostring(OPTIONS[name].value[option]),
                                                    prompt = option,
                                                }, function(
                                                    input
                                                )
                                                    if input ~= nil then
                                                        OPTIONS[name].value[config_name][option] =
                                                            input
                                                        on_set(name)
                                                    end
                                                end)
                                            end
                                        end
                                    elseif choice == "remove" then
                                        local selections = {}
                                        for config_name, _ in pairs(OPTIONS[name].value) do
                                            table.insert(selections, config_name)
                                        end

                                        vim.ui.select(selections, {
                                            prompt = "Choose an option to remove:",
                                            format_item = function(item)
                                                return "> " .. item
                                            end,
                                        }, function(remove)
                                            if remove == nil then
                                                return
                                            end

                                            OPTIONS[name].value[remove] = nil
                                            on_set(name)
                                        end)
                                    else
                                        vim.notify("Invalid choice", vim.log.levels.ERROR)
                                    end
                                end)
                            end)
                        end,
                    }

                    -- Value builders for dynamic display in the Hydra hint
                    local value_builders = {
                        boolean = function(name)
                            return function()
                                return OPTIONS[name].value and require("utils.icons").progress.done
                                    or require("utils.icons").progress.offline
                            end
                        end,

                        string = function(name)
                            return function()
                                return OPTIONS[name].value
                            end
                        end,

                        number = function(name)
                            return function()
                                return tostring(OPTIONS[name].value)
                            end
                        end,

                        table = function()
                            return function()
                                return "{}"
                            end
                        end,
                    }

                    -- Build heads (keybindings) and the Hydra hint
                    local heads = {}
                    local hint = [[
 ^ Options
 ]]
                    local values = {}
                    local hints = {}

                    for option, config in pairs(OPTIONS) do
                        local value_type = type(config.value)
                        local builder = head_builders[value_type]

                        table.insert(hints, {
                            number = string.byte(config.key),
                            value = hint_builders[value_type](
                                option,
                                config.key,
                                config.description
                            ),
                        })

                        table.insert(heads, builder(option, config.key, config.prompt))

                        values[option] = value_builders[value_type](option)
                    end

                    table.sort(hints, function(a, b)
                        return a.number < b.number
                    end)

                    for _, value in pairs(hints) do
                        hint = hint .. "\n" .. value.value
                    end

                    table.insert(heads, { "<Esc>", nil, { exit = true } })
                    hint = hint .. "\n" .. [[
 ^ _<Esc>_
 ]]

                    -- Create and immediately open the Hydra
                    local option_hydra = Hydra({
                        name = "Options",
                        hint = hint,
                        config = {
                            color = "amaranth",
                            invoke_on_body = true,
                            hint = {
                                float_opts = {
                                    border = "rounded",
                                },
                                position = "middle",
                                funcs = values,
                            },
                        },
                        mode = { "n", "x" },
                        body = nil, -- No keybinding for body, it will be triggered manually
                        heads = heads,
                    })

                    -- Open the Hydra manually
                    option_hydra:activate()
                end,
            },
            {
                "<leader><leader>", -- Keybinding for Emoji Picker
                function()
                    -- Emoji Picker Implementation
                    local Hydra = require("hydra")

                    -- Predefined list of emojis

                    local EMOJIS = {
                        { key = "s", emoji = "😄", description = "Smile" },
                        { key = "r", emoji = "🚀", description = "Rocket" },
                        { key = "f", emoji = "🔥", description = "Fire" },
                        { key = "|", emoji = "⚡", description = "Lightning" },
                        { key = "$", emoji = "📦", description = "Package" },
                        { key = "v", emoji = "💻", description = "Computer" },
                        { key = "x", emoji = "❌", description = "Cross" },
                        { key = "y", emoji = "✅", description = "Checkmark" },
                        { key = "h", emoji = "❤️", description = "Heart" },
                        { key = "a", emoji = "✨", description = "Sparkle" },
                        { key = "m", emoji = "📝", description = "Memo" },
                        { key = "g", emoji = "⚙️", description = "Gear" },
                        { key = "#", emoji = "🕒", description = "Clock" },
                        { key = "q", emoji = "❗", description = "Exclamation" },
                        { key = "w", emoji = "❓", description = "Question" },
                        { key = "~", emoji = "🟢", description = "Green Circle" },
                        { key = "@", emoji = "🟡", description = "Yellow Circle" },
                        { key = "=", emoji = "🔴", description = "Red Circle" },
                        { key = "b", emoji = "🌟", description = "Star" },
                        { key = "u", emoji = "📖", description = "Book" },
                        { key = "i", emoji = "🎵", description = "Music" },
                        { key = "o", emoji = "💬", description = "Speech" },
                        { key = ";", emoji = "⏳", description = "Hourglass" },
                        { key = "/", emoji = "📊", description = "Diagram" },
                        { key = ",", emoji = "🔧", description = "Wrench" },
                        { key = ".", emoji = "🔑", description = "Key" },
                        { key = "z", emoji = "📌", description = "Pushpin" },
                        { key = "d", emoji = "📅", description = "Calendar" },
                        { key = "*", emoji = "📁", description = "File Folder" },
                        { key = "&", emoji = "🎨", description = "Art" },
                        { key = "%", emoji = "🖋️", description = "Pen" },
                        { key = "+", emoji = "🚶", description = "Walking" },
                        { key = "-", emoji = "🏃", description = "Running" },
                        { key = ">", emoji = "➡️", description = "Arrow Right" },
                        { key = "<", emoji = "⬅️", description = "Arrow Left" },
                    }

                    -- Helper function to calculate spacing
                    local max_length = 0
                    for _, config in pairs(EMOJIS) do
                        local length = config.description:len()
                        max_length = length > max_length and length or max_length
                    end

                    local get_offset = function(name)
                        return max_length - name:len() + 3
                    end

                    local hint_builder = function(key, emoji, description)
                        local spacing = string.rep(" ", get_offset(description))
                        local key_spacing = string.rep(" ", 3 - key:len())
                        return "  _"
                            .. key
                            .. "_"
                            .. key_spacing
                            .. "│"
                            .. " "
                            .. emoji
                            .. " "
                            .. description
                            .. spacing
                            .. " "
                    end

                    -- Build heads (keybindings) and hints
                    local heads = {}
                    local hint = [[
 ^ Emoji Picker
 ]]
                    for _, config in ipairs(EMOJIS) do
                        local key = config.key
                        local emoji = config.emoji
                        local description = config.description

                        -- Add hint
                        hint = hint .. "\n" .. hint_builder(key, emoji, description)

                        -- Add head
                        table.insert(heads, {
                            key,
                            function()
                                vim.api.nvim_put({ emoji }, "", true, true) -- Insert emoji at cursor
                            end,
                            { exit = true, desc = description },
                        })
                    end

                    -- Add exit option
                    table.insert(heads, { "<Esc>", nil, { exit = true, desc = "Close Picker" } })

                    hint = hint .. "\n" .. [[
 ^ _<Esc>_ Close Picker
 ]]

                    -- Create and immediately open the Hydra
                    local emoji_hydra = Hydra({
                        name = "Emoji Picker",
                        hint = hint,
                        config = {
                            color = "amaranth",
                            invoke_on_body = true,
                            hint = {
                                float_opts = {
                                    border = "rounded",
                                },
                                position = "middle",
                            },
                        },
                        mode = "n", -- Normal mode only
                        body = nil, -- No keybinding for body, triggered manually
                        heads = heads,
                    })

                    emoji_hydra:activate()
                end,
            },
        },
    },
}
