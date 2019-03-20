--[[ Copyright (c) 2019 Optera
 * Part of Optera's Function Library
 *
 * See LICENSE.md in the project directory for license information.
--]]

-- find main locomotive in a given train
-- Parameters: LuaTrain
-- Returns: LuaLocomotive
function get_main_locomotive(train)
  if train.valid and train.locomotives and (#train.locomotives.front_movers > 0 or #train.locomotives.back_movers > 0) then
    return train.locomotives.front_movers and train.locomotives.front_movers[1] or train.locomotives.back_movers[1]
  end
end

-- find main locomotive name in a given train
-- Parameters: LuaTrain
-- Returns: LuaLocomotive.backer_name
function get_train_name(train)
  local loco = get_main_locomotive(train)
  return loco and loco.backer_name
end

return {
  get_main_locomotive = get_main_locomotive,
  get_train_name = get_train_name,
}
