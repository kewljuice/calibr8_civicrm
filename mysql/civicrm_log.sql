# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: civicrm_civicrmlog
# Generation Time: 2018-10-22 15:39:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table log_civicrm_acl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_acl`;

CREATE TABLE `log_civicrm_acl` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique table ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ACL Name.',
  `deny` tinyint(4) DEFAULT '0' COMMENT 'Is this ACL entry Allow  (0) or Deny (1) ?',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Table of the object possessing this ACL entry (Contact, Group, or ACL Group)',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the object possessing this ACL',
  `operation` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'What operation does this ACL entry control?',
  `object_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The table of the object controlled by this ACL entry',
  `object_id` int(10) unsigned DEFAULT NULL COMMENT 'The ID of the object controlled by this ACL entry',
  `acl_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'If this is a grant/revoke entry, what table are we granting?',
  `acl_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the ACL or ACL group being granted/revoked',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this property active?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_acl_entity_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_acl_entity_role`;

CREATE TABLE `log_civicrm_acl_entity_role` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique table ID',
  `acl_role_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign Key to ACL Role (which is an option value pair and hence an implicit FK)',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Table of the object joined to the ACL Role (Contact or Group)',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the group/contact object being joined',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this property active?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_action_mapping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_action_mapping`;

CREATE TABLE `log_civicrm_action_mapping` (
  `id` int(10) unsigned DEFAULT NULL,
  `entity` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity for which the reminder is created',
  `entity_value` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity value',
  `entity_value_label` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity value label',
  `entity_status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity status',
  `entity_status_label` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity status label',
  `entity_date_start` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity date',
  `entity_date_end` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity date',
  `entity_recipient` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity recipient',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_action_schedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_action_schedule`;

CREATE TABLE `log_civicrm_action_schedule` (
  `id` int(10) unsigned DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of the action(reminder)',
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Title of the action(reminder)',
  `recipient` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Recipient',
  `limit_to` tinyint(4) DEFAULT NULL,
  `entity_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity value',
  `entity_status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity status',
  `start_action_offset` int(10) unsigned DEFAULT '0' COMMENT 'Reminder Interval.',
  `start_action_unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Time units for reminder.',
  `start_action_condition` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Reminder Action',
  `start_action_date` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity date',
  `is_repeat` tinyint(4) DEFAULT '0',
  `repetition_frequency_unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Time units for repetition of reminder.',
  `repetition_frequency_interval` int(10) unsigned DEFAULT '0' COMMENT 'Time interval for repeating the reminder.',
  `end_frequency_unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Time units till repetition of reminder.',
  `end_frequency_interval` int(10) unsigned DEFAULT '0' COMMENT 'Time interval till repeating the reminder.',
  `end_action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Reminder Action till repeating the reminder.',
  `end_date` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity end date',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this option active?',
  `recipient_manual` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Contact IDs to which reminder should be sent.',
  `recipient_listing` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'listing based on recipient field.',
  `body_text` longtext COLLATE utf8_unicode_ci COMMENT 'Body of the mailing in text format.',
  `body_html` longtext COLLATE utf8_unicode_ci COMMENT 'Body of the mailing in html format.',
  `sms_body_text` longtext COLLATE utf8_unicode_ci COMMENT 'Body of the mailing in html format.',
  `subject` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Subject of mailing',
  `record_activity` tinyint(4) DEFAULT NULL COMMENT 'Record Activity for this reminder?',
  `mapping_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name/ID of the mapping to use on this table',
  `group_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Group',
  `msg_template_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the message template.',
  `sms_template_id` int(10) unsigned DEFAULT NULL COMMENT 'SMS Reminder Template. FK to id in civicrm_msg_template.',
  `absolute_date` date DEFAULT NULL COMMENT 'Date on which the reminder be sent.',
  `from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mode` varchar(128) COLLATE utf8_unicode_ci DEFAULT 'Email' COMMENT 'Send the message as email or sms or both.',
  `sms_provider_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_sms_provider id ',
  `used_for` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Used for repeating entity',
  `filter_contact_language` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Used for multilingual installation',
  `communication_language` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Used for multilingual installation',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_activity`;

CREATE TABLE `log_civicrm_activity` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique  Other Activity ID',
  `source_record_id` int(10) unsigned DEFAULT NULL COMMENT 'Artificial FK to original transaction (e.g. contribution) IF it is not an Activity. Table can be figured out through activity_type_id, and further through component registry.',
  `activity_type_id` int(10) unsigned DEFAULT '1' COMMENT 'FK to civicrm_option_value.id, that has to be valid, registered activity type.',
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The subject/purpose/short description of the activity.',
  `activity_date_time` datetime DEFAULT NULL COMMENT 'Date and time this activity is scheduled to occur. Formerly named scheduled_date_time.',
  `duration` int(10) unsigned DEFAULT NULL COMMENT 'Planned or actual duration of activity expressed in minutes. Conglomerate of former duration_hours and duration_minutes.',
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Location of the activity (optional, open text).',
  `phone_id` int(10) unsigned DEFAULT NULL COMMENT 'Phone ID of the number called (optional - used if an existing phone number is selected).',
  `phone_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Phone number in case the number does not exist in the civicrm_phone table.',
  `details` longtext COLLATE utf8_unicode_ci COMMENT 'Details about the activity (agenda, notes, etc).',
  `status_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the status this activity is currently in. Foreign key to civicrm_option_value.',
  `priority_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the priority given to this activity. Foreign key to civicrm_option_value.',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent meeting ID (if this is a follow-up item). This is not currently implemented',
  `is_test` tinyint(4) DEFAULT '0',
  `medium_id` int(10) unsigned DEFAULT NULL COMMENT 'Activity Medium, Implicit FK to civicrm_option_value where option_group = encounter_medium.',
  `is_auto` tinyint(4) DEFAULT '0',
  `relationship_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Relationship ID',
  `is_current_revision` tinyint(4) DEFAULT '1',
  `original_id` int(10) unsigned DEFAULT NULL COMMENT 'Activity ID of the first activity record in versioning chain.',
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Currently being used to store result id for survey activity, FK to option value.',
  `is_deleted` tinyint(4) DEFAULT '0',
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'The campaign for which this activity has been triggered.',
  `engagement_level` int(10) unsigned DEFAULT NULL COMMENT 'Assign a specific level of engagement to this activity. Used for tracking constituents in ladder of engagement.',
  `weight` int(11) DEFAULT NULL,
  `is_star` tinyint(4) DEFAULT '0' COMMENT 'Activity marked as favorite.',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'When was the activity was created.',
  `modified_date` timestamp NULL DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_activity_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_activity_contact`;

CREATE TABLE `log_civicrm_activity_contact` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Activity contact id',
  `activity_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to the activity for this record.',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to the contact for this record.',
  `record_type_id` int(10) unsigned DEFAULT NULL COMMENT 'The record type id for this row',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_address`;

CREATE TABLE `log_civicrm_address` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Address ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `location_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Location does this address belong to.',
  `is_primary` tinyint(4) DEFAULT '0' COMMENT 'Is this the primary address.',
  `is_billing` tinyint(4) DEFAULT '0' COMMENT 'Is this the billing address.',
  `street_address` varchar(96) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Concatenation of all routable street address components (prefix, street number, street name, suffix, unit number OR P.O. Box). Apps should be able to determine physical location with this data (for mapping, mail delivery, etc.).',
  `street_number` int(11) DEFAULT NULL COMMENT 'Numeric portion of address number on the street, e.g. For 112A Main St, the street_number = 112.',
  `street_number_suffix` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Non-numeric portion of address number on the street, e.g. For 112A Main St, the street_number_suffix = A',
  `street_number_predirectional` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Directional prefix, e.g. SE Main St, SE is the prefix.',
  `street_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Actual street name, excluding St, Dr, Rd, Ave, e.g. For 112 Main St, the street_name = Main.',
  `street_type` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'St, Rd, Dr, etc.',
  `street_number_postdirectional` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Directional prefix, e.g. Main St S, S is the suffix.',
  `street_unit` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Secondary unit designator, e.g. Apt 3 or Unit # 14, or Bldg 1200',
  `supplemental_address_1` varchar(96) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Supplemental Address Information, Line 1',
  `supplemental_address_2` varchar(96) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Supplemental Address Information, Line 2',
  `supplemental_address_3` varchar(96) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Supplemental Address Information, Line 3',
  `city` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'City, Town or Village Name.',
  `county_id` int(10) unsigned DEFAULT NULL COMMENT 'Which County does this address belong to.',
  `state_province_id` int(10) unsigned DEFAULT NULL COMMENT 'Which State_Province does this address belong to.',
  `postal_code_suffix` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Store the suffix, like the +4 part in the USPS system.',
  `postal_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usps_adc` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'USPS Bulk mailing code.',
  `country_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Country does this address belong to.',
  `geo_code_1` double DEFAULT NULL COMMENT 'Latitude',
  `geo_code_2` double DEFAULT NULL COMMENT 'Longitude',
  `manual_geo_code` tinyint(4) DEFAULT '0' COMMENT 'Is this a manually entered geo code',
  `timezone` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Timezone expressed as a UTC offset - e.g. United States CST would be written as "UTC-6".',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `master_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Address ID',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_address_format
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_address_format`;

CREATE TABLE `log_civicrm_address_format` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Address Format Id',
  `format` text COLLATE utf8_unicode_ci COMMENT 'The format of an address',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_batch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_batch`;

CREATE TABLE `log_civicrm_batch` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Address ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Variable name/programmatic handle for this batch.',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `created_date` datetime DEFAULT NULL COMMENT 'When was this item created',
  `modified_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `modified_date` datetime DEFAULT NULL COMMENT 'When was this item created',
  `saved_search_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Saved Search ID',
  `status_id` int(10) unsigned DEFAULT NULL COMMENT 'fk to Batch Status options in civicrm_option_values',
  `type_id` int(10) unsigned DEFAULT NULL COMMENT 'fk to Batch Type options in civicrm_option_values',
  `mode_id` int(10) unsigned DEFAULT NULL COMMENT 'fk to Batch mode options in civicrm_option_values',
  `total` decimal(20,2) DEFAULT NULL COMMENT 'Total amount for this batch.',
  `item_count` int(10) unsigned DEFAULT NULL COMMENT 'Number of items in a batch.',
  `payment_instrument_id` int(10) unsigned DEFAULT NULL COMMENT 'fk to Payment Instrument options in civicrm_option_values',
  `exported_date` datetime DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT 'cache entered data',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_campaign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_campaign`;

CREATE TABLE `log_civicrm_campaign` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Campaign ID.',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of the Campaign.',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Title of the Campaign.',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Full description of Campaign.',
  `start_date` datetime DEFAULT NULL COMMENT 'Date and time that Campaign starts.',
  `end_date` datetime DEFAULT NULL COMMENT 'Date and time that Campaign ends.',
  `campaign_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Campaign Type ID.Implicit FK to civicrm_option_value where option_group = campaign_type',
  `status_id` int(10) unsigned DEFAULT NULL COMMENT 'Campaign status ID.Implicit FK to civicrm_option_value where option_group = campaign_status',
  `external_identifier` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Unique trusted external ID (generally from a legacy app/datasource). Particularly useful for deduping operations.',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Optional parent id for this Campaign.',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this Campaign enabled or disabled/cancelled?',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who created this Campaign.',
  `created_date` datetime DEFAULT NULL COMMENT 'Date and time that Campaign was created.',
  `last_modified_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who recently edited this Campaign.',
  `last_modified_date` datetime DEFAULT NULL COMMENT 'Date and time that Campaign was edited last time.',
  `goal_general` text COLLATE utf8_unicode_ci COMMENT 'General goals for Campaign.',
  `goal_revenue` decimal(20,2) DEFAULT NULL COMMENT 'The target revenue for this campaign.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_campaign_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_campaign_group`;

CREATE TABLE `log_civicrm_campaign_group` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Campaign Group id.',
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to the activity Campaign.',
  `group_type` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Type of Group.',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of table where item being referenced is stored.',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Entity id of referenced table.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_case
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_case`;

CREATE TABLE `log_civicrm_case` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Case ID',
  `case_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_case_type.id',
  `subject` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Short name of the case.',
  `start_date` date DEFAULT NULL COMMENT 'Date on which given case starts.',
  `end_date` date DEFAULT NULL COMMENT 'Date on which given case ends.',
  `details` text COLLATE utf8_unicode_ci COMMENT 'Details about the meeting (agenda, notes, etc).',
  `status_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of case status.',
  `is_deleted` tinyint(4) DEFAULT '0',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'When was the case was created.',
  `modified_date` timestamp NULL DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_case_activity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_case_activity`;

CREATE TABLE `log_civicrm_case_activity` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique case-activity association id',
  `case_id` int(10) unsigned DEFAULT NULL COMMENT 'Case ID of case-activity association.',
  `activity_id` int(10) unsigned DEFAULT NULL COMMENT 'Activity ID of case-activity association.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_case_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_case_contact`;

CREATE TABLE `log_civicrm_case_contact` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique case-contact association id',
  `case_id` int(10) unsigned DEFAULT NULL COMMENT 'Case ID of case-contact association.',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Contact ID of contact record given case belongs to.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_case_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_case_type`;

CREATE TABLE `log_civicrm_case_type` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Autoincremented type id',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Machine name for Case Type',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this entry active?',
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'Is this case type a predefined system type?',
  `weight` int(11) DEFAULT '1' COMMENT 'Ordering of the case types',
  `definition` blob COMMENT 'xml definition of case type',
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_component
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_component`;

CREATE TABLE `log_civicrm_component` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Component ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of the component.',
  `namespace` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Path to components main directory in a form of a class\nnamespace.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_contact`;

CREATE TABLE `log_civicrm_contact` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Contact ID',
  `contact_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Type of Contact.',
  `contact_sub_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'May be used to over-ride contact view and edit templates.',
  `do_not_email` tinyint(4) DEFAULT '0',
  `do_not_phone` tinyint(4) DEFAULT '0',
  `do_not_mail` tinyint(4) DEFAULT '0',
  `do_not_sms` tinyint(4) DEFAULT '0',
  `do_not_trade` tinyint(4) DEFAULT '0',
  `is_opt_out` tinyint(4) DEFAULT '0' COMMENT 'Has the contact opted out from receiving all bulk email from the organization or site domain?',
  `legal_identifier` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'May be used for SSN, EIN/TIN, Household ID (census) or other applicable unique legal/government ID.',
  `external_identifier` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name used for sorting different contact types',
  `display_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Formatted name representing preferred format for display/print/other output.',
  `nick_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nickname.',
  `legal_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Legal Name.',
  `image_URL` text COLLATE utf8_unicode_ci COMMENT 'optional URL for preferred image (photo, logo, etc.) to display for this contact.',
  `preferred_communication_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'What is the preferred mode of communication.',
  `preferred_language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Which language is preferred for communication. FK to languages in civicrm_option_value.',
  `preferred_mail_format` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'Both' COMMENT 'What is the preferred mode of sending an email.',
  `hash` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Key for validating requests related to this contact.',
  `api_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'API Key for validating requests related to this contact.',
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'where contact come from, e.g. import, donate module insert...',
  `first_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'First Name.',
  `middle_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Middle Name.',
  `last_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Last Name.',
  `prefix_id` int(10) unsigned DEFAULT NULL COMMENT 'Prefix or Title for name (Ms, Mr...). FK to prefix ID',
  `suffix_id` int(10) unsigned DEFAULT NULL COMMENT 'Suffix for name (Jr, Sr...). FK to suffix ID',
  `formal_title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Formal (academic or similar) title in front of name. (Prof., Dr. etc.)',
  `communication_style_id` int(10) unsigned DEFAULT NULL COMMENT 'Communication style (e.g. formal vs. familiar) to use with this contact. FK to communication styles in civicrm_option_value.',
  `email_greeting_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_option_value.id, that has to be valid registered Email Greeting.',
  `email_greeting_custom` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Custom Email Greeting.',
  `email_greeting_display` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Cache Email Greeting.',
  `postal_greeting_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_option_value.id, that has to be valid registered Postal Greeting.',
  `postal_greeting_custom` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Custom Postal greeting.',
  `postal_greeting_display` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Cache Postal greeting.',
  `addressee_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_option_value.id, that has to be valid registered Addressee.',
  `addressee_custom` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Custom Addressee.',
  `addressee_display` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Cache Addressee.',
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Job Title',
  `gender_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to gender ID',
  `birth_date` date DEFAULT NULL COMMENT 'Date of birth',
  `is_deceased` tinyint(4) DEFAULT '0',
  `deceased_date` date DEFAULT NULL COMMENT 'Date of deceased',
  `household_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Household Name.',
  `primary_contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Optional FK to Primary Contact for this household.',
  `organization_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Organization Name.',
  `sic_code` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Standard Industry Classification Code.',
  `user_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'the OpenID (or OpenID-style http://username.domain/) unique identifier for this contact mainly used for logging in to CiviCRM',
  `employer_id` int(10) unsigned DEFAULT NULL COMMENT 'OPTIONAL FK to civicrm_contact record.',
  `is_deleted` tinyint(4) DEFAULT '0',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'When was the contact was created.',
  `modified_date` timestamp NULL DEFAULT NULL COMMENT 'When was the contact (or closely related entity) was created or modified or deleted.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_contact_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_contact_type`;

CREATE TABLE `log_civicrm_contact_type` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Contact Type ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Internal name of Contact Type (or Subtype).',
  `image_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL of image if any.',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Optional FK to parent contact type.',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this entry active?',
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'Is this contact type a predefined system type',
  `label` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_contribution
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_contribution`;

CREATE TABLE `log_civicrm_contribution` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Contribution ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Financial Type for (total_amount - non_deductible_amount).',
  `contribution_page_id` int(10) unsigned DEFAULT NULL COMMENT 'The Contribution Page which triggered this contribution',
  `payment_instrument_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Payment Instrument',
  `receive_date` datetime DEFAULT NULL COMMENT 'when was gift received',
  `non_deductible_amount` decimal(20,2) DEFAULT '0.00' COMMENT 'Portion of total amount which is NOT tax deductible. Equal to total_amount for non-deductible financial types.',
  `total_amount` decimal(20,2) DEFAULT NULL COMMENT 'Total amount of this contribution. Use market value for non-monetary gifts.',
  `fee_amount` decimal(20,2) DEFAULT NULL COMMENT 'actual processor fee if known - may be 0.',
  `net_amount` decimal(20,2) DEFAULT NULL COMMENT 'actual funds transfer amount. total less fees. if processor does not report actual fee during transaction, this is set to total_amount.',
  `trxn_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'unique transaction id. may be processor id, bank id + trans id, or account number + check number... depending on payment_method',
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'unique invoice id, system generated or passed in',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `cancel_date` datetime DEFAULT NULL COMMENT 'when was gift cancelled',
  `cancel_reason` text COLLATE utf8_unicode_ci,
  `receipt_date` datetime DEFAULT NULL COMMENT 'when (if) receipt was sent. populated automatically for online donations w/ automatic receipting',
  `thankyou_date` datetime DEFAULT NULL COMMENT 'when (if) was donor thanked',
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Origin of this Contribution.',
  `amount_level` text COLLATE utf8_unicode_ci,
  `contribution_recur_id` int(10) unsigned DEFAULT NULL COMMENT 'Conditional foreign key to civicrm_contribution_recur id. Each contribution made in connection with a recurring contribution carries a foreign key to the recurring contribution record. This assumes we can track these processor initiated events.',
  `is_test` tinyint(4) DEFAULT '0',
  `is_pay_later` tinyint(4) DEFAULT '0',
  `contribution_status_id` int(10) unsigned DEFAULT '1',
  `address_id` int(10) unsigned DEFAULT NULL COMMENT 'Conditional foreign key to civicrm_address.id. We insert an address record for each contribution when we have associated billing name and address data.',
  `check_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'The campaign for which this contribution has been triggered.',
  `tax_amount` decimal(20,2) DEFAULT NULL COMMENT 'Total tax amount of this contribution.',
  `creditnote_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'unique credit note id, system generated or passed in',
  `revenue_recognition_date` datetime DEFAULT NULL COMMENT 'Stores the date when revenue should be recognized.',
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Human readable invoice number',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_contribution_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_contribution_page`;

CREATE TABLE `log_civicrm_contribution_page` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Contribution Id',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'default financial type assigned to contributions submitted via this page, e.g. Contribution, Campaign Contribution',
  `payment_processor` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Payment Processors configured for this contribution Page',
  `is_credit_card_only` tinyint(4) DEFAULT '0' COMMENT 'if true - processing logic must reject transaction at confirmation stage if pay method != credit card',
  `is_monetary` tinyint(4) DEFAULT '1' COMMENT 'if true - allows real-time monetary transactions otherwise non-monetary transactions',
  `is_recur` tinyint(4) DEFAULT '0' COMMENT 'if true - allows recurring contributions, valid only for PayPal_Standard',
  `is_confirm_enabled` tinyint(4) DEFAULT '1' COMMENT 'if false, the confirm page in contribution pages gets skipped',
  `recur_frequency_unit` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Supported recurring frequency units.',
  `is_recur_interval` tinyint(4) DEFAULT '0' COMMENT 'if true - supports recurring intervals',
  `is_recur_installments` tinyint(4) DEFAULT '0' COMMENT 'if true - asks user for recurring installments',
  `adjust_recur_start_date` tinyint(4) DEFAULT '0' COMMENT 'If true - user is able to adjust payment start date.',
  `is_pay_later` tinyint(4) DEFAULT '0' COMMENT 'if true - allows the user to send payment directly to the org later',
  `is_partial_payment` tinyint(4) DEFAULT '0' COMMENT 'is partial payment enabled for this online contribution page',
  `min_initial_amount` decimal(20,2) DEFAULT NULL COMMENT 'Minimum initial amount for partial payment',
  `is_allow_other_amount` tinyint(4) DEFAULT '0' COMMENT 'if true, page will include an input text field where user can enter their own amount',
  `default_amount_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_option_value.',
  `min_amount` decimal(20,2) DEFAULT NULL COMMENT 'if other amounts allowed, user can configure minimum allowed.',
  `max_amount` decimal(20,2) DEFAULT NULL COMMENT 'if other amounts allowed, user can configure maximum allowed.',
  `goal_amount` decimal(20,2) DEFAULT NULL COMMENT 'The target goal for this page, allows people to build a goal meter',
  `is_email_receipt` tinyint(4) DEFAULT '0' COMMENT 'if true, receipt is automatically emailed to contact on success',
  `receipt_from_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'FROM email address used for receipts generated by contributions to this contribution page.',
  `cc_receipt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'comma-separated list of email addresses to cc each time a receipt is sent',
  `bcc_receipt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'comma-separated list of email addresses to bcc each time a receipt is sent',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this property active?',
  `amount_block_is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this property active?',
  `start_date` datetime DEFAULT NULL COMMENT 'Date and time that this page starts.',
  `end_date` datetime DEFAULT NULL COMMENT 'Date and time that this page ends. May be NULL if no defined end date/time',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who created this contribution page',
  `created_date` datetime DEFAULT NULL COMMENT 'Date and time that contribution page was created.',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'The campaign for which we are collecting contributions with this page.',
  `is_share` tinyint(4) DEFAULT '1' COMMENT 'Can people share the contribution page through social media?',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro_text` text COLLATE utf8_unicode_ci,
  `pay_later_text` text COLLATE utf8_unicode_ci,
  `pay_later_receipt` text COLLATE utf8_unicode_ci,
  `initial_amount_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `initial_amount_help_text` text COLLATE utf8_unicode_ci,
  `thankyou_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thankyou_text` text COLLATE utf8_unicode_ci,
  `thankyou_footer` text COLLATE utf8_unicode_ci,
  `receipt_from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt_text` text COLLATE utf8_unicode_ci,
  `footer_text` text COLLATE utf8_unicode_ci,
  `is_billing_required` tinyint(4) DEFAULT '0' COMMENT 'Billing block required for Contribution Page',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_contribution_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_contribution_product`;

CREATE TABLE `log_civicrm_contribution_product` (
  `id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `contribution_id` int(10) unsigned DEFAULT NULL,
  `product_option` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Option value selected if applicable - e.g. color, size etc.',
  `quantity` int(11) DEFAULT NULL,
  `fulfilled_date` date DEFAULT NULL COMMENT 'Optional. Can be used to record the date this product was fulfilled or shipped.',
  `start_date` date DEFAULT NULL COMMENT 'Actual start date for a time-delimited premium (subscription, service or membership)',
  `end_date` date DEFAULT NULL COMMENT 'Actual end date for a time-delimited premium (subscription, service or membership)',
  `comment` text COLLATE utf8_unicode_ci,
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Financial Type(for membership price sets only).',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_contribution_recur
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_contribution_recur`;

CREATE TABLE `log_civicrm_contribution_recur` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Contribution Recur ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to civicrm_contact.id .',
  `amount` decimal(20,2) DEFAULT NULL COMMENT 'Amount to be contributed or charged each recurrence.',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `frequency_unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'month' COMMENT 'Time units for recurrence of payment.',
  `frequency_interval` int(10) unsigned DEFAULT NULL COMMENT 'Number of time units for recurrence of payment.',
  `installments` int(10) unsigned DEFAULT NULL COMMENT 'Total number of payments to be made. Set this to 0 if this is an open-ended commitment i.e. no set end date.',
  `start_date` datetime DEFAULT NULL COMMENT 'The date the first scheduled recurring contribution occurs.',
  `create_date` datetime DEFAULT NULL COMMENT 'When this recurring contribution record was created.',
  `modified_date` datetime DEFAULT NULL COMMENT 'Last updated date for this record. mostly the last time a payment was received',
  `cancel_date` datetime DEFAULT NULL COMMENT 'Date this recurring contribution was cancelled by contributor- if we can get access to it',
  `end_date` datetime DEFAULT NULL COMMENT 'Date this recurring contribution finished successfully',
  `processor_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Possibly needed to store a unique identifier for this recurring payment order - if this is available from the processor??',
  `trxn_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'unique transaction id. may be processor id, bank id + trans id, or account number + check number... depending on payment_method',
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'unique invoice id, system generated or passed in',
  `contribution_status_id` int(10) unsigned DEFAULT '1',
  `is_test` tinyint(4) DEFAULT '0',
  `cycle_day` int(10) unsigned DEFAULT '1' COMMENT 'Day in the period when the payment should be charged e.g. 1st of month, 15th etc.',
  `next_sched_contribution_date` datetime DEFAULT NULL COMMENT 'Next scheduled date',
  `failure_count` int(10) unsigned DEFAULT '0' COMMENT 'Number of failed charge attempts since last success. Business rule could be set to deactivate on more than x failures.',
  `failure_retry_date` datetime DEFAULT NULL COMMENT 'Date to retry failed attempt',
  `auto_renew` tinyint(4) DEFAULT '0' COMMENT 'Some systems allow contributor to set a number of installments - but then auto-renew the subscription or commitment if they do not cancel.',
  `payment_processor_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to civicrm_payment_processor.id',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Financial Type',
  `payment_instrument_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Payment Instrument',
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'The campaign for which this contribution has been triggered.',
  `is_email_receipt` tinyint(4) DEFAULT '1' COMMENT 'if true, receipt is automatically emailed to contact on each successful payment',
  `payment_token_id` int(10) unsigned DEFAULT NULL COMMENT 'Optionally used to store a link to a payment token used for this recurring contribution.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_contribution_soft
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_contribution_soft`;

CREATE TABLE `log_civicrm_contribution_soft` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Soft Contribution ID',
  `contribution_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to contribution table.',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `amount` decimal(20,2) DEFAULT NULL COMMENT 'Amount of this soft contribution.',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `pcp_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_pcp.id',
  `pcp_display_in_roll` tinyint(4) DEFAULT '0',
  `pcp_roll_nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pcp_personal_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soft_credit_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Soft Credit Type ID.Implicit FK to civicrm_option_value where option_group = soft_credit_type.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_contribution_widget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_contribution_widget`;

CREATE TABLE `log_civicrm_contribution_widget` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Contribution Id',
  `contribution_page_id` int(10) unsigned DEFAULT NULL COMMENT 'The Contribution Page which triggered this contribution',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this property active?',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Widget title.',
  `url_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL to Widget logo',
  `button_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Button title.',
  `about` text COLLATE utf8_unicode_ci COMMENT 'About description.',
  `url_homepage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL to Homepage.',
  `color_title` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_button` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_bar` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_main_text` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_main` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_main_bg` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_bg` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_about_link` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_homepage_link` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_country`;

CREATE TABLE `log_civicrm_country` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Country Id',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Country Name',
  `iso_code` char(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ISO Code',
  `country_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'National prefix to be used when dialing TO this country.',
  `address_format_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to civicrm_address_format.id.',
  `idd_prefix` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'International direct dialing prefix from within the country TO another country',
  `ndd_prefix` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Access prefix to call within a country to a different area',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to civicrm_worldregion.id.',
  `is_province_abbreviated` tinyint(4) DEFAULT '0' COMMENT 'Should state/province be displayed as abbreviation for contacts from this country?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_county
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_county`;

CREATE TABLE `log_civicrm_county` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'County ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of County',
  `abbreviation` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '2-4 Character Abbreviation of County',
  `state_province_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of State / Province that County belongs',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_currency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_currency`;

CREATE TABLE `log_civicrm_currency` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Currency Id',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Currency Name',
  `symbol` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Currency Symbol',
  `numeric_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Numeric currency code',
  `full_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Full currency name',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_custom_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_custom_field`;

CREATE TABLE `log_civicrm_custom_field` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Custom Field ID',
  `custom_group_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_custom_group.',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Variable name/programmatic handle for this group.',
  `data_type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Controls location of data storage in extended_data table.',
  `html_type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'HTML types plus several built-in extended types.',
  `default_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Use form_options.is_default for field_types which use options.',
  `is_required` tinyint(4) DEFAULT '0' COMMENT 'Is a value required for this property.',
  `is_searchable` tinyint(4) DEFAULT '0' COMMENT 'Is this property searchable.',
  `is_search_range` tinyint(4) DEFAULT '0' COMMENT 'Is this property range searchable.',
  `weight` int(11) DEFAULT '1' COMMENT 'Controls field display order within an extended property group.',
  `mask` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional format instructions for specific field types, like date types.',
  `attributes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Store collection of type-appropriate attributes, e.g. textarea  needs rows/cols attributes',
  `javascript` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional scripting attributes for field.',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this property active?',
  `is_view` tinyint(4) DEFAULT '0' COMMENT 'Is this property set by PHP Code? A code field is viewable but not editable',
  `options_per_line` int(10) unsigned DEFAULT NULL COMMENT 'number of options per line for checkbox and radio',
  `text_length` int(10) unsigned DEFAULT NULL COMMENT 'field length if alphanumeric',
  `start_date_years` int(11) DEFAULT NULL COMMENT 'Date may be up to start_date_years years prior to the current date.',
  `end_date_years` int(11) DEFAULT NULL COMMENT 'Date may be up to end_date_years years after the current date.',
  `date_format` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'date format for custom date',
  `time_format` int(10) unsigned DEFAULT NULL COMMENT 'time format for custom date',
  `note_columns` int(10) unsigned DEFAULT NULL COMMENT ' Number of columns in Note Field ',
  `note_rows` int(10) unsigned DEFAULT NULL COMMENT ' Number of rows in Note Field ',
  `column_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of the column that holds the values for this field.',
  `option_group_id` int(10) unsigned DEFAULT NULL COMMENT 'For elements with options, the option group id that is used',
  `filter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Stores Contact Get API params contact reference custom fields. May be used for other filters in the future.',
  `in_selector` tinyint(4) DEFAULT '0' COMMENT 'Should the multi-record custom field values be displayed in tab table listing',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_pre` text COLLATE utf8_unicode_ci,
  `help_post` text COLLATE utf8_unicode_ci,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_custom_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_custom_group`;

CREATE TABLE `log_civicrm_custom_group` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Custom Group ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Variable name/programmatic handle for this group.',
  `extends` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Contact' COMMENT 'Type of object this group extends (can add other options later e.g. contact_address, etc.).',
  `extends_entity_column_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_option_value.id (for option group custom_data_type.)',
  `extends_entity_column_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'linking custom group for dynamic object',
  `style` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Visual relationship between this form and its parent.',
  `collapse_display` int(10) unsigned DEFAULT '0' COMMENT 'Will this group be in collapsed or expanded mode on initial display ?',
  `weight` int(11) DEFAULT '1' COMMENT 'Controls display order when multiple extended property groups are setup for the same class.',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this property active?',
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of the table that holds the values for this group.',
  `is_multiple` tinyint(4) DEFAULT '0' COMMENT 'Does this group hold multiple values?',
  `min_multiple` int(10) unsigned DEFAULT NULL COMMENT 'minimum number of multiple records (typically 0?)',
  `max_multiple` int(10) unsigned DEFAULT NULL COMMENT 'maximum number of multiple records, if 0 - no max',
  `collapse_adv_display` int(10) unsigned DEFAULT '0' COMMENT 'Will this group be in collapsed or expanded mode on advanced search display ?',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who created this custom group',
  `created_date` datetime DEFAULT NULL COMMENT 'Date and time this custom group was created.',
  `is_reserved` tinyint(4) DEFAULT '0' COMMENT 'Is this a reserved Custom Group?',
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_pre` text COLLATE utf8_unicode_ci,
  `help_post` text COLLATE utf8_unicode_ci,
  `is_public` tinyint(1) DEFAULT '1' COMMENT 'Is this property public?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_cxn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_cxn`;

CREATE TABLE `log_civicrm_cxn` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Connection ID',
  `app_guid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Application GUID',
  `app_meta` text COLLATE utf8_unicode_ci COMMENT 'Application Metadata (JSON)',
  `cxn_guid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Connection GUID',
  `secret` text COLLATE utf8_unicode_ci COMMENT 'Shared secret',
  `perm` text COLLATE utf8_unicode_ci COMMENT 'Permissions approved for the service (JSON)',
  `options` text COLLATE utf8_unicode_ci COMMENT 'Options for the service (JSON)',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is connection currently enabled?',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'When was the connection was created.',
  `modified_date` timestamp NULL DEFAULT NULL COMMENT 'When the connection was created or modified.',
  `fetched_date` timestamp NULL DEFAULT NULL COMMENT 'The last time the application metadata was fetched.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_dashboard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_dashboard`;

CREATE TABLE `log_civicrm_dashboard` (
  `id` int(10) unsigned DEFAULT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Domain for dashboard',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Internal name of dashlet.',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'url in case of external dashlet',
  `permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Permission for the dashlet',
  `permission_operator` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Permission Operator',
  `fullscreen_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'fullscreen url for dashlet',
  `is_active` tinyint(4) DEFAULT '0' COMMENT 'Is this dashlet active?',
  `is_reserved` tinyint(4) DEFAULT '0' COMMENT 'Is this dashlet reserved?',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cache_minutes` int(10) unsigned DEFAULT '60' COMMENT 'Number of minutes to cache dashlet content in browser localStorage.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_dashboard_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_dashboard_contact`;

CREATE TABLE `log_civicrm_dashboard_contact` (
  `id` int(10) unsigned DEFAULT NULL,
  `dashboard_id` int(10) unsigned DEFAULT NULL COMMENT 'Dashboard ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Contact ID',
  `column_no` tinyint(4) DEFAULT '0' COMMENT 'column no for this widget',
  `is_active` tinyint(4) DEFAULT '0' COMMENT 'Is this widget active?',
  `weight` int(11) DEFAULT '0' COMMENT 'Ordering of the widgets.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_dedupe_exception
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_dedupe_exception`;

CREATE TABLE `log_civicrm_dedupe_exception` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique dedupe exception id',
  `contact_id1` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `contact_id2` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_dedupe_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_dedupe_rule`;

CREATE TABLE `log_civicrm_dedupe_rule` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique dedupe rule id',
  `dedupe_rule_group_id` int(10) unsigned DEFAULT NULL COMMENT 'The id of the rule group this rule belongs to',
  `rule_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The name of the table this rule is about',
  `rule_field` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The name of the field of the table referenced in rule_table',
  `rule_length` int(10) unsigned DEFAULT NULL COMMENT 'The lenght of the matching substring',
  `rule_weight` int(11) DEFAULT NULL COMMENT 'The weight of the rule',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_dedupe_rule_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_dedupe_rule_group`;

CREATE TABLE `log_civicrm_dedupe_rule_group` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique dedupe rule group id',
  `contact_type` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The type of contacts this group applies to',
  `threshold` int(11) DEFAULT NULL COMMENT 'The weight threshold the sum of the rule weights has to cross to consider two contacts the same',
  `used` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Whether the rule should be used for cases where usage is Unsupervised, Supervised OR General(programatically)',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of the rule group',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Label of the rule group',
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'Is this a reserved rule - a rule group that has been optimized and cannot be changed by the admin',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_discount`;

CREATE TABLE `log_civicrm_discount` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'primary key',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'physical tablename for entity being joined to discount, e.g. civicrm_event',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to entity table specified in entity_table column.',
  `price_set_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_price_set',
  `start_date` date DEFAULT NULL COMMENT 'Date when discount starts.',
  `end_date` date DEFAULT NULL COMMENT 'Date when discount ends.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_domain
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_domain`;

CREATE TABLE `log_civicrm_domain` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Domain ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of Domain / Organization',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Description of Domain.',
  `version` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The civicrm version this instance is running',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID. This is specifically not an FK to avoid circular constraints',
  `locales` text COLLATE utf8_unicode_ci COMMENT 'list of locales supported by the current db state (NULL for single-lang install)',
  `locale_custom_strings` text COLLATE utf8_unicode_ci COMMENT 'Locale specific string overrides',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_email
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_email`;

CREATE TABLE `log_civicrm_email` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Email ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `location_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Location does this email belong to.',
  `email` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email address',
  `is_primary` tinyint(4) DEFAULT '0' COMMENT 'Is this the primary?',
  `is_billing` tinyint(4) DEFAULT '0' COMMENT 'Is this the billing?',
  `on_hold` tinyint(4) DEFAULT '0' COMMENT 'Is this address on bounce hold?',
  `is_bulkmail` tinyint(4) DEFAULT '0' COMMENT 'Is this address for bulk mail ?',
  `hold_date` datetime DEFAULT NULL COMMENT 'When the address went on bounce hold',
  `reset_date` datetime DEFAULT NULL COMMENT 'When the address bounce status was last reset',
  `signature_text` text COLLATE utf8_unicode_ci COMMENT 'Text formatted signature for the email.',
  `signature_html` text COLLATE utf8_unicode_ci COMMENT 'HTML formatted signature for the email.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_entity_batch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_entity_batch`;

CREATE TABLE `log_civicrm_entity_batch` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'primary key',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'physical tablename for entity being joined to file, e.g. civicrm_contact',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to entity table specified in entity_table column.',
  `batch_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_batch',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_entity_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_entity_file`;

CREATE TABLE `log_civicrm_entity_file` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'primary key',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'physical tablename for entity being joined to file, e.g. civicrm_contact',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to entity table specified in entity_table column.',
  `file_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_file',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_entity_financial_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_entity_financial_account`;

CREATE TABLE `log_civicrm_entity_financial_account` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'ID',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Links to an entity_table like civicrm_financial_type',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Links to an id in the entity_table, such as vid in civicrm_financial_type',
  `account_relationship` int(10) unsigned DEFAULT NULL COMMENT 'FK to a new civicrm_option_value (account_relationship)',
  `financial_account_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the financial_account_id',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_entity_financial_trxn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_entity_financial_trxn`;

CREATE TABLE `log_civicrm_entity_financial_trxn` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'ID',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'May contain civicrm_financial_item, civicrm_contribution, civicrm_financial_trxn, civicrm_grant, etc',
  `entity_id` int(10) unsigned DEFAULT NULL,
  `financial_trxn_id` int(10) unsigned DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL COMMENT 'allocated amount of transaction to this entity',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_entity_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_entity_tag`;

CREATE TABLE `log_civicrm_entity_tag` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'primary key',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'physical tablename for entity being joined to file, e.g. civicrm_contact',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to entity table specified in entity_table column.',
  `tag_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_tag',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_event`;

CREATE TABLE `log_civicrm_event` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Event',
  `event_type_id` int(10) unsigned DEFAULT '0' COMMENT 'Event Type ID.Implicit FK to civicrm_option_value where option_group = event_type.',
  `participant_listing_id` int(10) unsigned DEFAULT '0' COMMENT 'Should we expose the participant list? Implicit FK to civicrm_option_value where option_group = participant_listing.',
  `is_public` tinyint(4) DEFAULT '1' COMMENT 'Public events will be included in the iCal feeds. Access to private event information may be limited using ACLs.',
  `start_date` datetime DEFAULT NULL COMMENT 'Date and time that event starts.',
  `end_date` datetime DEFAULT NULL COMMENT 'Date and time that event ends. May be NULL if no defined end date/time',
  `is_online_registration` tinyint(4) DEFAULT '0' COMMENT 'If true, include registration link on Event Info page.',
  `registration_start_date` datetime DEFAULT NULL COMMENT 'Date and time that online registration starts.',
  `registration_end_date` datetime DEFAULT NULL COMMENT 'Date and time that online registration ends.',
  `max_participants` int(10) unsigned DEFAULT NULL COMMENT 'Maximum number of registered participants to allow. After max is reached, a custom Event Full message is displayed. If NULL, allow unlimited number of participants.',
  `is_monetary` tinyint(4) DEFAULT '0' COMMENT 'If true, one or more fee amounts must be set and a Payment Processor must be configured for Online Event Registration.',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Financial type assigned to paid event registrations for this event. Required if is_monetary is true.',
  `payment_processor` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Payment Processors configured for this Event (if is_monetary is true)',
  `is_map` tinyint(4) DEFAULT '0' COMMENT 'Include a map block on the Event Information page when geocode info is available and a mapping provider has been specified?',
  `is_active` tinyint(4) DEFAULT '0' COMMENT 'Is this Event enabled or disabled/cancelled?',
  `is_show_location` tinyint(4) DEFAULT '1' COMMENT 'If true, show event location.',
  `loc_block_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Location Block ID',
  `default_role_id` int(10) unsigned DEFAULT '1' COMMENT 'Participant role ID. Implicit FK to civicrm_option_value where option_group = participant_role.',
  `is_email_confirm` tinyint(4) DEFAULT '0' COMMENT 'If true, confirmation is automatically emailed to contact on successful registration.',
  `confirm_from_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'FROM email address used for confirmation emails.',
  `cc_confirm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'comma-separated list of email addresses to cc each time a confirmation is sent',
  `bcc_confirm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'comma-separated list of email addresses to bcc each time a confirmation is sent',
  `default_fee_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_option_value.',
  `default_discount_fee_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_option_value.',
  `is_pay_later` tinyint(4) DEFAULT '0' COMMENT 'if true - allows the user to send payment directly to the org later',
  `is_partial_payment` tinyint(4) DEFAULT '0' COMMENT 'is partial payment enabled for this event',
  `min_initial_amount` decimal(20,2) DEFAULT NULL COMMENT 'Minimum initial amount for partial payment',
  `is_multiple_registrations` tinyint(4) DEFAULT '0' COMMENT 'if true - allows the user to register multiple participants for event',
  `max_additional_participants` int(10) unsigned DEFAULT '0' COMMENT 'Maximum number of additional participants that can be registered on a single booking',
  `allow_same_participant_emails` tinyint(4) DEFAULT '0' COMMENT 'if true - allows the user to register multiple registrations from same email address.',
  `has_waitlist` tinyint(4) DEFAULT NULL COMMENT 'Whether the event has waitlist support.',
  `requires_approval` tinyint(4) DEFAULT NULL COMMENT 'Whether participants require approval before they can finish registering.',
  `expiration_time` int(10) unsigned DEFAULT NULL COMMENT 'Expire pending but unconfirmed registrations after this many hours.',
  `is_template` tinyint(4) DEFAULT '0' COMMENT 'whether the event has template',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who created this event',
  `created_date` datetime DEFAULT NULL COMMENT 'Date and time that event was created.',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'The campaign for which this event has been created.',
  `is_share` tinyint(4) DEFAULT '1' COMMENT 'Can people share the event through social media?',
  `parent_event_id` int(10) unsigned DEFAULT NULL COMMENT 'Implicit FK to civicrm_event: parent event',
  `slot_label_id` int(10) unsigned DEFAULT NULL COMMENT 'Subevent slot label. Implicit FK to civicrm_option_value where option_group = conference_slot.',
  `is_confirm_enabled` tinyint(4) DEFAULT '1',
  `dedupe_rule_group_id` int(10) unsigned DEFAULT NULL COMMENT 'Rule to use when matching registrations for this event',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `registration_link_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_full_text` text COLLATE utf8_unicode_ci,
  `fee_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro_text` text COLLATE utf8_unicode_ci,
  `footer_text` text COLLATE utf8_unicode_ci,
  `confirm_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirm_text` text COLLATE utf8_unicode_ci,
  `confirm_footer_text` text COLLATE utf8_unicode_ci,
  `confirm_email_text` text COLLATE utf8_unicode_ci,
  `confirm_from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thankyou_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thankyou_text` text COLLATE utf8_unicode_ci,
  `thankyou_footer_text` text COLLATE utf8_unicode_ci,
  `pay_later_text` text COLLATE utf8_unicode_ci,
  `pay_later_receipt` text COLLATE utf8_unicode_ci,
  `initial_amount_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `initial_amount_help_text` text COLLATE utf8_unicode_ci,
  `waitlist_text` text COLLATE utf8_unicode_ci,
  `approval_req_text` text COLLATE utf8_unicode_ci,
  `template_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_billing_required` tinyint(4) DEFAULT '0' COMMENT 'Billing block required for Event',
  `selfcancelxfer_time` int(10) unsigned DEFAULT '0' COMMENT 'Number of hours prior to event start date to allow self-service cancellation or transfer.',
  `allow_selfcancelxfer` tinyint(4) DEFAULT '0' COMMENT 'Allow self service cancellation or transfer for event?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_event_carts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_event_carts`;

CREATE TABLE `log_civicrm_event_carts` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Cart Id',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact who created this cart',
  `completed` tinyint(4) DEFAULT '0',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_events_in_carts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_events_in_carts`;

CREATE TABLE `log_civicrm_events_in_carts` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Event In Cart Id',
  `event_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Event ID',
  `event_cart_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Event Cart ID',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_extension
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_extension`;

CREATE TABLE `log_civicrm_extension` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Local Extension ID',
  `type` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Fully qualified extension name',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Short name',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Short, printable name',
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Primary PHP file',
  `schema_version` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Revision code of the database schema; the format is module-defined',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this extension active?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_file`;

CREATE TABLE `log_civicrm_file` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique ID',
  `file_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Type of file (e.g. Transcript, Income Tax Return, etc). FK to civicrm_option_value.',
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'mime type of the document',
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'uri of the file on disk',
  `document` mediumblob COMMENT 'contents of the document',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Additional descriptive text regarding this attachment (optional).',
  `upload_date` datetime DEFAULT NULL COMMENT 'Date and time that this attachment was uploaded or written to server.',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who uploaded this file',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_financial_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_financial_account`;

CREATE TABLE `log_civicrm_financial_account` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Financial Account Name.',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID that is responsible for the funds in this account',
  `financial_account_type_id` int(10) unsigned DEFAULT '3' COMMENT 'pseudo FK into civicrm_option_value.',
  `accounting_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional value for mapping monies owed and received to accounting system codes.',
  `account_type_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional value for mapping account types to accounting system account categories (QuickBooks Account Type Codes for example).',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Financial Type Description.',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent ID in account hierarchy',
  `is_header_account` tinyint(4) DEFAULT '0' COMMENT 'Is this a header account which does not allow transactions to be posted against it directly, but only to its sub-accounts?',
  `is_deductible` tinyint(4) DEFAULT '1' COMMENT 'Is this account tax-deductible?',
  `is_tax` tinyint(4) DEFAULT '0' COMMENT 'Is this account for taxes?',
  `tax_rate` decimal(10,8) DEFAULT NULL COMMENT 'The percentage of the total_amount that is due for this tax.',
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'Is this a predefined system object?',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this property active?',
  `is_default` tinyint(4) DEFAULT NULL COMMENT 'Is this account the default one (or default tax one) for its financial_account_type?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_financial_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_financial_item`;

CREATE TABLE `log_civicrm_financial_item` (
  `id` int(10) unsigned DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'Date and time the item was created',
  `transaction_date` datetime DEFAULT NULL COMMENT 'Date and time of the source transaction',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID of contact the item is from',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Human readable description of this item, to ease display without lookup of source item.',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT 'Total amount of this item',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Currency for the amount',
  `financial_account_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_financial_account',
  `status_id` int(10) unsigned DEFAULT NULL COMMENT 'Payment status: test, paid, part_paid, unpaid (if empty assume unpaid)',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The table providing the source of this item such as civicrm_line_item',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'The specific source item that is responsible for the creation of this financial_item',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_financial_trxn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_financial_trxn`;

CREATE TABLE `log_civicrm_financial_trxn` (
  `id` int(10) unsigned DEFAULT NULL,
  `from_financial_account_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to financial_account table.',
  `to_financial_account_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to financial_financial_account table.',
  `trxn_date` datetime DEFAULT NULL COMMENT 'date transaction occurred',
  `total_amount` decimal(20,2) DEFAULT NULL COMMENT 'amount of transaction',
  `fee_amount` decimal(20,2) DEFAULT NULL COMMENT 'actual processor fee if known - may be 0.',
  `net_amount` decimal(20,2) DEFAULT NULL COMMENT 'actual funds transfer amount. total less fees. if processor does not report actual fee during transaction, this is set to total_amount.',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `trxn_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user-specified unique processor transaction id, bank id + trans id,... depending on payment_method',
  `trxn_result_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'processor result code',
  `status_id` int(10) unsigned DEFAULT NULL COMMENT 'pseudo FK to civicrm_option_value of financial_item status option_group',
  `payment_processor_id` int(10) unsigned DEFAULT NULL COMMENT 'Payment Processor for this financial transaction',
  `payment_instrument_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to payment_instrument option group values',
  `card_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to accept_creditcard option group values',
  `check_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Check number',
  `pan_truncation` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Last 4 digits of credit card',
  `is_payment` tinyint(4) DEFAULT '0' COMMENT 'Is this entry either a payment or a reversal of a payment?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_financial_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_financial_type`;

CREATE TABLE `log_civicrm_financial_type` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'ID of original financial_type so you can search this table by the financial_type.id and then select the relevant version based on the timestamp',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Financial Type Name.',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Financial Type Description.',
  `is_deductible` tinyint(4) DEFAULT '1' COMMENT 'Is this financial type tax-deductible? If true, contributions of this type may be fully OR partially deductible - non-deductible amount is stored in the Contribution record.',
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'Is this a predefined system object?',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this property active?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_grant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_grant`;

CREATE TABLE `log_civicrm_grant` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Grant id',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Contact ID of contact record given grant belongs to.',
  `application_received_date` date DEFAULT NULL COMMENT 'Date on which grant application was received by donor.',
  `decision_date` date DEFAULT NULL COMMENT 'Date on which grant decision was made.',
  `money_transfer_date` date DEFAULT NULL COMMENT 'Date on which grant money transfer was made.',
  `grant_due_date` date DEFAULT NULL COMMENT 'Date on which grant report is due.',
  `grant_report_received` tinyint(4) DEFAULT NULL COMMENT 'Yes/No field stating whether grant report was received by donor.',
  `grant_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Type of grant. Implicit FK to civicrm_option_value in grant_type option_group.',
  `amount_total` decimal(20,2) DEFAULT NULL COMMENT 'Requested grant amount, in default currency.',
  `amount_requested` decimal(20,2) DEFAULT NULL COMMENT 'Requested grant amount, in original currency (optional).',
  `amount_granted` decimal(20,2) DEFAULT NULL COMMENT 'Granted amount, in default currency.',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `rationale` text COLLATE utf8_unicode_ci COMMENT 'Grant rationale.',
  `status_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of Grant status.',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Financial Type.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_group`;

CREATE TABLE `log_civicrm_group` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Group ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Internal name of Group.',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Optional verbose description of the group.',
  `source` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Module or process which created this group.',
  `saved_search_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to saved search table.',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this entry active?',
  `visibility` varchar(24) COLLATE utf8_unicode_ci DEFAULT 'User and User Admin Only' COMMENT 'In what context(s) is this field visible.',
  `where_clause` text COLLATE utf8_unicode_ci COMMENT 'the sql where clause if a saved search acl',
  `select_tables` text COLLATE utf8_unicode_ci COMMENT 'the tables to be included in a select data',
  `where_tables` text COLLATE utf8_unicode_ci COMMENT 'the tables to be included in the count statement',
  `group_type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'FK to group type',
  `cache_date` timestamp NULL DEFAULT NULL,
  `refresh_date` timestamp NULL DEFAULT NULL,
  `parents` text COLLATE utf8_unicode_ci COMMENT 'IDs of the parent(s)',
  `children` text COLLATE utf8_unicode_ci COMMENT 'IDs of the child(ren)',
  `is_hidden` tinyint(4) DEFAULT '0' COMMENT 'Is this group hidden?',
  `is_reserved` tinyint(4) DEFAULT '0',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to contact table.',
  `modified_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to contact table, modifier of the group.',
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_group_contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_group_contact`;

CREATE TABLE `log_civicrm_group_contact` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'primary key',
  `group_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_group',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact',
  `status` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'status of contact relative to membership in group',
  `location_id` int(10) unsigned DEFAULT NULL COMMENT 'Optional location to associate with this membership',
  `email_id` int(10) unsigned DEFAULT NULL COMMENT 'Optional email to associate with this membership',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_group_nesting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_group_nesting`;

CREATE TABLE `log_civicrm_group_nesting` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Relationship ID',
  `child_group_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the child group',
  `parent_group_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the parent group',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_group_organization
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_group_organization`;

CREATE TABLE `log_civicrm_group_organization` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Relationship ID',
  `group_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the group',
  `organization_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the Organization Contact',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_im
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_im`;

CREATE TABLE `log_civicrm_im` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique IM ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `location_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Location does this email belong to.',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'IM screen name',
  `provider_id` int(10) unsigned DEFAULT NULL COMMENT 'Which IM Provider does this screen name belong to.',
  `is_primary` tinyint(4) DEFAULT '0' COMMENT 'Is this the primary IM for this contact and location.',
  `is_billing` tinyint(4) DEFAULT '0' COMMENT 'Is this the billing?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_job`;

CREATE TABLE `log_civicrm_job` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Job Id',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this scheduled job for',
  `run_frequency` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'Daily' COMMENT 'Scheduled job run frequency.',
  `last_run` timestamp NULL DEFAULT NULL COMMENT 'When was this cron entry last run',
  `scheduled_run_date` timestamp NULL DEFAULT NULL COMMENT 'When is this cron entry scheduled to run',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Title of the job',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Description of the job',
  `api_entity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Entity of the job api call',
  `api_action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Action of the job api call',
  `parameters` text COLLATE utf8_unicode_ci COMMENT 'List of parameters to the command.',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this job active?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_line_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_line_item`;

CREATE TABLE `log_civicrm_line_item` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Line Item',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'table which has the transaction',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'entry in table',
  `contribution_id` int(10) unsigned DEFAULT NULL COMMENT 'Contribution ID',
  `price_field_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_price_field',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'descriptive label for item - from price_field_value.label',
  `qty` decimal(20,2) DEFAULT NULL,
  `unit_price` decimal(20,2) DEFAULT NULL COMMENT 'price of each item',
  `line_total` decimal(20,2) DEFAULT NULL COMMENT 'qty * unit_price',
  `participant_count` int(10) unsigned DEFAULT NULL COMMENT 'Participant count for field',
  `price_field_value_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_price_field_value',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Financial Type.',
  `non_deductible_amount` decimal(20,2) DEFAULT '0.00' COMMENT 'Portion of total amount which is NOT tax deductible.',
  `tax_amount` decimal(20,2) DEFAULT NULL COMMENT 'tax of each item',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_loc_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_loc_block`;

CREATE TABLE `log_civicrm_loc_block` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique ID',
  `address_id` int(10) unsigned DEFAULT NULL,
  `email_id` int(10) unsigned DEFAULT NULL,
  `phone_id` int(10) unsigned DEFAULT NULL,
  `im_id` int(10) unsigned DEFAULT NULL,
  `address_2_id` int(10) unsigned DEFAULT NULL,
  `email_2_id` int(10) unsigned DEFAULT NULL,
  `phone_2_id` int(10) unsigned DEFAULT NULL,
  `im_2_id` int(10) unsigned DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_location_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_location_type`;

CREATE TABLE `log_civicrm_location_type` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Location Type ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Location Type Name.',
  `vcard_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'vCard Location Type Name.',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Location Type Description.',
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'Is this location type a predefined system location?',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this property active?',
  `is_default` tinyint(4) DEFAULT NULL COMMENT 'Is this location type the default?',
  `display_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mail_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mail_settings`;

CREATE TABLE `log_civicrm_mail_settings` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'primary key',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this match entry for',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'name of this group of settings',
  `is_default` tinyint(4) DEFAULT NULL COMMENT 'whether this is the default set of settings for this domain',
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'email address domain (the part after @)',
  `localpart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'optional local part (like civimail+ for addresses like civimail+s.1.2@example.com)',
  `return_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'contents of the Return-Path header',
  `protocol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'name of the protocol to use for polling (like IMAP, POP3 or Maildir)',
  `server` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'server to use when polling',
  `port` int(10) unsigned DEFAULT NULL COMMENT 'port to use when polling',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'username to use when polling',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'password to use when polling',
  `is_ssl` tinyint(4) DEFAULT NULL COMMENT 'whether to use SSL or not',
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'folder to poll from when using IMAP, path to poll from when using Maildir, etc.',
  `activity_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of status to use when creating email to activity.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mailing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mailing`;

CREATE TABLE `log_civicrm_mailing` (
  `id` int(10) unsigned DEFAULT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which site is this mailing for',
  `header_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the header component.',
  `footer_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the footer component.',
  `reply_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the auto-responder component.',
  `unsubscribe_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the unsubscribe component.',
  `resubscribe_id` int(10) unsigned DEFAULT NULL,
  `optout_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the opt-out component.',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mailing Name.',
  `from_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'From Header of mailing',
  `from_email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'From Email of mailing',
  `replyto_email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Reply-To Email of mailing',
  `subject` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Subject of mailing',
  `body_text` longtext COLLATE utf8_unicode_ci COMMENT 'Body of the mailing in text format.',
  `body_html` longtext COLLATE utf8_unicode_ci COMMENT 'Body of the mailing in html format.',
  `url_tracking` tinyint(4) DEFAULT NULL COMMENT 'Should we track URL click-throughs for this mailing?',
  `forward_replies` tinyint(4) DEFAULT NULL COMMENT 'Should we forward replies back to the author?',
  `auto_responder` tinyint(4) DEFAULT NULL COMMENT 'Should we enable the auto-responder?',
  `open_tracking` tinyint(4) DEFAULT NULL COMMENT 'Should we track when recipients open/read this mailing?',
  `is_completed` tinyint(4) DEFAULT NULL COMMENT 'Has at least one job associated with this mailing finished?',
  `msg_template_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the message template.',
  `override_verp` tinyint(4) DEFAULT '0' COMMENT 'Should we overrite VERP address in Reply-To',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID who first created this mailing',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'Date and time this mailing was created.',
  `scheduled_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID who scheduled this mailing',
  `scheduled_date` timestamp NULL DEFAULT NULL COMMENT 'Date and time this mailing was scheduled.',
  `approver_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID who approved this mailing',
  `approval_date` timestamp NULL DEFAULT NULL COMMENT 'Date and time this mailing was approved.',
  `approval_status_id` int(10) unsigned DEFAULT NULL COMMENT 'The status of this mailing. Values: none, approved, rejected',
  `approval_note` longtext COLLATE utf8_unicode_ci COMMENT 'Note behind the decision.',
  `is_archived` tinyint(4) DEFAULT '0' COMMENT 'Is this mailing archived?',
  `visibility` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'User and User Admin Only' COMMENT 'In what context(s) is the mailing contents visible (online viewing)',
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'The campaign for which this mailing has been initiated.',
  `dedupe_email` tinyint(4) DEFAULT '0' COMMENT 'Remove duplicate emails?',
  `sms_provider_id` int(10) unsigned DEFAULT NULL,
  `hash` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Key for validating requests related to this mailing.',
  `location_type_id` int(10) unsigned DEFAULT NULL COMMENT 'With email_selection_method, determines which email address to use',
  `email_selection_method` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'automatic' COMMENT 'With location_type_id, determine how to choose the email address to use.',
  `mailing_type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'differentiate between standalone mailings, A/B tests, and A/B final-winner',
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Language of the content of the mailing. Useful for tokens.',
  `template_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT 'traditional' COMMENT 'The language/processing system used for email templates.',
  `template_options` longtext COLLATE utf8_unicode_ci COMMENT 'Advanced options used by the email templating system. (JSON encoded)',
  `modified_date` timestamp NULL DEFAULT NULL COMMENT 'When the mailing (or closely related entity) was created or modified or deleted.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mailing_abtest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mailing_abtest`;

CREATE TABLE `log_civicrm_mailing_abtest` (
  `id` int(10) unsigned DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of the A/B test',
  `status` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Status',
  `mailing_id_a` int(10) unsigned DEFAULT NULL COMMENT 'The first experimental mailing ("A" condition)',
  `mailing_id_b` int(10) unsigned DEFAULT NULL COMMENT 'The second experimental mailing ("B" condition)',
  `mailing_id_c` int(10) unsigned DEFAULT NULL COMMENT 'The final, general mailing (derived from A or B)',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which site is this mailing for',
  `specific_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'What specific url to track',
  `declare_winning_time` datetime DEFAULT NULL COMMENT 'In how much time to declare winner',
  `group_percentage` int(10) unsigned DEFAULT NULL,
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'When was this item created',
  `testing_criteria` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `winner_criteria` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mailing_bounce_pattern
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mailing_bounce_pattern`;

CREATE TABLE `log_civicrm_mailing_bounce_pattern` (
  `id` int(10) unsigned DEFAULT NULL,
  `bounce_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Type of bounce',
  `pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'A regexp to match a message to a bounce type',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mailing_bounce_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mailing_bounce_type`;

CREATE TABLE `log_civicrm_mailing_bounce_type` (
  `id` int(10) unsigned DEFAULT NULL,
  `name` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Type of bounce',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'A description of this bounce type',
  `hold_threshold` int(10) unsigned DEFAULT NULL COMMENT 'Number of bounces of this type required before the email address is put on bounce hold',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mailing_component
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mailing_component`;

CREATE TABLE `log_civicrm_mailing_component` (
  `id` int(10) unsigned DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The name of this component',
  `component_type` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Type of Component.',
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body_html` text COLLATE utf8_unicode_ci COMMENT 'Body of the component in html format.',
  `body_text` text COLLATE utf8_unicode_ci COMMENT 'Body of the component in text format.',
  `is_default` tinyint(4) DEFAULT '0' COMMENT 'Is this the default component for this component_type?',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this property active?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mailing_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mailing_group`;

CREATE TABLE `log_civicrm_mailing_group` (
  `id` int(10) unsigned DEFAULT NULL,
  `mailing_id` int(10) unsigned DEFAULT NULL COMMENT 'The ID of a previous mailing to include/exclude recipients.',
  `group_type` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Are the members of the group included or excluded?.',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of table where item being referenced is stored.',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to the referenced item.',
  `search_id` int(11) DEFAULT NULL COMMENT 'The filtering search. custom search id or -1 for civicrm api search',
  `search_args` text COLLATE utf8_unicode_ci COMMENT 'The arguments to be sent to the search function',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mailing_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mailing_job`;

CREATE TABLE `log_civicrm_mailing_job` (
  `id` int(10) unsigned DEFAULT NULL,
  `mailing_id` int(10) unsigned DEFAULT NULL COMMENT 'The ID of the mailing this Job will send.',
  `scheduled_date` timestamp NULL DEFAULT NULL COMMENT 'date on which this job was scheduled.',
  `start_date` timestamp NULL DEFAULT NULL COMMENT 'date on which this job was started.',
  `end_date` timestamp NULL DEFAULT NULL COMMENT 'date on which this job ended.',
  `status` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The state of this job',
  `is_test` tinyint(4) DEFAULT '0' COMMENT 'Is this job for a test mail?',
  `job_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Type of mailling job: null | child ',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent job id',
  `job_offset` int(11) DEFAULT '0' COMMENT 'Offset of the child job',
  `job_limit` int(11) DEFAULT '0' COMMENT 'Queue size limit for each child job',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mailing_spool
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mailing_spool`;

CREATE TABLE `log_civicrm_mailing_spool` (
  `id` int(10) unsigned DEFAULT NULL,
  `job_id` int(10) unsigned DEFAULT NULL COMMENT 'The ID of the Job .',
  `recipient_email` text COLLATE utf8_unicode_ci COMMENT 'The email of the receipients this mail is to be sent.',
  `headers` text COLLATE utf8_unicode_ci COMMENT 'The header information of this mailing .',
  `body` text COLLATE utf8_unicode_ci COMMENT 'The body of this mailing.',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'date on which this job was added.',
  `removed_at` timestamp NULL DEFAULT NULL COMMENT 'date on which this job was removed.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mailing_trackable_url
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mailing_trackable_url`;

CREATE TABLE `log_civicrm_mailing_trackable_url` (
  `id` int(10) unsigned DEFAULT NULL,
  `url` text COLLATE utf8_unicode_ci COMMENT 'The URL to be tracked.',
  `mailing_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the mailing',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_managed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_managed`;

CREATE TABLE `log_civicrm_managed` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Surrogate Key',
  `module` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of the module which declared this object',
  `name` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Symbolic name used by the module to identify the object',
  `entity_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'API entity type',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to the referenced item.',
  `cleanup` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Policy on when to cleanup entity (always, never, unused)',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mapping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mapping`;

CREATE TABLE `log_civicrm_mapping` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Mapping ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of Mapping',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Description of Mapping.',
  `mapping_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Mapping Type',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_mapping_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_mapping_field`;

CREATE TABLE `log_civicrm_mapping_field` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Mapping Field ID',
  `mapping_id` int(10) unsigned DEFAULT NULL COMMENT 'Mapping to which this field belongs',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mapping field key',
  `contact_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Contact Type in mapping',
  `column_number` int(10) unsigned DEFAULT NULL COMMENT 'Column number for mapping set',
  `location_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Location type of this mapping, if required',
  `phone_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Which type of phone does this number belongs.',
  `im_provider_id` int(10) unsigned DEFAULT NULL COMMENT 'Which type of IM Provider does this name belong.',
  `website_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Which type of website does this site belong',
  `relationship_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Relationship type, if required',
  `relationship_direction` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grouping` int(10) unsigned DEFAULT '1' COMMENT 'Used to group mapping_field records into related sets (e.g. for criteria sets in search builder mappings).',
  `operator` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'SQL WHERE operator for search-builder mapping fields (search criteria).',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'SQL WHERE value for search-builder mapping fields.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_membership
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_membership`;

CREATE TABLE `log_civicrm_membership` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Membership Id',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `membership_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Membership Type',
  `join_date` date DEFAULT NULL COMMENT 'Beginning of initial membership period (member since...).',
  `start_date` date DEFAULT NULL COMMENT 'Beginning of current uninterrupted membership period.',
  `end_date` date DEFAULT NULL COMMENT 'Current membership period expire date.',
  `source` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Membership Status',
  `is_override` tinyint(4) DEFAULT NULL COMMENT 'Admin users may set a manual status which overrides the calculated status. When this flag is true, automated status update scripts should NOT modify status for the record.',
  `owner_membership_id` int(10) unsigned DEFAULT NULL COMMENT 'Optional FK to Parent Membership.',
  `max_related` int(11) DEFAULT NULL COMMENT 'Maximum number of related memberships (membership_type override).',
  `is_test` tinyint(4) DEFAULT '0',
  `is_pay_later` tinyint(4) DEFAULT '0',
  `contribution_recur_id` int(10) unsigned DEFAULT NULL COMMENT 'Conditional foreign key to civicrm_contribution_recur id. Each membership in connection with a recurring contribution carries a foreign key to the recurring contribution record. This assumes we can track these processor initiated events.',
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'The campaign for which this membership is attached.',
  `status_override_end_date` date DEFAULT NULL COMMENT 'The end date of membership status override if (Override until selected date) override type is selected.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_membership_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_membership_block`;

CREATE TABLE `log_civicrm_membership_block` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Membership Id',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name for Membership Status',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contribution_page.id',
  `membership_types` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Membership types to be exposed by this block.',
  `membership_type_default` int(10) unsigned DEFAULT NULL COMMENT 'Optional foreign key to membership_type',
  `display_min_fee` tinyint(4) DEFAULT '1' COMMENT 'Display minimum membership fee',
  `is_separate_payment` tinyint(4) DEFAULT '1' COMMENT 'Should membership transactions be processed separately',
  `is_required` tinyint(4) DEFAULT '0' COMMENT 'Is membership sign up optional',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this membership_block enabled',
  `new_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_text` text COLLATE utf8_unicode_ci,
  `renewal_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `renewal_text` text COLLATE utf8_unicode_ci,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_membership_payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_membership_payment`;

CREATE TABLE `log_civicrm_membership_payment` (
  `id` int(10) unsigned DEFAULT NULL,
  `membership_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Membership table',
  `contribution_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to contribution table.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_membership_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_membership_status`;

CREATE TABLE `log_civicrm_membership_status` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Membership Id',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name for Membership Status',
  `start_event` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Event when this status starts.',
  `start_event_adjust_unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Unit used for adjusting from start_event.',
  `start_event_adjust_interval` int(11) DEFAULT NULL COMMENT 'Status range begins this many units from start_event.',
  `end_event` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Event after which this status ends.',
  `end_event_adjust_unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Unit used for adjusting from the ending event.',
  `end_event_adjust_interval` int(11) DEFAULT NULL COMMENT 'Status range ends this many units from end_event.',
  `is_current_member` tinyint(4) DEFAULT NULL COMMENT 'Does this status aggregate to current members (e.g. New, Renewed, Grace might all be TRUE... while Unrenewed, Lapsed, Inactive would be FALSE).',
  `is_admin` tinyint(4) DEFAULT NULL COMMENT 'Is this status for admin/manual assignment only.',
  `weight` int(11) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL COMMENT 'Assign this status to a membership record if no other status match is found.',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this membership_status enabled.',
  `is_reserved` tinyint(4) DEFAULT '0' COMMENT 'Is this membership_status reserved.',
  `label` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_membership_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_membership_type`;

CREATE TABLE `log_civicrm_membership_type` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Membership Id',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this match entry for',
  `member_of_contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Owner organization for this membership type. FK to Contact ID',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'If membership is paid by a contribution - what financial type should be used. FK to civicrm_financial_type.id',
  `minimum_fee` decimal(18,9) DEFAULT '0.000000000' COMMENT 'Minimum fee for this membership (0 for free/complimentary memberships).',
  `duration_unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Unit in which membership period is expressed.',
  `duration_interval` int(11) DEFAULT NULL COMMENT 'Number of duration units in membership period (e.g. 1 year, 12 months).',
  `period_type` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Rolling membership period starts on signup date. Fixed membership periods start on fixed_period_start_day.',
  `fixed_period_start_day` int(11) DEFAULT NULL COMMENT 'For fixed period memberships, month and day (mmdd) on which subscription/membership will start. Period start is back-dated unless after rollover day.',
  `fixed_period_rollover_day` int(11) DEFAULT NULL COMMENT 'For fixed period memberships, signups after this day (mmdd) rollover to next period.',
  `relationship_type_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'FK to Relationship Type ID',
  `relationship_direction` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_related` int(11) DEFAULT NULL COMMENT 'Maximum number of related memberships.',
  `visibility` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `receipt_text_signup` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Receipt Text for membership signup',
  `receipt_text_renewal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Receipt Text for membership renewal',
  `auto_renew` tinyint(4) DEFAULT '0' COMMENT '0 = No auto-renew option; 1 = Give option, but not required; 2 = Auto-renew required;',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this membership_type enabled',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_msg_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_msg_template`;

CREATE TABLE `log_civicrm_msg_template` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Message Template ID',
  `msg_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Descriptive title of message',
  `msg_subject` text COLLATE utf8_unicode_ci COMMENT 'Subject for email message.',
  `msg_text` longtext COLLATE utf8_unicode_ci COMMENT 'Text formatted message',
  `msg_html` longtext COLLATE utf8_unicode_ci COMMENT 'HTML formatted message',
  `is_active` tinyint(4) DEFAULT '1',
  `workflow_id` int(10) unsigned DEFAULT NULL COMMENT 'a pseudo-FK to civicrm_option_value',
  `is_default` tinyint(4) DEFAULT '1' COMMENT 'is this the default message template for the workflow referenced by workflow_id?',
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'is this the reserved message template which we ship for the workflow referenced by workflow_id?',
  `pdf_format_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_option_value containing PDF Page Format.',
  `is_sms` tinyint(4) DEFAULT '0' COMMENT 'Is this message template used for sms?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_navigation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_navigation`;

CREATE TABLE `log_civicrm_navigation` (
  `id` int(10) unsigned DEFAULT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this navigation item for',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Navigation Title',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Internal Name',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'url in case of custom navigation link',
  `permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Permission for menu item',
  `permission_operator` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Permission Operator',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent navigation item, used for grouping',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this navigation item active?',
  `has_separator` tinyint(4) DEFAULT NULL COMMENT 'If separator needs to be added after this menu item',
  `weight` int(11) DEFAULT NULL COMMENT 'Ordering of the navigation items in various blocks.',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'CSS class name for an icon',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_note
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_note`;

CREATE TABLE `log_civicrm_note` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Note ID',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of table where item being referenced is stored.',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to the referenced item.',
  `note` text COLLATE utf8_unicode_ci COMMENT 'Note and/or Comment.',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID creator',
  `modified_date` date DEFAULT NULL COMMENT 'When was this note last modified/edited',
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'subject of note description',
  `privacy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foreign Key to Note Privacy Level (which is an option value pair and hence an implicit FK)',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_openid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_openid`;

CREATE TABLE `log_civicrm_openid` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique OpenID ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `location_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Location does this email belong to.',
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'the OpenID (or OpenID-style http://username.domain/) unique identifier for this contact mainly used for logging in to CiviCRM',
  `allowed_to_login` tinyint(4) DEFAULT '0' COMMENT 'Whether or not this user is allowed to login',
  `is_primary` tinyint(4) DEFAULT '0' COMMENT 'Is this the primary email for this contact and location.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_option_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_option_group`;

CREATE TABLE `log_civicrm_option_group` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Option Group ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Option group name. Used as selection key by class properties which lookup options in civicrm_option_value.',
  `is_reserved` tinyint(4) DEFAULT '1' COMMENT 'Is this a predefined system option group (i.e. it can not be deleted)?',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this option group active?',
  `is_locked` int(1) DEFAULT '0' COMMENT 'A lock to remove the ability to add new options via the UI',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Data Type of Option Group.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_option_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_option_value`;

CREATE TABLE `log_civicrm_option_value` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Option ID',
  `option_group_id` int(10) unsigned DEFAULT NULL COMMENT 'Group which this option belongs to.',
  `value` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The actual value stored (as a foreign key) in the data record. Functions which need lookup option_value.title should use civicrm_option_value.option_group_id plus civicrm_option_value.value as the key.',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Stores a fixed (non-translated) name for this option value. Lookup functions should use the name as the key for the option value row.',
  `grouping` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Use to sort and/or set display properties for sub-set(s) of options within an option group. EXAMPLE: Use for college_interest field, to differentiate partners from non-partners.',
  `filter` int(10) unsigned DEFAULT NULL COMMENT 'Bitwise logic can be used to create subsets of options within an option_group for different uses.',
  `is_default` tinyint(4) DEFAULT '0' COMMENT 'Is this the default option for the group?',
  `weight` int(10) unsigned DEFAULT NULL COMMENT 'Controls display sort order.',
  `is_optgroup` tinyint(4) DEFAULT '0' COMMENT 'Is this row simply a display header? Expected usage is to render these as OPTGROUP tags within a SELECT field list of options?',
  `is_reserved` tinyint(4) DEFAULT '0' COMMENT 'Is this a predefined system object?',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this option active?',
  `component_id` int(10) unsigned DEFAULT NULL COMMENT 'Component that this option value belongs/caters to.',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this option value for',
  `visibility_id` int(10) unsigned DEFAULT NULL,
  `label` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'crm-i icon class',
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hex color value e.g. #ffffff',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_participant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_participant`;

CREATE TABLE `log_civicrm_participant` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Participant Id',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `event_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Event ID',
  `status_id` int(10) unsigned DEFAULT '1' COMMENT 'Participant status ID. FK to civicrm_participant_status_type. Default of 1 should map to status = Registered.',
  `role_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Participant role ID. Implicit FK to civicrm_option_value where option_group = participant_role.',
  `register_date` datetime DEFAULT NULL COMMENT 'When did contact register for event?',
  `source` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Source of this event registration.',
  `fee_level` text COLLATE utf8_unicode_ci COMMENT 'Populate with the label (text) associated with a fee level for paid events with multiple levels. Note that we store the label value and not the key',
  `is_test` tinyint(4) DEFAULT '0',
  `is_pay_later` tinyint(4) DEFAULT '0',
  `fee_amount` decimal(20,2) DEFAULT NULL COMMENT 'actual processor fee if known - may be 0.',
  `registered_by_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Participant ID',
  `discount_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Discount ID',
  `fee_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value derived from config setting.',
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'The campaign for which this participant has been registered.',
  `discount_amount` int(10) unsigned DEFAULT NULL COMMENT 'Discount Amount',
  `cart_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_event_carts',
  `must_wait` int(11) DEFAULT NULL COMMENT 'On Waiting List',
  `transferred_to_contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Contact to which the event registration is transferred',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_participant_payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_participant_payment`;

CREATE TABLE `log_civicrm_participant_payment` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Participant Payment Id',
  `participant_id` int(10) unsigned DEFAULT NULL COMMENT 'Participant Id (FK)',
  `contribution_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to contribution table.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_participant_status_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_participant_status_type`;

CREATE TABLE `log_civicrm_participant_status_type` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'unique participant status type id',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'non-localized name of the status type',
  `class` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'the general group of status type this one belongs to',
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'whether this is a status type required by the system',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'whether this status type is active',
  `is_counted` tinyint(4) DEFAULT NULL COMMENT 'whether this status type is counted against event size limit',
  `weight` int(10) unsigned DEFAULT NULL COMMENT 'controls sort order',
  `visibility_id` int(10) unsigned DEFAULT NULL COMMENT 'whether the status type is visible to the public, an implicit foreign key to option_value.value related to the `visibility` option_group',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_payment_processor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_payment_processor`;

CREATE TABLE `log_civicrm_payment_processor` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Payment Processor ID',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this match entry for',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Payment Processor Name.',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Payment Processor Description.',
  `payment_processor_type_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this processor active?',
  `is_default` tinyint(4) DEFAULT NULL COMMENT 'Is this processor the default?',
  `is_test` tinyint(4) DEFAULT NULL COMMENT 'Is this processor for a test site?',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signature` longtext COLLATE utf8_unicode_ci,
  `url_site` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_api` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_recur` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_button` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_mode` int(10) unsigned DEFAULT NULL COMMENT 'Billing Mode',
  `is_recur` tinyint(4) DEFAULT NULL COMMENT 'Can process recurring contributions',
  `payment_type` int(10) unsigned DEFAULT '1' COMMENT 'Payment Type: Credit or Debit',
  `payment_instrument_id` int(10) unsigned DEFAULT '1' COMMENT 'Payment Instrument ID',
  `accepted_credit_cards` text COLLATE utf8_unicode_ci COMMENT 'array of accepted credit card types',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_payment_processor_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_payment_processor_type`;

CREATE TABLE `log_civicrm_payment_processor_type` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Payment Processor Type ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Payment Processor Name.',
  `title` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Payment Processor Name.',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Payment Processor Description.',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this processor active?',
  `is_default` tinyint(4) DEFAULT NULL COMMENT 'Is this processor the default?',
  `user_name_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signature_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_site_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_api_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_recur_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_button_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_site_test_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_api_test_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_recur_test_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_button_test_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_mode` int(10) unsigned DEFAULT NULL COMMENT 'Billing Mode',
  `is_recur` tinyint(4) DEFAULT NULL COMMENT 'Can process recurring contributions',
  `payment_type` int(10) unsigned DEFAULT '1' COMMENT 'Payment Type: Credit or Debit',
  `payment_instrument_id` int(10) unsigned DEFAULT '1' COMMENT 'Payment Instrument ID',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_payment_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_payment_token`;

CREATE TABLE `log_civicrm_payment_token` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Payment Token ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID for the owner of the token',
  `payment_processor_id` int(10) unsigned DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Externally provided token string',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'Date created',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'Contact ID of token creator',
  `expiry_date` datetime DEFAULT NULL COMMENT 'Date this token expires',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email at the time of token creation. Useful for fraud forensics',
  `billing_first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Billing first name at the time of token creation. Useful for fraud forensics',
  `billing_middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Billing middle name at the time of token creation. Useful for fraud forensics',
  `billing_last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Billing last name at the time of token creation. Useful for fraud forensics',
  `masked_account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Holds the part of the card number or account details that may be retained or displayed',
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'IP used when creating the token. Useful for fraud forensics',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_pcp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_pcp`;

CREATE TABLE `log_civicrm_pcp` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Personal Campaign Page ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `status_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro_text` text COLLATE utf8_unicode_ci,
  `page_text` text COLLATE utf8_unicode_ci,
  `donate_link_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(10) unsigned DEFAULT NULL COMMENT 'The Contribution or Event Page which triggered this pcp',
  `page_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT 'contribute' COMMENT 'The type of PCP this is: contribute or event',
  `pcp_block_id` int(10) unsigned DEFAULT NULL COMMENT 'The pcp block that this pcp page was created from',
  `is_thermometer` int(10) unsigned DEFAULT '0',
  `is_honor_roll` int(10) unsigned DEFAULT '0',
  `goal_amount` decimal(20,2) DEFAULT NULL COMMENT 'Goal amount of this Personal Campaign Page.',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `is_active` tinyint(4) DEFAULT '0' COMMENT 'Is Personal Campaign Page enabled/active?',
  `is_notify` int(11) DEFAULT '0',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_pcp_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_pcp_block`;

CREATE TABLE `log_civicrm_pcp_block` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'PCP block Id',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contribution_page.id OR civicrm_event.id',
  `target_entity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'contribute' COMMENT 'The type of entity that this pcp targets',
  `target_entity_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity that this pcp targets',
  `supporter_profile_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_uf_group.id. Does Personal Campaign Page require manual activation by administrator? (is inactive by default after setup)?',
  `is_approval_needed` tinyint(4) DEFAULT NULL COMMENT 'Does Personal Campaign Page require manual activation by administrator? (is inactive by default after setup)?',
  `is_tellfriend_enabled` tinyint(4) DEFAULT NULL COMMENT 'Does Personal Campaign Page allow using tell a friend?',
  `tellfriend_limit` int(10) unsigned DEFAULT NULL COMMENT 'Maximum recipient fields allowed in tell a friend',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is Personal Campaign Page Block enabled/active?',
  `notify_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'If set, notification is automatically emailed to this email-address on create/update Personal Campaign Page',
  `link_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_notify_id` int(11) DEFAULT NULL COMMENT 'FK to option_value where option_group = pcp_owner_notification',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_persistent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_persistent`;

CREATE TABLE `log_civicrm_persistent` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Persistent Record Id',
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Context for which name data pair is to be stored',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of Context',
  `data` longtext COLLATE utf8_unicode_ci COMMENT 'data associated with name',
  `is_config` tinyint(4) DEFAULT '0' COMMENT 'Config Settings',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_phone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_phone`;

CREATE TABLE `log_civicrm_phone` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Phone ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `location_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Location does this phone belong to.',
  `is_primary` tinyint(4) DEFAULT '0' COMMENT 'Is this the primary phone for this contact and location.',
  `is_billing` tinyint(4) DEFAULT '0' COMMENT 'Is this the billing?',
  `mobile_provider_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Mobile Provider does this phone belong to.',
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Complete phone number.',
  `phone_ext` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional extension for a phone number.',
  `phone_numeric` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Phone number stripped of all whitespace, letters, and punctuation.',
  `phone_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Which type of phone does this number belongs.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_pledge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_pledge`;

CREATE TABLE `log_civicrm_pledge` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Pledge ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to civicrm_contact.id .',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Financial Type',
  `contribution_page_id` int(10) unsigned DEFAULT NULL COMMENT 'The Contribution Page which triggered this contribution',
  `amount` decimal(20,2) DEFAULT NULL COMMENT 'Total pledged amount.',
  `original_installment_amount` decimal(20,2) DEFAULT NULL COMMENT 'Original amount for each of the installments.',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `frequency_unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'month' COMMENT 'Time units for recurrence of pledge payments.',
  `frequency_interval` int(10) unsigned DEFAULT '1' COMMENT 'Number of time units for recurrence of pledge payments.',
  `frequency_day` int(10) unsigned DEFAULT '3' COMMENT 'Day in the period when the pledge payment is due e.g. 1st of month, 15th etc. Use this to set the scheduled dates for pledge payments.',
  `installments` int(10) unsigned DEFAULT '1' COMMENT 'Total number of payments to be made.',
  `start_date` datetime DEFAULT NULL COMMENT 'The date the first scheduled pledge occurs.',
  `create_date` datetime DEFAULT NULL COMMENT 'When this pledge record was created.',
  `acknowledge_date` datetime DEFAULT NULL COMMENT 'When a pledge acknowledgement message was sent to the contributor.',
  `modified_date` datetime DEFAULT NULL COMMENT 'Last updated date for this pledge record.',
  `cancel_date` datetime DEFAULT NULL COMMENT 'Date this pledge was cancelled by contributor.',
  `end_date` datetime DEFAULT NULL COMMENT 'Date this pledge finished successfully (total pledge payments equal to or greater than pledged amount).',
  `max_reminders` int(10) unsigned DEFAULT '1' COMMENT 'The maximum number of payment reminders to send for any given payment.',
  `initial_reminder_day` int(10) unsigned DEFAULT '5' COMMENT 'Send initial reminder this many days prior to the payment due date.',
  `additional_reminder_day` int(10) unsigned DEFAULT '5' COMMENT 'Send additional reminder this many days after last one sent, up to maximum number of reminders.',
  `status_id` int(10) unsigned DEFAULT NULL COMMENT 'Implicit foreign key to civicrm_option_values in the contribution_status option group.',
  `is_test` tinyint(4) DEFAULT '0',
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'The campaign for which this pledge has been initiated.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_pledge_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_pledge_block`;

CREATE TABLE `log_civicrm_pledge_block` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Pledge ID',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'physical tablename for entity being joined to pledge, e.g. civicrm_contact',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to entity table specified in entity_table column.',
  `pledge_frequency_unit` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Delimited list of supported frequency units',
  `is_pledge_interval` tinyint(4) DEFAULT '0' COMMENT 'Is frequency interval exposed on the contribution form.',
  `max_reminders` int(10) unsigned DEFAULT '1' COMMENT 'The maximum number of payment reminders to send for any given payment.',
  `initial_reminder_day` int(10) unsigned DEFAULT '5' COMMENT 'Send initial reminder this many days prior to the payment due date.',
  `additional_reminder_day` int(10) unsigned DEFAULT '5' COMMENT 'Send additional reminder this many days after last one sent, up to maximum number of reminders.',
  `pledge_start_date` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The date that the first scheduled pledge occurs.',
  `is_pledge_start_date_visible` tinyint(4) DEFAULT '0' COMMENT 'If true - recurring start date is shown.',
  `is_pledge_start_date_editable` tinyint(4) DEFAULT '0' COMMENT 'If true - recurring start date is editable.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_pledge_payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_pledge_payment`;

CREATE TABLE `log_civicrm_pledge_payment` (
  `id` int(10) unsigned DEFAULT NULL,
  `pledge_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Pledge table',
  `contribution_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to contribution table.',
  `scheduled_amount` decimal(20,2) DEFAULT NULL COMMENT 'Pledged amount for this payment (the actual contribution amount might be different).',
  `actual_amount` decimal(20,2) DEFAULT NULL COMMENT 'Actual amount that is paid as the Pledged installment amount.',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `scheduled_date` datetime DEFAULT NULL COMMENT 'The date the pledge payment is supposed to happen.',
  `reminder_date` datetime DEFAULT NULL COMMENT 'The date that the most recent payment reminder was sent.',
  `reminder_count` int(10) unsigned DEFAULT '0' COMMENT 'The number of payment reminders sent.',
  `status_id` int(10) unsigned DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_preferences_date
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_preferences_date`;

CREATE TABLE `log_civicrm_preferences_date` (
  `id` int(10) unsigned DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The meta name for this date (fixed in code)',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Description of this date type.',
  `start` int(11) DEFAULT NULL COMMENT 'The start offset relative to current year',
  `end` int(11) DEFAULT NULL COMMENT 'The end offset relative to current year, can be negative',
  `date_format` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The date type',
  `time_format` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'time format',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_premiums
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_premiums`;

CREATE TABLE `log_civicrm_premiums` (
  `id` int(10) unsigned DEFAULT NULL,
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Joins these premium settings to another object. Always civicrm_contribution_page for now.',
  `entity_id` int(10) unsigned DEFAULT NULL,
  `premiums_active` tinyint(4) DEFAULT '0' COMMENT 'Is the Premiums feature enabled for this page?',
  `premiums_contact_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'This email address is included in receipts if it is populated and a premium has been selected.',
  `premiums_contact_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'This phone number is included in receipts if it is populated and a premium has been selected.',
  `premiums_display_min_contribution` tinyint(4) DEFAULT NULL COMMENT 'Boolean. Should we automatically display minimum contribution amount text after the premium descriptions.',
  `premiums_nothankyou_position` int(10) unsigned DEFAULT '1',
  `premiums_intro_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `premiums_intro_text` text COLLATE utf8_unicode_ci,
  `premiums_nothankyou_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_premiums_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_premiums_product`;

CREATE TABLE `log_civicrm_premiums_product` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Contribution ID',
  `premiums_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to premiums settings record.',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to each product object.',
  `weight` int(10) unsigned DEFAULT NULL,
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Financial Type.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_price_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_price_field`;

CREATE TABLE `log_civicrm_price_field` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Price Field',
  `price_set_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_price_set',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Variable name/programmatic handle for this field.',
  `html_type` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_enter_qty` tinyint(4) DEFAULT '0' COMMENT 'Enter a quantity for this field?',
  `weight` int(11) DEFAULT '1' COMMENT 'Order in which the fields should appear',
  `is_display_amounts` tinyint(4) DEFAULT '1' COMMENT 'Should the price be displayed next to the label for each option?',
  `options_per_line` int(10) unsigned DEFAULT '1' COMMENT 'number of options per line for checkbox and radio',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this price field active',
  `is_required` tinyint(4) DEFAULT '1' COMMENT 'Is this price field required (value must be > 1)',
  `active_on` datetime DEFAULT NULL COMMENT 'If non-zero, do not show this field before the date specified',
  `expire_on` datetime DEFAULT NULL COMMENT 'If non-zero, do not show this field after the date specified',
  `javascript` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional scripting attributes for field',
  `visibility_id` int(10) unsigned DEFAULT '1' COMMENT 'Implicit FK to civicrm_option_group with name = ''visibility''',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_pre` text COLLATE utf8_unicode_ci,
  `help_post` text COLLATE utf8_unicode_ci,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_price_field_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_price_field_value`;

CREATE TABLE `log_civicrm_price_field_value` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Price Field Value',
  `price_field_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_price_field',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Price field option name',
  `amount` decimal(18,9) DEFAULT NULL COMMENT 'Price field option amount',
  `count` int(10) unsigned DEFAULT NULL COMMENT 'Number of participants per field option',
  `max_value` int(10) unsigned DEFAULT NULL COMMENT 'Max number of participants per field options',
  `weight` int(11) DEFAULT '1' COMMENT 'Order in which the field options should appear',
  `membership_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Membership Type',
  `membership_num_terms` int(10) unsigned DEFAULT NULL COMMENT 'Number of terms for this membership',
  `is_default` tinyint(4) DEFAULT '0' COMMENT 'Is this default price field option',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this price field value active',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Financial Type.',
  `non_deductible_amount` decimal(20,2) DEFAULT '0.00' COMMENT 'Portion of total amount which is NOT tax deductible.',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `help_pre` text COLLATE utf8_unicode_ci COMMENT 'Price field option pre help text.',
  `help_post` text COLLATE utf8_unicode_ci COMMENT 'Price field option post help text.',
  `visibility_id` int(10) unsigned DEFAULT '1' COMMENT 'Implicit FK to civicrm_option_group with name = ''visibility''',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_price_set
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_price_set`;

CREATE TABLE `log_civicrm_price_set` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Price Set',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this price-set for',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Variable name/programmatic handle for this set of price fields.',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this price set active',
  `javascript` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional Javascript script function(s) included on the form with this price_set. Can be used for conditional',
  `extends` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'What components are using this price set?',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Financial Type(for membership price sets only).',
  `is_quick_config` tinyint(4) DEFAULT '0' COMMENT 'Is set if edited on Contribution or Event Page rather than through Manage Price Sets',
  `is_reserved` tinyint(4) DEFAULT '0' COMMENT 'Is this a predefined system price set  (i.e. it can not be deleted, edited)?',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_pre` text COLLATE utf8_unicode_ci,
  `help_post` text COLLATE utf8_unicode_ci,
  `min_amount` int(10) unsigned DEFAULT '0' COMMENT 'Minimum Amount required for this set.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_price_set_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_price_set_entity`;

CREATE TABLE `log_civicrm_price_set_entity` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Price Set Entity',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Table which uses this price set',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Item in table',
  `price_set_id` int(10) unsigned DEFAULT NULL COMMENT 'price set being used',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_print_label
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_print_label`;

CREATE TABLE `log_civicrm_print_label` (
  `id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User title for for this label layout',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'variable name/programmatic handle for this field.',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Description of this label layout',
  `label_format_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'This refers to name column of civicrm_option_value row in name_badge option group',
  `label_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Implicit FK to civicrm_option_value row in NEW label_type option group',
  `data` longtext COLLATE utf8_unicode_ci COMMENT 'contains json encode configurations options',
  `is_default` tinyint(4) DEFAULT '1' COMMENT 'Is this default?',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this option active?',
  `is_reserved` tinyint(4) DEFAULT '1' COMMENT 'Is this reserved label?',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who created this label layout',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_product`;

CREATE TABLE `log_civicrm_product` (
  `id` int(10) unsigned DEFAULT NULL,
  `sku` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional product sku or code.',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Full or relative URL to uploaded image - fullsize.',
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Full or relative URL to image thumbnail.',
  `price` decimal(20,2) DEFAULT NULL COMMENT 'Sell price or market value for premiums. For tax-deductible contributions, this will be stored as non_deductible_amount in the contribution record.',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '3 character string, value from config setting or input via user.',
  `financial_type_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Financial Type.',
  `min_contribution` decimal(20,2) DEFAULT NULL COMMENT 'Minimum contribution required to be eligible to select this premium.',
  `cost` decimal(20,2) DEFAULT NULL COMMENT 'Actual cost of this product. Useful to determine net return from sale or using this as an incentive.',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Disabling premium removes it from the premiums_premium join table below.',
  `period_type` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'rolling' COMMENT 'Rolling means we set start/end based on current day, fixed means we set start/end for current year or month(e.g. 1 year + fixed -> we would set start/end for 1/1/06 thru 12/31/06 for any premium chosen in 2006) ',
  `fixed_period_start_day` int(11) DEFAULT '101' COMMENT 'Month and day (MMDD) that fixed period type subscription or membership starts.',
  `duration_unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'year',
  `duration_interval` int(11) DEFAULT NULL COMMENT 'Number of units for total duration of subscription, service, membership (e.g. 12 Months).',
  `frequency_unit` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'month' COMMENT 'Frequency unit and interval allow option to store actual delivery frequency for a subscription or service.',
  `frequency_interval` int(11) DEFAULT NULL COMMENT 'Number of units for delivery frequency of subscription, service, membership (e.g. every 3 Months).',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_recurring_entity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_recurring_entity`;

CREATE TABLE `log_civicrm_recurring_entity` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'primary key',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'recurring entity parent id',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'recurring entity child id',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'physical tablename for entity, e.g. civicrm_event',
  `mode` tinyint(4) DEFAULT '1' COMMENT '1-this entity, 2-this and the following entities, 3-all the entities',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_relationship
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_relationship`;

CREATE TABLE `log_civicrm_relationship` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Relationship ID',
  `contact_id_a` int(10) unsigned DEFAULT NULL COMMENT 'id of the first contact',
  `contact_id_b` int(10) unsigned DEFAULT NULL COMMENT 'id of the second contact',
  `relationship_type_id` int(10) unsigned DEFAULT NULL COMMENT 'id of the relationship',
  `start_date` date DEFAULT NULL COMMENT 'date when the relationship started',
  `end_date` date DEFAULT NULL COMMENT 'date when the relationship ended',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'is the relationship active ?',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional verbose description for the relationship.',
  `is_permission_a_b` tinyint(4) DEFAULT '0' COMMENT 'is contact a has permission to view / edit contact and\n  related data for contact b ?',
  `is_permission_b_a` tinyint(4) DEFAULT '0' COMMENT 'is contact b has permission to view / edit contact and\n  related data for contact a ?',
  `case_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_case',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_relationship_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_relationship_type`;

CREATE TABLE `log_civicrm_relationship_type` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Primary key',
  `name_a_b` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'name for relationship of contact_a to contact_b.',
  `label_a_b` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'label for relationship of contact_a to contact_b.',
  `name_b_a` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional name for relationship of contact_b to contact_a.',
  `label_b_a` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional label for relationship of contact_b to contact_a.',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional verbose description of the relationship type.',
  `contact_type_a` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'If defined, contact_a in a relationship of this type must be a specific contact_type.',
  `contact_type_b` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'If defined, contact_b in a relationship of this type must be a specific contact_type.',
  `contact_sub_type_a` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'If defined, contact_sub_type_a in a relationship of this type must be a specific contact_sub_type.',
  `contact_sub_type_b` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'If defined, contact_sub_type_b in a relationship of this type must be a specific contact_sub_type.',
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'Is this relationship type a predefined system type (can not be changed or de-activated)?',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this relationship type currently active (i.e. can be used when creating or editing relationships)?',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_report_instance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_report_instance`;

CREATE TABLE `log_civicrm_report_instance` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Report Instance ID',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this instance for',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Report Instance Title.',
  `report_id` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'FK to civicrm_option_value for the report template',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'when combined with report_id/template uniquely identifies the instance',
  `args` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'arguments that are passed in the url when invoking the instance',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Report Instance description.',
  `permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'permission required to be able to run this instance',
  `grouprole` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'role required to be able to run this instance',
  `form_values` text COLLATE utf8_unicode_ci COMMENT 'Submitted form values for this report',
  `is_active` tinyint(4) DEFAULT NULL COMMENT 'Is this entry active?',
  `email_subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Subject of email',
  `email_to` text COLLATE utf8_unicode_ci COMMENT 'comma-separated list of email addresses to send the report to',
  `email_cc` text COLLATE utf8_unicode_ci COMMENT 'comma-separated list of email addresses to send the report to',
  `header` text COLLATE utf8_unicode_ci COMMENT 'comma-separated list of email addresses to send the report to',
  `footer` text COLLATE utf8_unicode_ci COMMENT 'comma-separated list of email addresses to send the report to',
  `navigation_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to navigation ID',
  `drilldown_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to instance ID drilldown to',
  `is_reserved` tinyint(4) DEFAULT '0',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to contact table.',
  `owner_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to contact table.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_saved_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_saved_search`;

CREATE TABLE `log_civicrm_saved_search` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Saved search ID',
  `form_values` text COLLATE utf8_unicode_ci COMMENT 'Submitted form values for this search',
  `mapping_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to civicrm_mapping used for saved search-builder searches.',
  `search_custom_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to civicrm_option value table used for saved custom searches.',
  `where_clause` text COLLATE utf8_unicode_ci COMMENT 'the sql where clause if a saved search acl',
  `select_tables` text COLLATE utf8_unicode_ci COMMENT 'the tables to be included in a select data',
  `where_tables` text COLLATE utf8_unicode_ci COMMENT 'the tables to be included in the count statement',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_setting`;

CREATE TABLE `log_civicrm_setting` (
  `id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Unique name for setting',
  `value` text COLLATE utf8_unicode_ci COMMENT 'data associated with this group / name combo',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this menu item for',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID if the setting is localized to a contact',
  `is_domain` tinyint(4) DEFAULT NULL COMMENT 'Is this setting a contact specific or site wide setting?',
  `component_id` int(10) unsigned DEFAULT NULL COMMENT 'Component that this menu item belongs to',
  `created_date` datetime DEFAULT NULL COMMENT 'When was the setting created',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who created this setting',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_sms_provider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_sms_provider`;

CREATE TABLE `log_civicrm_sms_provider` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'SMS Provider ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Provider internal name points to option_value of option_group sms_provider_name',
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Provider name visible to user',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_type` int(10) unsigned DEFAULT NULL COMMENT 'points to value in civicrm_option_value for group sms_api_type',
  `api_url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_params` text COLLATE utf8_unicode_ci COMMENT 'the api params in xml, http or smtp format',
  `is_default` tinyint(4) DEFAULT '0',
  `is_active` tinyint(4) DEFAULT '0',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this sms provier for',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_state_province
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_state_province`;

CREATE TABLE `log_civicrm_state_province` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'State / Province ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of State / Province',
  `abbreviation` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '2-4 Character Abbreviation of State / Province',
  `country_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of Country that State / Province belong',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_status_pref
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_status_pref`;

CREATE TABLE `log_civicrm_status_pref` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Status Preference ID',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this Status Preference for',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of the status check this preference references.',
  `hush_until` date DEFAULT NULL COMMENT 'expires ignore_severity.  NULL never hushes.',
  `ignore_severity` int(10) unsigned DEFAULT '1' COMMENT 'Hush messages up to and including this severity.',
  `prefs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'These settings are per-check, and can''t be compared across checks.',
  `check_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'These values are per-check, and can''t be compared across checks.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_subscription_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_subscription_history`;

CREATE TABLE `log_civicrm_subscription_history` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Internal Id',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'Contact Id',
  `group_id` int(10) unsigned DEFAULT NULL COMMENT 'Group Id',
  `date` timestamp NULL DEFAULT NULL COMMENT 'Date of the (un)subscription',
  `method` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'How the (un)subscription was triggered',
  `status` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The state of the contact within the group',
  `tracking` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'IP address or other tracking info',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_survey
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_survey`;

CREATE TABLE `log_civicrm_survey` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Survey id.',
  `campaign_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to the Campaign.',
  `activity_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Implicit FK to civicrm_option_value where option_group = activity_type',
  `recontact_interval` text COLLATE utf8_unicode_ci COMMENT 'Recontact intervals for each status.',
  `release_frequency` int(10) unsigned DEFAULT NULL COMMENT 'Number of days for recurrence of release.',
  `max_number_of_contacts` int(10) unsigned DEFAULT NULL COMMENT 'Maximum number of contacts to allow for survey.',
  `default_number_of_contacts` int(10) unsigned DEFAULT NULL COMMENT 'Default number of contacts to allow for survey.',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this survey enabled or disabled/cancelled?',
  `is_default` tinyint(4) DEFAULT '0' COMMENT 'Is this default survey?',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who created this Survey.',
  `created_date` datetime DEFAULT NULL COMMENT 'Date and time that Survey was created.',
  `last_modified_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who recently edited this Survey.',
  `last_modified_date` datetime DEFAULT NULL COMMENT 'Date and time that Survey was edited last time.',
  `result_id` int(10) unsigned DEFAULT NULL COMMENT 'Used to store option group id.',
  `bypass_confirm` tinyint(4) DEFAULT '0' COMMENT 'Bypass the email verification.',
  `is_share` tinyint(4) DEFAULT '1' COMMENT 'Can people share the petition through social media?',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `thankyou_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thankyou_text` text COLLATE utf8_unicode_ci,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_tag`;

CREATE TABLE `log_civicrm_tag` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Tag ID',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of Tag.',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Optional verbose description of the tag.',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Optional parent id for this tag.',
  `is_selectable` tinyint(4) DEFAULT '1' COMMENT 'Is this tag selectable / displayed',
  `is_reserved` tinyint(4) DEFAULT '0',
  `is_tagset` tinyint(4) DEFAULT '0',
  `used_for` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who created this tag',
  `created_date` datetime DEFAULT NULL COMMENT 'Date and time that tag was created.',
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hex color value e.g. #ffffff',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_tell_friend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_tell_friend`;

CREATE TABLE `log_civicrm_tell_friend` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Friend ID',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of table where item being referenced is stored.',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to the referenced item.',
  `general_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL for general info about the organization - included in the email sent to friends.',
  `is_active` tinyint(4) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `suggested_message` text COLLATE utf8_unicode_ci,
  `thankyou_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thankyou_text` text COLLATE utf8_unicode_ci,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_timezone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_timezone`;

CREATE TABLE `log_civicrm_timezone` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Timezone Id',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Timezone full name',
  `abbreviation` char(3) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ISO Code for timezone abbreviation',
  `gmt` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'GMT name of the timezone',
  `offset` int(11) DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL COMMENT 'Country Id',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_uf_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_uf_field`;

CREATE TABLE `log_civicrm_uf_field` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique table ID',
  `uf_group_id` int(10) unsigned DEFAULT NULL COMMENT 'Which form does this field belong to.',
  `field_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name for CiviCRM field which is being exposed for sharing.',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this field currently shareable? If false, hide the field for all sharing contexts.',
  `is_view` tinyint(4) DEFAULT '0' COMMENT 'the field is view only and not editable in user forms.',
  `is_required` tinyint(4) DEFAULT '0' COMMENT 'Is this field required when included in a user or registration form?',
  `weight` int(11) DEFAULT '1' COMMENT 'Controls field display order when user framework fields are displayed in registration and account editing forms.',
  `visibility` varchar(32) COLLATE utf8_unicode_ci DEFAULT 'User and User Admin Only' COMMENT 'In what context(s) is this field visible.',
  `in_selector` tinyint(4) DEFAULT '0' COMMENT 'Is this field included as a column in the selector table?',
  `is_searchable` tinyint(4) DEFAULT '0' COMMENT 'Is this field included search form of profile?',
  `location_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Location type of this mapping, if required',
  `phone_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Phone Type Id, if required',
  `website_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Website Type Id, if required',
  `field_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'This field saves field type (ie individual,household.. field etc).',
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'Is this field reserved for use by some other CiviCRM functionality?',
  `is_multi_summary` tinyint(4) DEFAULT '0' COMMENT 'Include in multi-record listing?',
  `help_post` text COLLATE utf8_unicode_ci,
  `help_pre` text COLLATE utf8_unicode_ci,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_uf_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_uf_group`;

CREATE TABLE `log_civicrm_uf_group` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique table ID',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this form currently active? If false, hide all related fields for all sharing contexts.',
  `group_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'This column will store a comma separated list of the type(s) of profile fields.',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Optional verbose description of the profile.',
  `limit_listings_group_id` int(10) unsigned DEFAULT NULL COMMENT 'Group id, foriegn key from civicrm_group',
  `post_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Redirect to URL.',
  `add_to_group_id` int(10) unsigned DEFAULT NULL COMMENT 'foreign key to civicrm_group_id',
  `add_captcha` tinyint(4) DEFAULT '0' COMMENT 'Should a CAPTCHA widget be included this Profile form.',
  `is_map` tinyint(4) DEFAULT '0' COMMENT 'Do we want to map results from this profile.',
  `is_edit_link` tinyint(4) DEFAULT '0' COMMENT 'Should edit link display in profile selector',
  `is_uf_link` tinyint(4) DEFAULT '0' COMMENT 'Should we display a link to the website profile in profile selector',
  `is_update_dupe` tinyint(4) DEFAULT '0' COMMENT 'Should we update the contact record if we find a duplicate',
  `cancel_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Redirect to URL when Cancle button clik .',
  `is_cms_user` tinyint(4) DEFAULT '0' COMMENT 'Should we create a cms user for this profile ',
  `notify` text COLLATE utf8_unicode_ci,
  `is_reserved` tinyint(4) DEFAULT NULL COMMENT 'Is this group reserved for use by some other CiviCRM functionality?',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of the UF group for directly addressing it in the codebase',
  `created_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to civicrm_contact, who created this UF group',
  `created_date` datetime DEFAULT NULL COMMENT 'Date and time this UF group was created.',
  `is_proximity_search` tinyint(4) DEFAULT '0' COMMENT 'Should we include proximity search feature in this profile search form?',
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_pre` text COLLATE utf8_unicode_ci,
  `help_post` text COLLATE utf8_unicode_ci,
  `cancel_button_text` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Custom Text to display on the cancel button when used in create or edit mode',
  `submit_button_text` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Custom Text to display on the submit button on profile edit/create screens',
  `frontend_title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Profile Form Public title',
  `add_cancel_button` tinyint(4) DEFAULT '1' COMMENT 'Should a Cancel button be included in this Profile form.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_uf_join
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_uf_join`;

CREATE TABLE `log_civicrm_uf_join` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique table ID',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this join currently active?',
  `module` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Module which owns this uf_join instance, e.g. User Registration, CiviDonate, etc.',
  `entity_table` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Name of table where item being referenced is stored. Modules which only need a single collection of uf_join instances may choose not to populate entity_table and entity_id.',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to the referenced item.',
  `weight` int(11) DEFAULT '1' COMMENT 'Controls display order when multiple user framework groups are setup for concurrent display.',
  `uf_group_id` int(10) unsigned DEFAULT NULL COMMENT 'Which form does this field belong to.',
  `module_data` longtext COLLATE utf8_unicode_ci COMMENT 'Json serialized array of data used by the ufjoin.module',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_uf_match
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_uf_match`;

CREATE TABLE `log_civicrm_uf_match` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'System generated ID.',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Domain is this match entry for',
  `uf_id` int(10) unsigned DEFAULT NULL COMMENT 'UF ID',
  `uf_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UF Name',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UI language preferred by the given user/contact',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_uit_migrate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_uit_migrate`;

CREATE TABLE `log_civicrm_uit_migrate` (
  `source_id` varchar(255) DEFAULT NULL COMMENT 'Unique Source ID',
  `dest_id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Destination ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Entity type',
  `status` varchar(255) DEFAULT NULL COMMENT 'Status',
  `hash` varchar(255) DEFAULT NULL COMMENT 'Hash',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'Modified.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=latin1;



# Dump of table log_civicrm_value_about_the_organization_3
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_about_the_organization_3`;

CREATE TABLE `log_civicrm_value_about_the_organization_3` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `kleur_27` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rechtsvorm_28` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `projectrekening_29` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publiekswerking_30` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locatiehuur_l_200p__31` tinyint(4) DEFAULT NULL,
  `locatiehuur_m_50_200_32` tinyint(4) DEFAULT NULL,
  `locatiehuur_s_50p__33` tinyint(4) DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_value_evenement_geg_5
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_evenement_geg_5`;

CREATE TABLE `log_civicrm_value_evenement_geg_5` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `erfgoed_type_15` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activiteit_type_21` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `afbeelding_22` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auteur_23` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `labels_24` text COLLATE utf8_unicode_ci,
  `inschrijving_25` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doelgroep_26` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_value_financial_administration_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_financial_administration_2`;

CREATE TABLE `log_civicrm_value_financial_administration_2` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `vat_number_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vat_mandatory_3` tinyint(4) DEFAULT NULL,
  `registration_number_4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iban_5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bic_6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_value_mailchimp_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_mailchimp_settings`;

CREATE TABLE `log_civicrm_value_mailchimp_settings` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL,
  `mc_list_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mc_grouping_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mc_group_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_mc_update_grouping` tinyint(4) DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_value_member_administration_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_member_administration_1`;

CREATE TABLE `log_civicrm_value_member_administration_1` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `membership_number_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `insz_17` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_value_monument_gege_6
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_monument_gege_6`;

CREATE TABLE `log_civicrm_value_monument_gege_6` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `erfgoed_type_13` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activiteit_type_14` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `toegankelijkheid_16` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_value_partner_gegev_11
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_partner_gegev_11`;

CREATE TABLE `log_civicrm_value_partner_gegev_11` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `nom_43` tinyint(4) DEFAULT NULL,
  `bonnen_44` tinyint(4) DEFAULT NULL,
  `getrouwheid_45` tinyint(4) DEFAULT NULL,
  `kaart_46` tinyint(4) DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_value_persoon_gegev_8
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_persoon_gegev_8`;

CREATE TABLE `log_civicrm_value_persoon_gegev_8` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `afdeling_34` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `functie_35` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_in_nieuwsbrief_archie__48` tinyint(4) DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_value_uitpas_gegeve_7
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_uitpas_gegeve_7`;

CREATE TABLE `log_civicrm_value_uitpas_gegeve_7` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `uitpas_kaartnummer_18` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uitpas_communicatie_19` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `uit_uuid_20` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_value_voordeel_gege_9
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_voordeel_gege_9`;

CREATE TABLE `log_civicrm_value_voordeel_gege_9` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `type_36` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `omschrijving_37` text COLLATE utf8_unicode_ci,
  `duur_voordeel_38` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_value_website_gegev_12
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_value_website_gegev_12`;

CREATE TABLE `log_civicrm_value_website_gegev_12` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Default MySQL primary key',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Table that this extends',
  `publiek_47` tinyint(4) DEFAULT '0',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_website`;

CREATE TABLE `log_civicrm_website` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Unique Website ID',
  `contact_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Contact ID',
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Website',
  `website_type_id` int(10) unsigned DEFAULT NULL COMMENT 'Which Website type does this website belong to.',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_word_replacement
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_word_replacement`;

CREATE TABLE `log_civicrm_word_replacement` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Word replacement ID',
  `find_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Word which need to be replaced',
  `replace_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Word which will replace the word in find',
  `is_active` tinyint(4) DEFAULT '1' COMMENT 'Is this entry active?',
  `match_type` varchar(16) COLLATE utf8_unicode_ci DEFAULT 'wildcardMatch',
  `domain_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to Domain ID. This is for Domain specific word replacement',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table log_civicrm_worldregion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_civicrm_worldregion`;

CREATE TABLE `log_civicrm_worldregion` (
  `id` int(10) unsigned DEFAULT NULL COMMENT 'Country Id',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Region name to be associated with countries',
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_conn_id` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user_id` int(11) DEFAULT NULL,
  `log_action` enum('Initialization','Insert','Update','Delete') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=ARCHIVE DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
