local presetManager = {}

-- This function can be anything but must return true/false
presetManager.pluginTrigger = function(selectedThreshold)
	-- Example: trigger is returning true when rain, snow or fog is happening, however, a threshold is also expected.
	-- The main mod will take care of injecting it if it's passed into the configuration for the plugin

	local specialHappening = false
	local specialIntensity = 0.0
	local ClimateManager = getClimateManager()

	local specialThreshold = 0.3 -- default
	if (selectedThreshold == 1) then
		specialThreshold = 0.0
	elseif (selectedThreshold == 2) then
		specialThreshold = 0.3
	elseif (selectedThreshold == 3) then
		specialThreshold = 0.5
	elseif (selectedThreshold == 4) then
		specialThreshold = 0.7
	end

	rainIntensity = ClimateManager:getRainIntensity()
	rainHappening = ClimateManager:isRaining() and specialIntensity >= specialThreshold
	
	snowIntensity = ClimateManager:getSnowIntensity()
	snowHappening = ClimateManager:isSnowing() and specialIntensity >= specialThreshold
	
	fogIntensity = ClimateManager:getFogIntensity()
	fogHappening = specialIntensity >= specialThreshold

	specialHappening = rainHappening or snowHappening or fogHappening
	
	if (specialHappening) then
		return true
	else
		return false
	end
end

return presetManager
