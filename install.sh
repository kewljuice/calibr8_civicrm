#!/usr/bin/env bash
$DOCKER_EXEC=$1
$PROJECT_ROOT=$2

# Add 'vcs' folders to composer.json.
$DOCKER_EXEC composer config repositories.calibr8_civicrm vcs https://github.com/kewljuice/calibr8_civicrm
$DOCKER_EXEC composer config repositories.civicrm-packages vcs https://github.com/civicrm/civicrm-packages
$DOCKER_EXEC composer config repositories.zetacomponents-mail vcs https://github.com/civicrm/zetacomponents-mail.git
$DOCKER_EXEC composer config repositories.civicrm-libraries vcs https://github.com/wannesderoy/civicrm-libraries
$DOCKER_EXEC composer config repositories.civicrm-drupal-8 vcs https://github.com/civicrm/civicrm-drupal-8
$DOCKER_EXEC composer config repositories.civicrm-l10n vcs https://github.com/wannesderoy/civicrm-l10n

# Add 'vcs' folders to composer.json.
$DOCKER_EXEC require calibrate/calibr8_civicrm
$DOCKER_EXEC run composer install

# Copy folders to right directories.
cp -rf $PROJECT_ROOT/data/www/vendor/civicrm/civicrm-packages $PROJECT_ROOT/data/www/vendor/civicrm/civicrm-core/packages/
cp -rf $PROJECT_ROOT/data/www/web/libraries/civicrm/bower_components $PROJECT_ROOT/data/www/vendor/civicrm/civicrm-core
cp -rf $PROJECT_ROOT/data/www/web/libraries/civicrm-l10n $PROJECT_ROOT/data/www/vendor/civicrm/civicrm-core/l10n
