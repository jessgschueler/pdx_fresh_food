with neighbor_hood as (
    SELECT 
        DISTINCT fresh_food_source.neighborhood,
        MAX(fresh_food_source.sextant) as sextant,
        COUNT(fresh_food_source.id) as food_source_count
    From {{ref('fresh_food_source')}}
    GROUP BY fresh_food_source.neighborhood
),

trees as (
    SELECT
        COUNT(edible_trees.neighborhood) as number_of_trees,
        edible_trees.neighborhood as neighborhood,
    From {{ref('edible_trees')}}
    GROUP BY edible_trees.neighborhood
),

neighborhoods as (
    SELECT * FROM neighbor_hood

    left join trees using(neighborhood)
)

Select * from neighborhoods