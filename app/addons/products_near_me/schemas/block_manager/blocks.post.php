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

$schema['products_near_me'] = array(
    'templates' => array(
        'addons/products_near_me/blocks/products_near_me.tpl' => array(),
    ),
    'wrappers' => 'blocks/wrappers',
    'cache' => array(
        'disable_cache_when' => array(
            'request_handlers' => array('q')
        )
    )
);

return $schema;
