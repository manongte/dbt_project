with unique_id as(
    select order_id
    from {{ ref ('stg_orders') }}
    group by order_id
    having count(*) > 1
)

select count(*)
from unique_id
having count(*) > 0