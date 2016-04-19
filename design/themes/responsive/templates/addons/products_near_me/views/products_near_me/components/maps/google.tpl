<script src="https://maps.googleapis.com/maps/api/js" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function() {
        var options = {
            'map_container': '{$map_container}',
            'zoom_control':{if $sl_settings.google_zoom_control == 'Y'} true {else} false {/if},
            'scale_control':{if $sl_settings.google_scale_control == 'Y'} true {else} false {/if},
            'street_view_control':false,
            'zoom': {if !empty($sl_settings.google_zoom)} {$sl_settings.google_zoom} {else} 16 {/if},
            'map_type_control':{if $sl_settings.google_map_type_control == 'Y'} true {else} false {/if},
            'language': '{$smarty.const.CART_LANGUAGE|fn_products_near_me_google_langs}',
        };
    });
</script>
{script src="/js/addons/products_near_me/customer_google.js"}