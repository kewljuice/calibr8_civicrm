# ************************************************************
# Create mysql databases
# ************************************************************
CREATE DATABASE IF NOT EXISTS `%drupal_db%`;
CREATE DATABASE IF NOT EXISTS `%civicrm_db%`;
CREATE DATABASE IF NOT EXISTS `%civicrm_log_db%`;

# ************************************************************
# Reset all users
# ************************************************************
DROP USER IF EXISTS '%drupal_db_user%'@'%';
DROP USER IF EXISTS '%civicrm_db_user%'@'%';
DROP USER IF EXISTS '%civicrm_log_db_user%'@'%';

CREATE USER '%drupal_db_user%'@'%' IDENTIFIED BY '%drupal_db_pass%';
CREATE USER '%civicrm_db_user%'@'%' IDENTIFIED BY '%civicrm_db_pass%';
CREATE USER '%civicrm_log_db_user%'@'%' IDENTIFIED BY '%civicrm_log_db_pass%';

# ************************************************************
# Grants for db_drupal user
# ************************************************************
GRANT SUPER ON *.* TO '%drupal_db_user%'@'%';
GRANT SELECT ON `%civicrm_db%`.* TO '%drupal_db_user%'@'%';
GRANT ALL PRIVILEGES ON `%drupal_db%`.* TO '%drupal_db_user%'@'%';

# ************************************************************
# Grants for db_civicrm user
# ************************************************************
GRANT SUPER ON *.* TO '%civicrm_db_user%'@'%';
GRANT ALL PRIVILEGES ON `%civicrm_db%`.* TO '%civicrm_db_user%'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `%civicrm_log_db%`.* TO '%civicrm_db_user%'@'%' WITH GRANT OPTION;

# ************************************************************
# Grants for db_civicrmlog user
# ************************************************************
GRANT USAGE ON *.* TO '%civicrm_log_db_user%'@'%';
GRANT ALL PRIVILEGES ON `%civicrm_log_db%`.* TO '%civicrm_log_db_user%'@'%' WITH GRANT OPTION;
