<?php
use Tygh\Registry;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

var_dump($mode);
if ($mode == 'search') {
	fn_add_breadcrumb(__('store_locator'));

	list($store_locations, $search) = fn_get_store_locations($_REQUEST);

	Tygh::$app['view']->assign('sl_settings', fn_get_store_locator_settings());
	Tygh::$app['view']->assign('store_locations', $store_locations);
	Tygh::$app['view']->assign('store_locator_search', $search);
}