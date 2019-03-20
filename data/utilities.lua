--[[ Copyright (c) 2019 Optera
 * Part of Optera's Function Library
 *
 * See LICENSE.md in the project directory for license information.
--]]

-- copies prototypes and assigns new name and minable
-- Parameters: prototype, new_name
-- Returns: copied prototype
function copy_prototype(prototype, new_name)
  if not prototype.type or not prototype.name then
    error("Invalid prototype: prototypes must have name and type properties.")
    return nil
  end
  local p = table.deepcopy(prototype)
  p.name = new_name
  if p.minable and p.minable.result then
    p.minable.result = new_name
  end
  if p.place_result then
    p.place_result = new_name
  end
  if p.result then
    p.result = new_name
  end
  if p.results then
		for _,result in pairs(p.results) do
			if result.name == prototype.name then
				result.name = new_name
			end
		end
	end
  return p
end

-- adds new icon layers to a prototype icon or icons and returns the result
-- Parameters: prototype, new_layers = { { icon, icon_size, tint (optional) } }
-- Returns: created layered icon or nil
function create_icons(prototype, new_layers)
  for _,new_layer in pairs(new_layers) do
    if not new_layer.icon or not new_layer.icon_size then
      return nil
    end
  end

  if prototype.icons then
    local icons ={}
    for k,v in pairs(prototype.icons) do
      -- assume every other mod is lacking full prototype definitions
      icons[#icons+1] = { icon = v.icon, icon_size = v.icon_size or prototype.icon_size or 32, tint = v.tint }
    end
    for _, new_layer in pairs(new_layers) do
      icons[#icons+1] = new_layer
    end
    return icons

  elseif prototype.icon then
    local icons =
    {
      { icon = prototype.icon, icon_size = prototype.icon_size, tint = {r=1, g=1, b=1, a=1} },
    }
    for _, new_layer in pairs(new_layers) do
      icons[#icons+1] = new_layer
    end
    return icons

  else
    return nil
  end
end

-- multiplies energy string, e.g. '12kW' with factor
-- Parameters: energy_string, multiplicator
-- Returns: updated energy string
function multiply_energy_value(energy_string, factor)
  if type(energy_string) == "string" then
    local num, str, exp, energy = string.match(energy_string, "([%-+]?[0-9]*%.?[0-9]+)(([kKMGTPH]?)([WJ]))")
    if num and str and energy then
      local correctedNum = tonumber(num) * factor
      return correctedNum..str
    end
  end
end

return {
  copy_prototype = copy_prototype,
  create_icons = create_icons,
  multiply_energy_value = multiply_energy_value,
}
