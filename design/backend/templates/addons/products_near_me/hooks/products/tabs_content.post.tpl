<div id="content_products_near_me" class="hidden">
    {include file="addons/products_near_me/pickers/map.tpl"}
        <input type="hidden" class="cm-no-hide-input" name="selected_section" value="{$smarty.request.selected_section|default:"detailed"}" />

        <div id="content_detailed">
            <fieldset>
                <div class="control-group">
                    <label for="elm_name" class="cm-required control-label">{__("name")}:</label>
                    <div class="controls">
                        <input type="text" id="elm_name" name="products_near_me_data[name]" value="{$products_near_me.name}">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="elm_description">{__("description")}:</label>
                    <div class="controls">
                        <textarea id="elm_description" name="products_near_me_data[description]" cols="55" rows="2" class="cm-wysiwyg input-textarea-long">{$products_near_me.description}</textarea>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="elm_country">{__("country")}:</label>
                    <div class="controls">
                        {assign var="countries" value=1|fn_get_simple_countries:$smarty.const.CART_LANGUAGE}
                        <select id="elm_country" name="products_near_me_data[country]" class="select">
                            <option value="">- {__("select_country")} -</option>
                            {foreach from=$countries item="country" key="code"}
                                <option {if $products_near_me.country == $code}selected="selected"{/if} value="{$code}" title="{$country}">{$country}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="elm_city">{__("city")}:</label>
                    <div class="controls">
                        <input type="text" name="products_near_me_data[city]" id="elm_city" value="{$products_near_me.city}">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label cm-required">{__("coordinates")} ({__("latitude_short")} &times; {__("longitude_short")}):</label>
                    <label class="control-label cm-required hidden" for="elm_latitude">{__("latitude")}</label>
                    <label class="control-label cm-required hidden" for="elm_longitude">{__("longitude")}</label>
                    <div class="controls">
                        <input type="hidden" id="elm_latitude_hidden" value="{$products_near_me.latitude}" />
                        <input type="hidden" id="elm_longitude_hidden" value="{$products_near_me.longitude}" />
                        <input type="text" name="products_near_me_data[latitude]" id="elm_latitude" value="{$products_near_me.latitude}" class="input-small">
                        &times;
                        <input type="text" name="products_near_me_data[longitude]" id="elm_longitude" value="{$products_near_me.longitude}" class="input-small">

                        {include file="buttons/button.tpl" but_text=__("select") but_role="action" but_meta="btn-primary cm-map-dialog"}
                    </div>
                </div>

                {include file="views/localizations/components/select.tpl" data_from=$products_near_me.localization data_name="products_near_me_data[localization]"}
            </fieldset>
        </div>

</div>