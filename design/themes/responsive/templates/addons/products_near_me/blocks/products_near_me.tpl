{** block-description:products_near_me **}
{assign var="map_provider" value=$addons.products_near_me.map_provider}
{assign var="map_provider_api" value="`$map_provider`_map_api"}
{assign var="map_customer_templates" value="C"|fn_get_products_near_me_map_templates}
{assign var="map_container" value="mapContainer"}
{if $map_customer_templates && $map_customer_templates.$map_provider}
    {include file=$map_customer_templates.$map_provider}
{/if}
<div class="ty-products-near-me">
    <div class="search">
        <input type="text" id="addressInput" size="10"/>
        <select id="radiusSelect">
            <option value="25" selected>25mi</option>
            <option value="100">100mi</option>
            <option value="200">200mi</option>
        </select>

        <input type="button" class="searchLocations" value="Search"/>

        <input type="button" class="searchLocationsNearMe" value="Search near me"/>

    </div>
    <div><select id="locationSelect" style="width:100%;visibility:hidden"></select></div>
    <div class="{$map_container}">
        <div id="map" style="width: 100%; height: 500px"></div>
    </div>
</div>

{capture name="mainbox_title"}{__("products_near_me")}{/capture}