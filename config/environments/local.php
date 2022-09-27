<?php

use Hyperdrive\Config\Config;

Config::define('SAVEQUERIES', true);
Config::define('WP_DEBUG', true);
Config::define('WP_DEBUG_LOG', __DIR__ . sprintf('/logs/%s-debug.log', date('Y-m')));
Config::define('WP_DEBUG_DISPLAY', false);
Config::define('WP_DISABLE_FATAL_ERROR_HANDLER', true);
Config::define('SCRIPT_DEBUG', true);

ini_set('display_errors', '1');
