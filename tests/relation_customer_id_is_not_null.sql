with relation_customer_id as(
    select o.customer_id
    from {{ ref ('stg_orders') }} o
    left join {{ ref ('stg_customers') }} c USING (customer_id)
    where c.customer_id IS NULL   
)
select count(*)
from relation_customer_id
having count(*) > 0