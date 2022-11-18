local presetManager = require('rzf_pluginName_presetManager')
local utilities = require('rzf_pluginName_utilities')

-- Do not change this, it's were your and other plugins configuration will be stored
RZF_PLUGINS = RZF_PLUGINS or {}

-- plugin configuration populated by the options
local configuration = {}

-- Prepare che structure for the plugin's data
local function buildPluginStructure()
    -- Do NOT change the name of these attributes (presetName, enabled, triggerFn, presetData) of the plugin won't load
    local pluginDataTemplate = {
        -- give a unique name to your preset, possibly with the suffix `Time`
        presetName = "exampleModeTime",
        -- determine if this plugin is enabled or disable
        enabled = configuration.enabled.exampleModeTime,
        -- leave this to `nil` if you don't want to use a threshold
        threshold = configuration.enabled.exampleModeThreshold or nil,
        -- leave this to `nil` if you don't want to use a time schedule
        schedule = configuration.schedule or nil,
        -- change this to be one of "threshold", "schedule" or nil.
        -- In the two first cases, the respective attribute above will be injected by the main mod
        -- In the last one (nil) the function will be run without parameters injected.
        triggerMode = "threshold",
        -- this function will be used to determine how the preset activate
        triggerFn = presetManager.pluginTrigger,
        -- 1:1 with the preset data, how the zombies will distribute in percentages
        presetData = configuration.exampleModeTime
    }

    return pluginDataTemplate
end

-- Load configuration from options
local function loadPlugin()
    print("[RZF Plugin] ExampleMode Starting")
    utilities.ValidateConfiguration()
    configuration = utilities.LoadConfiguration()

    if type(configuration) ~= 'table' then
        error("[RZF] Configuration is not a table of values")
    else
        -- use this to add your table created above to the global RZF_PLUGINS table
        table.insert(RZF_PLUGINS, buildPluginStructure())
    end
    print("[RZF Plugin] ExampleMode added to the plugins list")
end

loadPlugin()