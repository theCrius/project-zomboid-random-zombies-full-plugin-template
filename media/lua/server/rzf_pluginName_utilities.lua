local utilities = {}

-- Validate the sandbox options' values
utilities.ValidateConfiguration = function()
  if not type(SandboxVars.RandomZombiesFullExamplePlugin) == "table" then
    error("[RZF] No RandomZombiesFull table in config")
  end

  if not (
    type(SandboxVars.RandomZombiesFullExamplePlugin.Summer_Night_Start) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Summer_Night_End) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Autumn_Night_Start) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Autumn_Night_End) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Winter_Night_Start) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Winter_Night_End) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Spring_Night_Start) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Spring_Night_End) == "number"
  )
  then
    error("[RZF] Config value is not a number for the Season Night times")
  end

  if not (
    type(SandboxVars.RandomZombiesFullExamplePlugin.Crawler_Special) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Shambler_Special) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.FastShambler_Special) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Sprinter_Special) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Fragile_Special) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Normal_Special) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Tough_Special) == "number" and
    type(SandboxVars.RandomZombiesFullExamplePlugin.Smart_Special) == "number")
  then
    error("[RZF] Config value is not a number for the Night Settings")
  end

  if SandboxVars.RandomZombiesFullExamplePlugin.Crawler_Special +
    SandboxVars.RandomZombiesFullExamplePlugin.Shambler_Special +
    SandboxVars.RandomZombiesFullExamplePlugin.FastShambler_Special +
    SandboxVars.RandomZombiesFullExamplePlugin.Sprinter_Special
    ~= 100 then
    error("[RZF] Crawler, Shambler, FastShambler and Sprinter for the Special Settings do not add up to 100")
  end

  if SandboxVars.RandomZombiesFullExamplePlugin.Fragile_Special +
    SandboxVars.RandomZombiesFullExamplePlugin.Normal_Special +
    SandboxVars.RandomZombiesFullExamplePlugin.Tough_Special
    ~= 100 then
    error("[RZF] Fragile, Normal and Tough for the Special Settings do not add up to 100")
  end
end

utilities.LoadConfiguration = function()
  local configuration = {}
  configuration.enabled = {
    exampleModeTime = SandboxVars.RandomZombiesFullExamplePlugin.Enable_ExampleMode,
    exampleModeThreshold = SandboxVars.RandomZombiesFullExamplePlugin.ExampleMode_Threshold
  }
  configuration.schedule = {
    summer = {
      startTime = SandboxVars.RandomZombiesFullExamplePlugin.Summer_Event_Start,
      endTime = SandboxVars.RandomZombiesFullExamplePlugin.Summer_Event_End
    },
    autumn = {
      startTime = SandboxVars.RandomZombiesFullExamplePlugin.Autumn_Event_Start,
      endTime = SandboxVars.RandomZombiesFullExamplePlugin.Autumn_Event_End
    },
    winter = {
      startTime = SandboxVars.RandomZombiesFullExamplePlugin.Winter_Event_Start,
      endTime = SandboxVars.RandomZombiesFullExamplePlugin.Winter_Event_End
    },
    spring = {
      startTime = SandboxVars.RandomZombiesFullExamplePlugin.Spring_Event_Start,
      endTime = SandboxVars.RandomZombiesFullExamplePlugin.Spring_Event_End
    }
  }
  configuration.exampleModeTime = {
    crawler = SandboxVars.RandomZombiesFullExamplePlugin.Crawler_ExampleMode,
    shambler = SandboxVars.RandomZombiesFullExamplePlugin.Shambler_ExampleMode,
    fastShambler = SandboxVars.RandomZombiesFullExamplePlugin.FastShambler_ExampleMode,
    sprinter = SandboxVars.RandomZombiesFullExamplePlugin.Sprinter_ExampleMode,
    fragile = SandboxVars.RandomZombiesFullExamplePlugin.Fragile_ExampleMode,
    normal = SandboxVars.RandomZombiesFullExamplePlugin.Normal_ExampleMode,
    tough = SandboxVars.RandomZombiesFullExamplePlugin.Tough_ExampleMode,
    smart = SandboxVars.RandomZombiesFullExamplePlugin.Smart_ExampleMode,
  }

  return configuration
end

return utilities
