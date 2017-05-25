local entity = table.deepcopy(data.raw["ammo-turret"]["gun-turret"])
entity.name = "missile-turret"
entity.attack_parameters.ammo_category = "rocket"
entity.attack_parameters.range = 50
entity.attack_parameters.min_range = 35
entity.attack_parameters.turn_range = 1.0/3.0
entity.attacking_speed = 0.01
entity.automated_ammo_count = 1
entity.minable.result = "missile-turret"
entity.turret_base_has_direction = true

local item = table.deepcopy(data.raw.item["gun-turret"])
item.name = "missile-turret"
item.place_result = "missile-turret"
item.order = "b[turret]-d[missile-turret]"
item.icons = {
    {
        icon=item.icon,
        tint={r=1,g=0,b=0,a=0.3}
    }
}

local recipe = {
    type = "recipe",
    name = "missile-turret",
    enabled = false,
    energy_required = 20,
    ingredients = {
        {"rocket-launcher", 10},
        {"engine-unit", 10},
        {"advanced-circuit", 10}
    },
    result = "missile-turret"
}

local technology = {
    type = "technology",
    name = "missile-turret",
    icon = data.raw.technology["military-4"].icon,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "missile-turret"
        }
    },
    prerequisites = {"military-4"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
        {"high-tech-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 45
    },
    order = "e-a-e"

}

data:extend{entity,item,recipe,technology}
