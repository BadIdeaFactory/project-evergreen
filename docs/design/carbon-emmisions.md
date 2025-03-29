# Carbon Emissions

Emission categories and tuning are sourced from EDGAR (Emissions Database for Global Atmospheric Research.)[[1]](#1) 

## Carbon Sources (Fossil-Based)

Each country generates fossil-based emissions over time. 

1. Power Industry 
    1. Power plants
    2. Heat generation plants
2. Buildings 
    1. Small scale non-industrial combustion
3. Transport 
    1. Road
    2. Non-road
    3. Aviation
    4. Inland waterways
    5. International shipping
4. Other Sectors 
    1. Industrial processes
    2. Agricultural soils (urea fertilization and lime)
    3. Waste
5. Other Industrial Combustion 
    1. Combustion for industrial manufacturing and fuel production

## Carbon Sources / Sinks (CO<sub>2</sub> Land Use, Land-Use Change, and Forestry / LOLUCF)

These will be tracked and displayed on a macro-region basis.

Due to the complexity of terrestrial ecosystems, these factors can be sources or sinks. However, forest land is overall an effective sink and will play a large role in game mechanics. Likewise, deforestation and fires will play significant roles as carbon sources.

1. Deforestation
    1. Forest conversion to other categories.
2. Drainage of organic soil
3. Fires 
    1. Forest fires
    2. Peat fires
    3. Shrubland fires
    4. Non-tropical savannah fires
4. Other
    1. Cropland
    2. Settlements
    3. Wetlands
    4. Grassland
    5. Non-biomass forest pools
5. Forest land
    1. Living biomass, excludes deforestation

## Tuning

For carbon sources and sinks, countries and macro regions will be initialized to the closest data points available based on the start time of the game.

The amount of carbon dioxide in the atmosphere will be sources from NASA's direct measurements.[[2]](#2) 

## Emissions Calculations

The amount of carbon in the atmosphere will be calculated on a monthly basis, on the first of each month, for performance reasons.

## References

<a id="1">[1]</a>
[European Union, CO2 emissions of all world countries - JRC/IEA/PBL 2022 Report](https://edgar.jrc.ec.europa.eu/booklet/CO2_emissions_of_all_world_countries_2022_report.pdf)

<a id="2">[2]</a> 
[NASA, Carbon Dioxide](https://climate.nasa.gov/vital-signs/carbon-dioxide/?intent=121)