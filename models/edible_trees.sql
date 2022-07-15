
SELECT
    Street_Trees.OBJECTID as tree_id,
    Street_Trees.Common as common_name,
    Street_Trees.Scientific as scientific_name,
    Street_Trees.neighborhood as neighborhood,
    Street_Trees.edible as fruit_or_nut
from {{ source('pdx_fresh_food', 'Street_Trees') }}
WHERE edible = 'fruit' OR edible = 'nut'