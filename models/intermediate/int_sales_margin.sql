SELECT 
    tsales.*,
    tsales.quantity*tproduct.purchase_price AS purchase_cost,
    ROUND(tsales.revenue-(tsales.quantity*tproduct.purchase_price),2) AS margin,

FROM {{ ref('stg_raw__sales') }} AS tsales

INNER JOIN {{ ref('stg_raw__product') }} AS tproduct

    USING(products_id)