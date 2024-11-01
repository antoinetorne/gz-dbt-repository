with 

source as (

    select * from {{ source('raw', 'facebook') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        campgn_name AS campaign_name,
        ROUND(CAST(ads_cost AS FLOAT64),2) AS ads_cost,
        impression,
        click

    from source

)

select * from renamed
