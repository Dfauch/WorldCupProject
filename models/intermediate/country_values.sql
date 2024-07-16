with country_value as (
    select 
    *
    from {{ ref('stg_raw_dataset__players')}}
)

select
    *
from  country_value

