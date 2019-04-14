# Optera's Library
A library of functions I often use and got tired of maintaining in every mod.

## Usage:

Make whole module available:<br />
local optera_lib = require("\_\_OpteraLib\_\_.script.misc")<br />
optera_lib.get_distance()<br />
<br />
Note: The library creates a global reference optera_lib, allowing direct access to functions:<br />
optera_lib.copy_prototype()<br />
<br />
Make single function available:<br />
local get_distance = require("\_\_OpteraLib\_\_.script.misc").copy_prototype<br />
get_distance()<br />



## Data Stage Functions

### data/utilities
[copy_prototype](https://github.com/Yousei9/Opteras-Library/wiki/Data-Stage-Functions#copy_prototype)<br />
[create_icons](https://github.com/Yousei9/Opteras-Library/wiki/Data-Stage-Functions#create_icons)<br />
[multiply_energy_value](https://github.com/Yousei9/Opteras-Library/wiki/Data-Stage-Functions#multiply_energy_value)<br />

## Control Stage Functions

### script/misc
[get_distance](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#get_distance)<br />
[get_distance_squared](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#get_distance_squared)<br />
[ticks_to_timestring](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#ticks_to_timestring)<br />
[compare_tables](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#compare_tables)<br />

### script/train
[get_main_locomotive](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#get_main_locomotive)<br />
[get_train_name](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#get_train_name)<br />
[rotate_carriage](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#rotate_carriage)<br />
[get_train_composition_string](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#get_train_composition_string)<br />
[open_train_gui](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#open_train_gui)<br />

### script/logger
[custom_log](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#custom_log)<br />
[custom_print](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#custom_print)<br />
[custom_tostring](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#custom_tostring)<br />
[settings](https://github.com/Yousei9/Opteras-Library/wiki/Control-Stage-Functions#settings)<br />
