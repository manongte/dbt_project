with c_unique_id as(
    select customer_id
    from {{ ref ('stg_customers') }}
    group by customer_id
    having count(*) > 1
)
select count(*)
from c_unique_id
having count(*) > 0