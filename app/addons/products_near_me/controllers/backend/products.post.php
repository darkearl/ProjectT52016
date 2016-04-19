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

use Tygh\Registry;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

/* POST data processing */
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	fn_trusted_vars('products_near_me', 'products_near_me_data');
	if ($mode == 'update') {
		fn_update_products_near_me($_REQUEST['products_near_me_data'], $_REQUEST['product_id'], DESCR_SL);
	}
	return;
}
if ($mode == 'update') {
	$products_near_me = fn_get_products_near_me($_REQUEST['product_id'], DESCR_SL);
	Tygh::$app['view']->assign('products_near_me', $products_near_me);
	Registry::set('navigation.tabs.products_near_me', array (
		'title' => __('products_near_me_locale'),
		'js' => true
	));

}