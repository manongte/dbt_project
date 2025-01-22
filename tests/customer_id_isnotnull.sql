with c_id_is_null as(
    select *
    from {{ ref ('stg_customers') }}
    where customer_id IS NULL
)
select count(*)
from c_id_is_null
having count(*) > 0