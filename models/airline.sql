
      

  
{{ config (
    materialized="table"
)}}
    
-- Final base SQL model
-- depends_on: "dev".public."airline_scd"
select
    _airbyte_unique_key,
    _ab_cdc_log_file,
    iata,
    base_airport,
    _ab_cdc_log_pos,
    _ab_cdc_updated_at,
    _ab_cdc_deleted_at,
    airline_id,
    airlinename,
    _ab_cdc_cursor,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    getdate() as _airbyte_normalized_at,
    _airbyte_airline_hashid
from "dev".public."airline_scd"
-- airline from "dev".public._airbyte_raw_airline
where 1 = 1
and _airbyte_active_row = 1

  );
  