--[[ Copyright (c) 2019 Optera
 * Part of Optera's Function Library
 *
 * See LICENSE.md in the project directory for license information.
--]]

-- find main locomotive in a given train
-- Parameters: LuaTrain
-- Returns: LuaEntity
function get_main_locomotive(train)
  if train.valid and train.locomotives and (#train.locomotives.front_movers > 0 or #train.locomotives.back_movers > 0) then
    return train.locomotives.front_movers and train.locomotives.front_movers[1] or train.locomotives.back_movers[1]
  end
end

-- find main locomotive name in a given train
-- Parameters: LuaTrain
-- Returns: string containing backer_name of main locomotive
function get_train_name(train)
  local loco = get_main_locomotive(train)
  return loco and loco.backer_name
end

-- rotates a single carriage of a train
-- Parameters: LuaEntity
-- Returns: true if rotated successful
function rotate_carriage(entity)
  local disconnected_back = entity.disconnect_rolling_stock(defines.rail_direction.back)
  local disconnected_front = entity.disconnect_rolling_stock(defines.rail_direction.front)
  entity.rotate()
  -- Only reconnect the side that was disconnected
  local reconnected_front = disconnected_front
  local reconnected_back = disconnected_back
  if disconnected_back then
    reconnected_back = entity.connect_rolling_stock(defines.rail_direction.front)
  end
  if disconnected_front then
    reconnected_front= entity.connect_rolling_stock(defines.rail_direction.back)
  end

  if disconnected_front and not reconnected_front then
    return false
  end
  if disconnected_back and not reconnected_back then
    return false
  end
  return true
end

-- creates string representing train composition
-- L for locomotives, C for cargo wagons, F for fluid wagons, A for artillery wagon
-- Parameters: LuaTrain
-- Returns: string
function get_train_composition_string(train)
  if train and train.valid then
    local carriages = train.carriages
    local comp_string = ""
    local locos_front = train.locomotives["front_movers"]
    for _,carriage in pairs(carriages) do
      if carriage.type == "locomotive" then
        local faces_forward = false
        for _,loco in ipairs(locos_front) do
          if carriage.unit_number == loco.unit_number then
            faces_forward = true
            break
          end
        end
        if faces_forward then
          comp_string = comp_string.."<L<"
        else
          comp_string = comp_string..">L>"
        end
      elseif carriage.type == "cargo-wagon" then
        comp_string = comp_string.."C"
      elseif carriage.type == "fluid-wagon" then
        comp_string = comp_string.."F"
      elseif carriage.type == "artillery-wagon" then
        comp_string = comp_string.."A"
      else
        comp_string = comp_string.."?"
      end
    end
    return comp_string
  else
    return ""
  end
end

return {
  get_distance = get_distance,
  get_distance_squared = get_distance_squared,
  ticks_to_timestring = ticks_to_timestring,
  compare_tables = compare_tables,
  get_train_composition_string = get_train_composition_string,
}