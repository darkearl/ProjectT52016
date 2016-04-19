{if !$smarty.capture.$map_provider_api}
<script src="http://www.google.com/jsapi"></script>
<script src="http://maps.googleapis.com/maps/api/js?v=3&amp;sensor=false&amp;language={$smarty.const.CART_LANGUAGE|fn_products_near_me_google_langs}" type="text/javascript"></script>
{script src="/js/addons/products_near_me/google.js"}
{capture name="`$map_provider_api`"}Y{/capture}
{/if}

<script type="text/javascript">
    {literal}
    (function(_, $) {
        options = {
            {/literal}
            'latitude': {$smarty.const.PRODUCTS_NEAR_ME_DEFAULT_LATITUDE|doubleval},
            'longitude': {$smarty.const.PRODUCTS_NEAR_ME_DEFAULT_LATITUDE|doubleval},
            'map_container': '{$map_container}'
            {literal}
        };

        $.ceMap('init', options);
    }(Tygh, Tygh.$));
    {/literal}
</script>