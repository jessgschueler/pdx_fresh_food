SELECT 

    DISTINCT fresh_food_source.neighborhood,
    MAX(fresh_food_source.sextant) as sextant,
    COUNT(fresh_food_source.id) as food_source_count
From {{ref('fresh_food_source')}}
GROUP BY fresh_food_source.neighborhood
