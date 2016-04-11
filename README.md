Installation
============

## Web Server Environment

The minimum requirement by this project template is that your Web server supports PHP 5.4.0. (we recommend version 5.6 for CS-Cart and Multi-Vendor 4.3.x)<br>
MySQL version 4.1 or higher (MySQLi or pdo_mysql should be supported)

## Server Configuration Requirements

1.safe_mode PHP directive should be disabled
2.file_uploads, allow_url_fopen PHP directives should be enabled
3.magic_quotes_gpc, magic_quotes_runtime, magic_quotes_sybase PHP directives should be disabled in PHP 5.3 (ignore this if you have PHP 5.4 or higher)
4.the following PHP commands should be enabled: ini_set, ftp_exec, ftp_connect, ftp_login, ftp_get, ftp_put, ftp_nb_fput, ftp_raw, ftp_rawlist, mysql_pconnect, eva, system, exec, shell_exec, passthru, escapeshellarg, set_time_limit
5.GD library or Imagick library should be installed. Please make sure your GD configuration includes the FreeType font library.
6.cURL support should be enabled. You need this PHP extension to ensure support of secure connections, some payment systems such as PayPal and Authorize.Net, and real-time shipping rate calculators for FedEx and DHL/Airborne.
7.Phar extension should be enabled (built into PHP since v5.3.0)
8.ZipArchive extension should be enabled (built into PHP since v5.2.0)
9..htaccess file (if supported) should have the following directives allowed: DirectoryIndex, Deny, Allow, Options, Order, AddHandler, RewriteEngine, RewriteBase, RewriteCond, and RewriteRule

## Preparing application
Apply database via Sypex Dumper

    1.Open an URL http://domain.com/sxd/ in browser.
    2.Enter the username and password for your database.