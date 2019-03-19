local floor = math.floor
local format = string.format
local format_string = "%d:%02d"
-- converts ticks into time in "mm:ss" format
local function tick2timestring(tick)
	local total_seconds = tick/60
	local minutes = floor(total_seconds/60)
	local seconds = floor(total_seconds % 60)
	return format(format_string, minutes, seconds)
end


-- (shallowly) compares two tables by content
--
local function compare_tables(tb1, tb2)
  if tb1 == tb2 then return true end
  local t1_type = type(tb1)
  if t1_type ~= type(tb2) then return false end
  if t1_type ~= 'table' then return false end

  local keys = {}
  for key1, value1 in pairs(tb1) do
    local value2 = tb2[key1]
    if value2 == nil or value2 ~= value1 then return false end
    keys[key1] = true
  end
  for key2 in pairs(tb2) do
    if not keys[key2] then return false end
  end
  return true
end


return {
  tick2timestring =  tick2timestring,
  compare_tables = compare_tables,
}