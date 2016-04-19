<div id="content_my_changes" class="hidden">
    {include file="addons/store_locator/pickers/map.tpl"}
    <form action="{""|fn_url}" method="post" class="form-horizontal form-edit" name="store_locations_form{$suffix}">
        <input type="hidden" name="store_location_id" value="{$id}" />
        <input type="hidden" class="cm-no-hide-input" name="selected_section" value="{$smarty.request.selected_section|default:"detailed"}" />

        <div id="content_detailed">
            <fieldset>
                <div class="control-group">
                    <label for="elm_name" class="cm-required control-label">{__("name")}:</label>
                    <div class="controls">
                        <input type="text" id="elm_name" name="store_location_data[name]" value="{$store_location.name}">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="elm_position">{__("position")}:</label>
                    <div class="controls">
                        <input type="text" name="store_location_data[position]" id="elm_position" value="{$store_location.position}" size="3">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="elm_description">{__("description")}:</label>
                    <div class="controls">
                        <textarea id="elm_description" name="store_location_data[description]" cols="55" rows="2" class="cm-wysiwyg input-textarea-long">{$store_location.description}</textarea>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="elm_country">{__("country")}:</label>
                    <div class="controls">
                        {assign var="countries" value=1|fn_get_simple_countries:$smarty.const.CART_LANGUAGE}
                        <select id="elm_country" name="store_location_data[country]" class="select">
                            <option value="">- {__("select_country")} -</option>
                            {foreach from=$countries item="country" key="code"}
                                <option {if $store_location.country == $code}selected="selected"{/if} value="{$code}" title="{$country}">{$country}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="elm_city">{__("city")}:</label>
                    <div class="controls">
                        <input type="text" name="store_location_data[city]" id="elm_city" value="{$store_location.city}">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label cm-required">{__("coordinates")} ({__("latitude_short")} &times; {__("longitude_short")}):</label>
                    <label class="control-label cm-required hidden" for="elm_latitude">{__("latitude")}</label>
                    <label class="control-label cm-required hidden" for="elm_longitude">{__("longitude")}</label>
                    <div class="controls">
                        <input type="hidden" id="elm_latitude_hidden" value="{$store_location.latitude}" />
                        <input type="hidden" id="elm_longitude_hidden" value="{$store_location.longitude}" />
                        <input type="text" name="store_location_data[latitude]" id="elm_latitude" value="{$store_location.latitude}" class="input-small">
                        &times;
                        <input type="text" name="store_location_data[longitude]" id="elm_longitude" value="{$store_location.longitude}" class="input-small">

                        {include file="buttons/button.tpl" but_text=__("select") but_role="action" but_meta="btn-primary cm-map-dialog"}
                    </div>
                </div>

                {include file="views/localizations/components/select.tpl" data_from=$store_location.localization data_name="store_location_data[localization]"}
            </fieldset>
        </div>

    </form>
</div>