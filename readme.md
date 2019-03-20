# Optera's Library
A small library of functions I often use and got tired of maintaining in every mod.

## Data Stage Functions:

### data/utilities

#### copy_prototype
copies prototypes and assigns new name and minable

Parameters:
- prototype -> LuaPrototype
- new_name -> string
Returns:
- copied prototype -> LuaPrototype

#### create_icons
adds new icon layers to a prototype icon or icons
Parameters: prototype, new_layers = { { icon, icon_size, tint (optional) } }
- prototype -> LuaPrototype
- new_layers -> array of icon_layer { icon, icon_size, tint (optional) }
Returns:
- created layered icons  -> array of icon_layer { icon, icon_size, tint (optional) }
- nil on error

#### multiply_energy_value
multiplies energy string, e.g. '12kW' with factor
Parameters:
- energy -> string
- multiplicator -> double
Returns:
- energy -> string


## Control Stage Functions:

### script/misc

#### get_distance
calculates the distance in tiles between two positions
- Parameters: LuaPosition, LuaPosition
- Returns: distance as double

#### get_distance_squared
calculates the squared distance in tiles between two positions, slightly faster than get_distance
- Parameters: LuaPosition, LuaPosition
- Returns: squared distance as double

#### ticks_to_timestring
converts ticks into "mm:ss" format
- Parameters: tick
- Returns: formated string

#### compare_tables
(shallowly) compares two tables by content
- Parameters: table1, table2
- Returns: bool

### script/train

#### get_main_locomotive
find main locomotive in a given train
- Parameters: LuaTrain
- Returns: LuaLocomotive

#### get_train_name
find main locomotive name in a given train
- Parameters: LuaTrain
- Returns: LuaLocomotive.backer_name