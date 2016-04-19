<?php
/***************************************************************************
*                                                                          *
*   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
*                                                                          *
* This  is  commercial  software,  only  users  who have purchased a valid *
* license  and  accept  to the terms of the  License Agreement can install *
* and use this program.                                                    *
*                                                                          *
****************************************************************************
* PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
* "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
****************************************************************************/

if (!defined('BOOTSTRAP')) { die('Access denied'); }

use Tygh\Settings;
use Tygh\Registry;

function fn_update_products_near_me($products_near_me_data, $products_id, $lang_code = DESCR_SL)
{
	$products_near_me_data['product_id'] = $products_id;
	db_query("REPLACE INTO ?:products_near_me ?e", $products_near_me_data);

	foreach (fn_get_translation_languages() as $products_near_me_data['lang_code'] => $v) {
		db_query("REPLACE INTO ?:products_near_me_descriptions ?e", $products_near_me_data);
	}
	return $products_id;
}
function fn_get_products_near_me($product_id, $lang_code = CART_LANGUAGE)
{
	$fields = array (
		'?:products_near_me.*',
		'?:products_near_me_descriptions.*',
		'?:country_descriptions.country as country_title'
	);

	$join = db_quote(" LEFT JOIN ?:products_near_me_descriptions ON ?:products_near_me.product_id = ?:products_near_me_descriptions.product_id AND ?:products_near_me_descriptions.lang_code = ?s", $lang_code);
	$join .= db_quote(" LEFT JOIN ?:country_descriptions ON ?:products_near_me.country = ?:country_descriptions.code AND ?:country_descriptions.lang_code = ?s", $lang_code);

	$condition = db_quote(" ?:products_near_me.product_id = ?i ", $product_id);
	$condition .= (AREA == 'C' && defined('CART_LOCALIZATION')) ? fn_get_localizations_condition('?:products_near_me.localization') : '';

	$store_location = db_get_row('SELECT ?p FROM ?:products_near_me ?p WHERE ?p', implode(', ', $fields), $join, $condition);

	return $store_location;
}
function fn_products_near_me_google_langs($lang_code)
{
	$supported_langs = array ('en', 'eu', 'ca', 'da', 'nl', 'fi', 'fr', 'gl', 'de', 'el', 'it', 'ja', 'no', 'nn', 'ru' , 'es', 'sv', 'th');

	if (in_array($lang_code, $supported_langs)) {
		return $lang_code;
	}

	return '';
}
function fn_get_products_near_me_map_templates($area)
{
	$templates = array();

	if (empty($area) || !in_array($area, array('A', 'C'))) {
		return $templates;
	}

	$skin_path = fn_get_theme_path('[themes]/[theme]', $area);
	$relative_directory_path = 'addons/products_near_me/views/products_near_me/components/maps/';
	$template_path =  $skin_path . '/templates/' . $relative_directory_path;
	$_templates = fn_get_dir_contents($template_path, false, true, '.tpl');

	if (!empty($_templates)) {
		foreach ($_templates as $template) {
			$template_provider = str_replace('.tpl', '', strtolower($template)); // Get provider name
			$templates[$template_provider] = $relative_directory_path . $template;
		}
	}

	return $templates;
}
function fn_get_products_near_me_settings($company_id = null)
{
	static $cache;

	if (empty($cache['settings_' . $company_id])) {
		$settings = Settings::instance()->getValue('products_near_me_', '', $company_id);
		$settings = unserialize($settings);

		if (empty($settings)) {
			$settings = array();
		}

		$cache['settings_' . $company_id] = $settings;
	}

	return $cache['settings_' . $company_id];
}