with ids_is_null as(
    -- order_id
    select *
    from {{ ref ('stg_orders') }}
    where order_id IS NULL

    UNION ALL 
    -- customer_id
    select *
    from {{ ref ('stg_orders') }}
    where customer_id IS NULL

    UNION ALL
    -- store_id
    select *
    from {{ ref ('stg_orders') }}
    where store_id IS NULL
)
select count(*)
from ids_is_null
having count(*) > 0