-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Gen 07, 2023 alle 12:02
-- Versione del server: 5.7.39-42-log
-- Versione PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmqxcilcuals4`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `assetindexingsessions`
--

CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL,
  `indexedVolumes` text,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2023-01-07 11:59:23', '2023-01-07 11:59:23', 'edc08e5a-f22f-47f4-9e0b-17b2c45a6c2b');

-- --------------------------------------------------------

--
-- Struttura della tabella `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2023-01-07 11:59:23', '2023-01-07 11:59:23', NULL, NULL, '1cf0c06e-e5cb-40f6-9449-252d0b1b9fa7');

-- --------------------------------------------------------

--
-- Struttura della tabella `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2023-01-07 11:59:23', '2023-01-07 11:59:23', '311d5c1d-8491-45df-9296-e9cde214109e');

-- --------------------------------------------------------

--
-- Struttura della tabella `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2023-01-07 11:59:22', '2023-01-07 11:59:22', NULL, 'b3fbe883-13ae-4f36-85ca-0f7e6749a81a');

-- --------------------------------------------------------

--
-- Struttura della tabella `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `imagetransformindex`
--

CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `imagetransforms`
--

CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '4.3.6', '4.0.0.9', 0, 'gbgjgyozadmy', '3@mhzxnfiipn', '2023-01-07 11:59:22', '2023-01-07 12:01:28', '196b9a16-3a36-4b91-a474-a0e9742b82d3');

-- --------------------------------------------------------

--
-- Struttura della tabella `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `matrixblocks_owners`
--

CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 11:59:24', 'ce1b4dcf-e98b-4274-aa4b-e35bebbb6e60'),
(2, 'craft', 'm210121_145800_asset_indexing_changes', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '6d621662-8ee5-4005-88ff-7ed6b1e22684'),
(3, 'craft', 'm210624_222934_drop_deprecated_tables', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '7e038b76-a327-46de-8884-3b6c77492d56'),
(4, 'craft', 'm210724_180756_rename_source_cols', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 11:59:24', 'dfefe8ff-ad7d-4c11-a418-989f48e60478'),
(5, 'craft', 'm210809_124211_remove_superfluous_uids', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '44de411b-b071-4d00-af1b-76bca31f404b'),
(6, 'craft', 'm210817_014201_universal_users', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '343b53da-06d1-473e-af7d-2dbd6b636380'),
(7, 'craft', 'm210904_132612_store_element_source_settings_in_project_config', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 11:59:24', 'f153adb3-ccac-466f-8c3e-06131a990e9c'),
(8, 'craft', 'm211115_135500_image_transformers', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 11:59:24', 'e012c338-ae4e-4197-a50b-286dba03dda4'),
(9, 'craft', 'm211201_131000_filesystems', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 11:59:24', 'c915e6f5-c128-42b9-b325-0f558acc3fa5'),
(10, 'craft', 'm220103_043103_tab_conditions', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 11:59:24', '5c5d5bfb-c9dd-46c9-81c7-ab4b3e5e14ae'),
(11, 'craft', 'm220104_003433_asset_alt_text', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '911d99dc-0e4a-4f1f-ab7b-e3f50c20b531'),
(12, 'craft', 'm220123_213619_update_permissions', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '8098c4f1-3c34-413d-8896-1bfd8aed0629'),
(13, 'craft', 'm220126_003432_addresses', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', 'aeda17f7-0e3e-4f57-a042-0ba914423ab9'),
(14, 'craft', 'm220209_095604_add_indexes', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '4c25c22f-8fb7-435a-b8a5-315030610945'),
(15, 'craft', 'm220213_015220_matrixblocks_owners_table', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '4e6b693f-0783-43ae-89d1-134984307bb1'),
(16, 'craft', 'm220214_000000_truncate_sessions', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', 'c5938d5e-210f-43b8-95d4-302065cd4c6a'),
(17, 'craft', 'm220222_122159_full_names', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', 'f5138dab-f2d3-4e62-af80-e3cecd0a23c1'),
(18, 'craft', 'm220223_180559_nullable_address_owner', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', 'c10e946a-50fc-42a7-9ecd-3f3f2b91fb3c'),
(19, 'craft', 'm220225_165000_transform_filesystems', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '460a5753-1e3c-40f1-ae57-2224a8267fcf'),
(20, 'craft', 'm220309_152006_rename_field_layout_elements', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', 'fa9e080d-7d3a-4f10-9fc8-7b425792dfbf'),
(21, 'craft', 'm220314_211928_field_layout_element_uids', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '3aa10f67-b9f3-4ea6-ae4f-f2d07db5a838'),
(22, 'craft', 'm220316_123800_transform_fs_subpath', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '3199c76a-4633-4984-aa43-62cbf191d5c7'),
(23, 'craft', 'm220317_174250_release_all_jobs', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '91a9908c-937c-4820-aadf-2ff295b8430b'),
(24, 'craft', 'm220330_150000_add_site_gql_schema_components', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '7d19989c-1fa2-47f3-8c6d-24090f93ad7c'),
(25, 'craft', 'm220413_024536_site_enabled_string', '2023-01-07 11:59:25', '2023-01-07 11:59:25', '2023-01-07 11:59:25', 'b21c5842-073b-4b09-ae12-b4175ee4cb0d');

-- --------------------------------------------------------

--
-- Struttura della tabella `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1673092765'),
('email.fromEmail', '\"v.jalbu31@gmail.com\"'),
('email.fromName', '\"api\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('fieldGroups.b3fbe883-13ae-4f36-85ca-0f7e6749a81a.name', '\"Common\"'),
('meta.__names__.0b2a6e68-0ce4-4cff-ac92-3dba0c40bfac', '\"api\"'),
('meta.__names__.b3fbe883-13ae-4f36-85ca-0f7e6749a81a', '\"Common\"'),
('meta.__names__.bb36a926-4648-434d-98c1-a9867d499469', '\"api\"'),
('siteGroups.bb36a926-4648-434d-98c1-a9867d499469.name', '\"api\"'),
('sites.0b2a6e68-0ce4-4cff-ac92-3dba0c40bfac.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.0b2a6e68-0ce4-4cff-ac92-3dba0c40bfac.handle', '\"default\"'),
('sites.0b2a6e68-0ce4-4cff-ac92-3dba0c40bfac.hasUrls', 'true'),
('sites.0b2a6e68-0ce4-4cff-ac92-3dba0c40bfac.language', '\"en-US\"'),
('sites.0b2a6e68-0ce4-4cff-ac92-3dba0c40bfac.name', '\"api\"'),
('sites.0b2a6e68-0ce4-4cff-ac92-3dba0c40bfac.primary', 'true'),
('sites.0b2a6e68-0ce4-4cff-ac92-3dba0c40bfac.siteGroup', '\"bb36a926-4648-434d-98c1-a9867d499469\"'),
('sites.0b2a6e68-0ce4-4cff-ac92-3dba0c40bfac.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"api\"'),
('system.schemaVersion', '\"4.0.0.9\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Struttura della tabella `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('12ff027a', '@craft/web/assets/iframeresizer/dist'),
('199e0bcd', '@craft/web/assets/d3/dist'),
('1b945b5e', '@craft/web/assets/utilities/dist'),
('230cfa77', '@craft/web/assets/garnish/dist'),
('3ab2d84', '@craft/web/assets/cp/dist'),
('3f9a2322', '@craft/web/assets/axios/dist'),
('41666394', '@craft/web/assets/cp/dist'),
('49738370', '@craft/web/assets/fabric/dist'),
('4a3b7bfe', '@craft/web/assets/tailwindreset/dist'),
('4d2ec1dc', '@craft/web/assets/selectize/dist'),
('50324c6a', '@craft/web/assets/iframeresizer/dist'),
('5959154e', '@craft/web/assets/utilities/dist'),
('5b18ba05', '@craft/web/assets/updateswidget/dist'),
('5b5345dd', '@craft/web/assets/d3/dist'),
('61c1b467', '@craft/web/assets/garnish/dist'),
('65a2f86b', '@craft/web/assets/recententries/dist'),
('6c61be34', '@craft/web/assets/updater/dist'),
('7d576d32', '@craft/web/assets/axios/dist'),
('833308d5', '@craft/web/assets/updates/dist'),
('8b011163', '@craft/web/assets/fileupload/dist'),
('8bad6d64', '@craft/web/assets/jquerytouchevents/dist'),
('8bfeb206', '@craft/web/assets/jquerypayment/dist'),
('8e69b0b1', '@craft/web/assets/velocity/dist'),
('8f635ee', '@craft/web/assets/tailwindreset/dist'),
('957ac7c8', '@craft/web/assets/jqueryui/dist'),
('9a4968ea', '@craft/web/assets/vue/dist'),
('9a7d4836', '@craft/web/assets/elementresizedetector/dist'),
('9f9d57de', '@bower/jquery/dist'),
('ad01df9', '@craft/web/assets/pluginstore/dist'),
('b7a568d8', '@craft/web/assets/picturefill/dist'),
('bae25783', '@craft/web/assets/dashboard/dist'),
('bbecd60', '@craft/web/assets/fabric/dist'),
('bc1dd5d8', '@craft/web/assets/xregexp/dist'),
('c1fe46c5', '@craft/web/assets/updates/dist'),
('c3a17148', '@craft/web/assets/feed/dist'),
('c933fc16', '@craft/web/assets/jquerypayment/dist'),
('c9602374', '@craft/web/assets/jquerytouchevents/dist'),
('c9cc5f73', '@craft/web/assets/fileupload/dist'),
('cca4fea1', '@craft/web/assets/velocity/dist'),
('d7b789d8', '@craft/web/assets/jqueryui/dist'),
('d8b00626', '@craft/web/assets/elementresizedetector/dist'),
('dd5019ce', '@bower/jquery/dist'),
('f56826c8', '@craft/web/assets/picturefill/dist'),
('fcb44c0c', '@craft/web/assets/craftsupport/dist'),
('fe38fcc', '@craft/web/assets/selectize/dist'),
('fed09bc8', '@craft/web/assets/xregexp/dist');

-- --------------------------------------------------------

--
-- Struttura della tabella `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'email', 0, 1, ' v jalbu31 gmail com '),
(1, 'firstname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'slug', 0, 1, ''),
(1, 'username', 0, 1, ' admin ');

-- --------------------------------------------------------

--
-- Struttura della tabella `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Q2IPl59rGbmFVTO0UMu9RcVNmA61MV3e46tlV-q6Pe_uAra09sdmG8LtJoKQ9bg-1DW6YvJpoukXpUTuBt4e3wFRc6uYnnq3Z9oz', '2023-01-07 11:59:57', '2023-01-07 12:01:48', '45e4e12f-1089-4839-bd80-95bed4cc33d2');

-- --------------------------------------------------------

--
-- Struttura della tabella `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'api', '2023-01-07 11:59:22', '2023-01-07 11:59:22', NULL, 'bb36a926-4648-434d-98c1-a9867d499469');

-- --------------------------------------------------------

--
-- Struttura della tabella `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'true', 'api', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2023-01-07 11:59:22', '2023-01-07 11:59:22', NULL, '0b2a6e68-0ce4-4cff-ac92-3dba0c40bfac');

-- --------------------------------------------------------

--
-- Struttura della tabella `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `photoId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`) VALUES
(1, NULL, 1, 0, 0, 0, 1, 'admin', NULL, NULL, NULL, 'v.jalbu31@gmail.com', '$2y$13$uGmvEhdAvp1EkxqtZygBquRHxLGYpJ.1YTek8jooD.ozQYjUtyg.m', '2023-01-07 11:59:57', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2023-01-07 11:59:24', '2023-01-07 11:59:24', '2023-01-07 12:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2023-01-07 12:00:00', '2023-01-07 12:00:00', 'e4b63d90-7cf9-4a27-851c-faf0a65121cd'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2023-01-07 12:00:00', '2023-01-07 12:00:00', 'e58a1050-20c8-4d64-b9b1-6c2f6d3f38f9'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2023-01-07 12:00:00', '2023-01-07 12:00:00', 'bf84fa8b-8f67-42f7-8fc2-660f2040c591'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2023-01-07 12:00:00', '2023-01-07 12:00:00', 'd34c16fe-4daf-44ed-9695-ed19dba51f9f');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_swlpryhcgiyffpxozrqpiohgenuswifvsmqi` (`ownerId`);

--
-- Indici per le tabelle `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zxfxxtwaysrydotygufkndgkjtymaqpbxpop` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `idx_bdhowuyvnonbhwwwvwoozjwejewjzvkjznrh` (`dateRead`),
  ADD KEY `fk_jyumraichambewygyzqmnwibuhckoqrueitv` (`pluginId`);

--
-- Indici per le tabelle `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tvgbdyokdfeehuujruaipwoodlbkpwyrmith` (`sessionId`,`volumeId`),
  ADD KEY `idx_ioqinpjoxscgtysqxvpuehonjpxagickqwrj` (`volumeId`);

--
-- Indici per le tabelle `assetindexingsessions`
--
ALTER TABLE `assetindexingsessions`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nqaneqsedomnpbhksduikaqpsmlwzzzyqmrl` (`filename`,`folderId`),
  ADD KEY `idx_yyamihukedoiuzqofewnbvyxomebyyzfxdgp` (`folderId`),
  ADD KEY `idx_srqorqczavtytfybupnihoniyjvbigqupbvh` (`volumeId`),
  ADD KEY `fk_nwhcgaskgwwqizdzxfloqvhquvjfwuvlujgl` (`uploaderId`);

--
-- Indici per le tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_koanhngkckyqfzfowjpsjpamxpxymykrqaoa` (`groupId`),
  ADD KEY `fk_ulehdekawwaozjbnorxbitvzxiggmjvjmhyy` (`parentId`);

--
-- Indici per le tabelle `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ymghyrfqudgztlobrfjizvcyhnbqfjqynoxa` (`name`),
  ADD KEY `idx_xbdzkpguqtjudeqrcoxqdqyhohvpeylpogvl` (`handle`),
  ADD KEY `idx_cxgyvurqukmpwvxxbxgltawvxnulbsxyhxig` (`structureId`),
  ADD KEY `idx_kljwhlbfzklwweigkkbxdhfumuopaamlurcr` (`fieldLayoutId`),
  ADD KEY `idx_igrmjuhizchbulwfrmpbwhwqfhemktlecmzv` (`dateDeleted`);

--
-- Indici per le tabelle `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_svuarggdbfcgxhteeybshysqomiyqckqtzhy` (`groupId`,`siteId`),
  ADD KEY `idx_xxagglrauasuveozctsarwqwibcphtflccpl` (`siteId`);

--
-- Indici per le tabelle `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_wwfvlpvpjjraneubgcsbiynrpmrteeouoscs` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_qwiugsbitduawokxnatiatryvvniabsjkfrp` (`siteId`),
  ADD KEY `fk_iqivadyvvnxtaxmxyhwaxdotayxntxhbwvgi` (`userId`);

--
-- Indici per le tabelle `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `idx_wsghdbadxxuwjbedmjkhiazdgjaoqzkaiahy` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_eqanfgrksesxqmunmbfjexmwevyahecjahxi` (`siteId`),
  ADD KEY `fk_gskujuucipeethzsnrihkdnfhbqjclkjlqmk` (`fieldId`),
  ADD KEY `fk_ipozfpjuhrqnxfpythjaijrxazsdsjhdwiuo` (`userId`);

--
-- Indici per le tabelle `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jpifiofnpkdophhbfkdmucfmockjeryxkwgu` (`elementId`,`siteId`),
  ADD KEY `idx_crhjyykwbijgggtpwefuhobiiagwljvmwpon` (`siteId`),
  ADD KEY `idx_psczjhqqpaytttkromegoxcocuucxxkshphu` (`title`);

--
-- Indici per le tabelle `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vnuafyiagmvmjzfqppvjqnajbfgtzdyyhitr` (`userId`);

--
-- Indici per le tabelle `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_pjtsgikdereafbqkxoojpuwlbdwrubqjgiez` (`key`,`fingerprint`);

--
-- Indici per le tabelle `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uvmidlceuzmqzzsqnggzrfrufklvvwnrygpz` (`creatorId`,`provisional`),
  ADD KEY `idx_tzdeblniqvlsiqcgmtpiudvtadmkruzbgiza` (`saved`),
  ADD KEY `fk_yciphicyvzayjcddzrdjqanqgwgwvyzrhtbz` (`canonicalId`);

--
-- Indici per le tabelle `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cqfjqmhkknfjarmqjkxqbjbdcpuiypzzsyek` (`dateDeleted`),
  ADD KEY `idx_pkvurnkyqolgcnmaqsickltftxmntgeuwjij` (`fieldLayoutId`),
  ADD KEY `idx_uscyaitsrmcodwnndieilamnuobodmlyhzji` (`type`),
  ADD KEY `idx_binjvfpbmbxhgsoptcniupmkxwxhqtiussni` (`enabled`),
  ADD KEY `idx_hpbubrabgajbwgmpamynkubvyigtmorlzkeu` (`archived`,`dateCreated`),
  ADD KEY `idx_qkqeavynhdkolwqlxtjvygkhogcnnmyrnirf` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `idx_bybykylmwobmpfdbqqhjnskaiwlkyyvecurm` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  ADD KEY `fk_bbyzbzlqlxijphefirhururipvcjernmmfay` (`canonicalId`),
  ADD KEY `fk_dmfoclokgbvqpztxzmceiaoftoxnvblumthj` (`draftId`),
  ADD KEY `fk_cjjszspcibaesnljgczorvighitzlmsptykx` (`revisionId`);

--
-- Indici per le tabelle `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_kfnlzuoswrpelcqkkqmcowwavbxazpjerxeq` (`elementId`,`siteId`),
  ADD KEY `idx_fcxvdagwroujaajjfnvwuglfreftnzuuwqyt` (`siteId`),
  ADD KEY `idx_lidxfuzwfqzivgjkutcngukhoywvuyhlztlm` (`slug`,`siteId`),
  ADD KEY `idx_jvxjgmnfqskmlwhpneasmclkfnpznxfpozuw` (`enabled`),
  ADD KEY `idx_pzvftoaajoilqszhviysbjhuhgbhresygpbl` (`uri`,`siteId`);

--
-- Indici per le tabelle `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pshliqpqwtqwctfkjwsajqfuhyoqswqkwltm` (`postDate`),
  ADD KEY `idx_rfoffjfqxgiuzguijwttglljvokffsbidppa` (`expiryDate`),
  ADD KEY `idx_yjletvdjkxnhuvoqsitnkjsbefmbiywvtdwd` (`authorId`),
  ADD KEY `idx_kcbumdmgqbzdjvaqjsnsvhpwpnuzzfmxpduh` (`sectionId`),
  ADD KEY `idx_jtkdntenuhgjmkyzfphleunmsbcdymqrnaxl` (`typeId`),
  ADD KEY `fk_bqhrijjujhuwgeohkyltrfmuyyhwhotvmiof` (`parentId`);

--
-- Indici per le tabelle `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_moalurcarqdkksbowgdkurfunibyfhejwasg` (`name`,`sectionId`),
  ADD KEY `idx_uugbjvmizklsmtwgzjmhryidapvkvhnkgwtp` (`handle`,`sectionId`),
  ADD KEY `idx_pqdmvivkefmbcayjnalcvjyxvwdkpxjexnpl` (`sectionId`),
  ADD KEY `idx_ojgjrlfsgrzdzgxxgnneudxdwfoyaynjemnw` (`fieldLayoutId`),
  ADD KEY `idx_pyengwfadijisuqvyjyttaqkqfnolaachvui` (`dateDeleted`);

--
-- Indici per le tabelle `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ioggqmpujpsuiysslgbkgdogozagnniaisvk` (`name`),
  ADD KEY `idx_cnldbvgtvbtukhmlkhfxhuexfbmedooxueft` (`dateDeleted`,`name`);

--
-- Indici per le tabelle `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_qbiojsmgevaypxlooygtorgzhqanbvarmhpf` (`layoutId`,`fieldId`),
  ADD KEY `idx_jeivpjuxnekwkyavbicpxlpbintizkgbmyvy` (`sortOrder`),
  ADD KEY `idx_eqvzyecbnvxcxxdesojxvzqqkiapvtqxvjdc` (`tabId`),
  ADD KEY `idx_yqxaxebzndcwhowcgncontfpyroyftfpptba` (`fieldId`);

--
-- Indici per le tabelle `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bguvqgesjulewzbnbyadsienekbppytlldmv` (`dateDeleted`),
  ADD KEY `idx_prrrjwdkrlortejghkcrldwfldesfupxzbqh` (`type`);

--
-- Indici per le tabelle `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sltwmdmxiznhgjwlbetmzhltqysgauoyjfpe` (`sortOrder`),
  ADD KEY `idx_fejastppiwzgmecuekanmbdnxpjoosgnpmpq` (`layoutId`);

--
-- Indici per le tabelle `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qypagwyukgsvcwcplradwzgpjsnywqebzvod` (`handle`,`context`),
  ADD KEY `idx_ifoznvymfmqairlqyczknzorijkylfbysoni` (`groupId`),
  ADD KEY `idx_hpuzdmqabsrjyekmymfprukbovyhhraflkss` (`context`);

--
-- Indici per le tabelle `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xhqoupqbvkjloydkhwmwygbtdplwedapfomg` (`name`),
  ADD KEY `idx_awmvqwnsgtlyiepicofcnpaccfybtyxlmmbx` (`handle`),
  ADD KEY `idx_xdkcbydnzaaykpxiszsuuvnwvbyrrtmcbbdz` (`fieldLayoutId`),
  ADD KEY `idx_ivufxsdncgeweyzhfllmkyyegquongiwkuqd` (`sortOrder`);

--
-- Indici per le tabelle `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_vahwefxglqiwapvszseprlitttensizpmfpi` (`accessToken`),
  ADD UNIQUE KEY `idx_bqhfvtadqpszkqsugmsrhopvlrbbhixglqfr` (`name`),
  ADD KEY `fk_dfmutiqlcefswnkpfgnkuoziyfdozdjhgqiw` (`schemaId`);

--
-- Indici per le tabelle `imagetransformindex`
--
ALTER TABLE `imagetransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_crhbhmodjvgdeevqyyotefvyawghulorafva` (`assetId`,`transformString`);

--
-- Indici per le tabelle `imagetransforms`
--
ALTER TABLE `imagetransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ygiknqbfiojcsobpaqmcaoomxdfaufixilos` (`name`),
  ADD KEY `idx_dvimrsdmmacqkgdycwfbplpmqnzykxfhsemq` (`handle`);

--
-- Indici per le tabelle `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ucbqnirphkvkqrxlthiupkrjlsarbwsrplfu` (`primaryOwnerId`),
  ADD KEY `idx_douoknygitqecdujnprrbktnfwvtfeknbgxn` (`fieldId`),
  ADD KEY `idx_bvhyfacevayefknofullnlalfdoqyfkvxgrt` (`typeId`);

--
-- Indici per le tabelle `matrixblocks_owners`
--
ALTER TABLE `matrixblocks_owners`
  ADD PRIMARY KEY (`blockId`,`ownerId`),
  ADD KEY `fk_fjbezsgbwxxwwsbjrcbnwiiystjwmmoapqjm` (`ownerId`);

--
-- Indici per le tabelle `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_iqfwgwotceccvrpsuicxsrvrcphbfexeqxku` (`name`,`fieldId`),
  ADD KEY `idx_ffrppqbktuefvuxhjruhwusheqdcrjdvjtbu` (`handle`,`fieldId`),
  ADD KEY `idx_ybvxrakjwbhlshaxuenheyakvsgzrrpwvvmt` (`fieldId`),
  ADD KEY `idx_rojmgmohrqbbzbknwtsqnjqumbpqoumbduws` (`fieldLayoutId`);

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_fvhccovpwhplpfssexiqizknfuywkdaxqtks` (`track`,`name`);

--
-- Indici per le tabelle `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_zepktrqocilyefzjcziuormzombfbfodljyv` (`handle`);

--
-- Indici per le tabelle `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indici per le tabelle `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hmglduqbszemokaypphabunxlbwvqrjfxfak` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_wsmvjshedsntqjmfjuwlalukpgqsjxjuffwp` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indici per le tabelle `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hderljieiwnfzmagklcxaspfshkqhbdzwtag` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_jxfpmgvlagghizllusxwdwgsgkcgaxquhxvc` (`sourceId`),
  ADD KEY `idx_bdehzedrsbafjisyxsuxthypomeujkzdakdm` (`targetId`),
  ADD KEY `idx_tnofcvigpjvzhdufnpyieqpzqpqddhtygvxp` (`sourceSiteId`);

--
-- Indici per le tabelle `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indici per le tabelle `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_scgvjhqhrnhbjguqzrjostlbhhvgqseqmdvb` (`canonicalId`,`num`),
  ADD KEY `fk_zrslrwvqevlxzqgqavmgysmhwnzrvcziyiun` (`creatorId`);

--
-- Indici per le tabelle `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_doartsbupmcccjbdncurafhqehurtwvrzdwz` (`keywords`);

--
-- Indici per le tabelle `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uklaucckymfbtaojcuvltwydsneinsnpwwna` (`handle`),
  ADD KEY `idx_uhzbrupwhfeomnbpfhshienqlkvaurqkheco` (`name`),
  ADD KEY `idx_ftzpnlbonjwuteckvjzhrxqcnxyxzmzuylhw` (`structureId`),
  ADD KEY `idx_mhuapvyjwqzjeyctarjninwhbbrarmoefhch` (`dateDeleted`);

--
-- Indici per le tabelle `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_miqnzhgihkzdmkxguitmfhukuemocuzekuwh` (`sectionId`,`siteId`),
  ADD KEY `idx_hkbcshoalgjpzogubozabeilgguqsbvzozce` (`siteId`);

--
-- Indici per le tabelle `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indici per le tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ndawfjwrgjkooyfvraidimztyobhksiimfme` (`uid`),
  ADD KEY `idx_wdvuojtyrhmjfqtwvjheaivewnncnclvxmxa` (`token`),
  ADD KEY `idx_dvluasovnxgixgkjucrtibkpbdfjgactlnjv` (`dateUpdated`),
  ADD KEY `idx_skmrmsxcihfpnqqcwuerjwzfduumwuqgszyo` (`userId`);

--
-- Indici per le tabelle `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_bvncpldyfftfavheqepbsdxwdzhecigflsvo` (`userId`,`message`);

--
-- Indici per le tabelle `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mtgcbctsscmuxdtecqrjmasesiyiymunyhdc` (`name`);

--
-- Indici per le tabelle `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sbpebdbprelgjuivznahipsyqeswvsjvtzbp` (`dateDeleted`),
  ADD KEY `idx_ehhcheikndrrpopswjipozhpxahtffnitkil` (`handle`),
  ADD KEY `idx_tbpfrlfiqvvnrnubdzpxlzgcfqqlehpigsgz` (`sortOrder`),
  ADD KEY `fk_ajwzenldywtiaenortqafebpyzaplahxidnl` (`groupId`);

--
-- Indici per le tabelle `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hhsombfygezsvsyvssifgbdusannfxaavfus` (`structureId`,`elementId`),
  ADD KEY `idx_bgvqlgoidyfddxomjfxecpxqerhczekjxeee` (`root`),
  ADD KEY `idx_tlzqswbfbvskfkawvjunfkdvdtxdiwtyfkld` (`lft`),
  ADD KEY `idx_sbirirleoctkgedaohpczweetatqwurbqsin` (`rgt`),
  ADD KEY `idx_naryhkbbmwfczqjlgfgoanrtkfjfdwpuftrj` (`level`),
  ADD KEY `idx_dyuevbmqpropeyfjqsbongxwuhuotynriwfz` (`elementId`);

--
-- Indici per le tabelle `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wewfrpolhztlplruvrgoywygswwuxzgdquhk` (`dateDeleted`);

--
-- Indici per le tabelle `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ehcrnccnichhgzgiceliwpynonfwzdpjrali` (`key`,`language`),
  ADD KEY `idx_kxsgergnxecvcgaiawqasqfclgmfbaeetnus` (`language`);

--
-- Indici per le tabelle `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rbcqwafkejdstlbmhnefulctsqjoqkykfteu` (`name`),
  ADD KEY `idx_cvwpuzshsnfepnkrgbxjxhwbocufroprrhao` (`handle`),
  ADD KEY `idx_gzdafdunvtzgnlufkhwqfwhxohspgcyxztsl` (`dateDeleted`),
  ADD KEY `fk_wvsfuwiopojdxyubuabdvkngiocsootrlcco` (`fieldLayoutId`);

--
-- Indici per le tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wldjvjzdlwgqgqtmovfjloqbygretqdvdfak` (`groupId`);

--
-- Indici per le tabelle `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_oteuyqrvgudplympahgvmilsubepfwsapuup` (`token`),
  ADD KEY `idx_cgtrfhgyxbxhlkftplozqpstzixlthevkist` (`expiryDate`);

--
-- Indici per le tabelle `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bpwksmbniswnzrdefmybbluueleqbcbtncay` (`handle`),
  ADD KEY `idx_palvnamojkrvciihvsfzpclrcoksqqdecitp` (`name`);

--
-- Indici per le tabelle `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_uqrxggidwafkexdfhnirxvzgnoucdtxokraq` (`groupId`,`userId`),
  ADD KEY `idx_vgqscidpjuclupxnrniozigphmctdgvatxqh` (`userId`);

--
-- Indici per le tabelle `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_aapbokttvnydccgbhbcubpralnvxiavdatrt` (`name`);

--
-- Indici per le tabelle `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dwbujldivrgtwllsdegwbqybslvytafxwmsc` (`permissionId`,`groupId`),
  ADD KEY `idx_djakyhkxtlpvgfnvyhvsyzuxynlvwmeaglqv` (`groupId`);

--
-- Indici per le tabelle `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_guaenrdmldibdjjhiyrbsrkoviweyrrccpss` (`permissionId`,`userId`),
  ADD KEY `idx_wjozunybegzrffkvyincntmbrxuhexlbabnc` (`userId`);

--
-- Indici per le tabelle `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ioqcfeezrzremwnvblydisclfayxdfviquds` (`active`),
  ADD KEY `idx_pgcbkxwqzjhauocftxnkwkebrgcawkemvuqm` (`locked`),
  ADD KEY `idx_seinegboblxvqdsdsqktrtfoggkisgghlkeh` (`pending`),
  ADD KEY `idx_kufonheeuzieqlvpfwkthabtsspldymiumxc` (`suspended`),
  ADD KEY `idx_pkxmytjkvhmnrzezlytjnlrcjktfgkjvxitq` (`verificationCode`),
  ADD KEY `idx_zapyeusopdsqkmmjlsfcvzivbwekprfwwxrd` (`email`),
  ADD KEY `idx_iwppszxlivnooofeydvqmaxgevatgpuibuph` (`username`),
  ADD KEY `fk_zizooegskghahqaxqmkfrvcxlrqpinqxxedk` (`photoId`);

--
-- Indici per le tabelle `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jjxcuumnyrczjxikzqeeyzhfqonemybrmgjj` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_fsfhdkezdzyxuciujcrzkqqzbdmswtovplhq` (`parentId`),
  ADD KEY `idx_hyqzbieqctntqzszkqfjqgsqwplwssugkcxl` (`volumeId`);

--
-- Indici per le tabelle `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wnezsuxmjcprparjjeysrwwvswzwetwqutww` (`name`),
  ADD KEY `idx_rlyipqayzcthemquvaxbfsruzsawwrhlsnat` (`handle`),
  ADD KEY `idx_nczolmxayyneufmxaadkvuywxklesayalmgp` (`fieldLayoutId`),
  ADD KEY `idx_eaaupratoorgdgreahgdoacwhhjpcnxbwkpj` (`dateDeleted`);

--
-- Indici per le tabelle `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_osxmxopfqyswtmabwerrxtksydeasxpjenog` (`userId`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `assetindexingsessions`
--
ALTER TABLE `assetindexingsessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `imagetransformindex`
--
ALTER TABLE `imagetransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `imagetransforms`
--
ALTER TABLE `imagetransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT per la tabella `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_luznsvppxlttcubpjtpaukijxwkcwkqyjgvw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_swlpryhcgiyffpxozrqpiohgenuswifvsmqi` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_jyumraichambewygyzqmnwibuhckoqrueitv` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uzwbseisayyzqughgpnqggjriugorrspycnp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_ueutlmhdgclurgqqsqkaphfhdyrbnkbwihkz` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_urldrrktoiaeupjxznhfrxqhjhixlsydonig` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_nwhcgaskgwwqizdzxfloqvhquvjfwuvlujgl` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_pxsziwmhavzwgtildtcfreftipxkjimrcjsv` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qgdyetzeeusagrruwnochiwtcjuuppqdbggg` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tipthoosbtvcjgwbrvyrvgqzfizligyfatlh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_jwpbfaubgfpkumoajwppvgadksfuffbtpqqu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ulehdekawwaozjbnorxbitvzxiggmjvjmhyy` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_vthrvxjqthzxozumrscfloakxctpfbbbjyhq` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_dbcdfiybhaexaxvhwtcuvstourdbcpkiyzub` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ohgciqxnkajdhljfmsbxjclfrjsjownvwcau` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_ghrtrdqippltlazyjuaiilmczcclztuzdmmn` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lenxzbssecxsvwwbstzrmywxdpviztrvwgmh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_iqivadyvvnxtaxmxyhwaxdotayxntxhbwvgi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lickgvhpvtdbulehvcvrddatdwrzpmorjurz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_qwiugsbitduawokxnatiatryvvniabsjkfrp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_eqanfgrksesxqmunmbfjexmwevyahecjahxi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_gskujuucipeethzsnrihkdnfhbqjclkjlqmk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ipozfpjuhrqnxfpythjaijrxazsdsjhdwiuo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ovxxfqehywushijauamnjrymgtvlpvnuzxtv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_cqrjikplfcglhenqfjqohjwnjijaopqcafsa` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rjfnnuibkxumftbhqbwnawkvfrqsiwqlfvvd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_vnuafyiagmvmjzfqppvjqnajbfgtzdyyhitr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_degtzancqjhrbgjybxzpzwgmtlomzeiacxni` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_yciphicyvzayjcddzrdjqanqgwgwvyzrhtbz` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_bbyzbzlqlxijphefirhururipvcjernmmfay` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_cjjszspcibaesnljgczorvighitzlmsptykx` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_dmfoclokgbvqpztxzmceiaoftoxnvblumthj` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nqrokbtnbijsgoxtwricqxsjrqkwelpqbxjb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_uehtqfpqjyfrqenwbywuiirrydyilkonqlnu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_unyivgyybzgqzgwelvicjixolsedffbocjzl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_asxmeandjknbfajitwwsxbjihsuqefjencpg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_bqhrijjujhuwgeohkyltrfmuyyhwhotvmiof` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_brsweyxahzsriptllmnmxxfdctbopovsftha` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_dpbxupvzuqzixrebgkcpwcvkidcxsczciicd` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_pncnhqsnutsxqbkfncourstsrxjtuusvdmff` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_kwdmaczanzbyrfyukswhmodintfnzbujihmm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_vcqjjjzgxhggsdvirkfntpyndxcpeggtntae` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fk_gvspzdqnrqaygquyuivgstidfxokccdxhfkb` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_iixvimikkpyssijevwnyzcwnvnxbpkqyfixp` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wrhtojyihkgkdrkfvhsygucyevkgdpnsdkvj` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fk_pylqmkvpidrboobsmdcigtiyqrfadykhyasw` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fk_treyvtkbjzezkbmyvrfflrekrouclonxurwf` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_mqxweabwlvtodyjtfekvnaiksyykbhgyetyv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vvejzyagopvqzhgzrpxoqzgjwjfayzlkmulj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_dfmutiqlcefswnkpfgnkuoziyfdozdjhgqiw` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `fk_mbmpimvjnjpjjogrgupwzebuimgxmgunxfgu` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_odwuwghnxszkpeyndkaeqkzykwxpcyhjykev` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ozmwqfibbwcqycscxlgpmfrextutfriatntu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tendewrhjfyaiwfwsksxmcmjgixuzcqhndgs` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `matrixblocks_owners`
--
ALTER TABLE `matrixblocks_owners`
  ADD CONSTRAINT `fk_fjbezsgbwxxwwsbjrcbnwiiystjwmmoapqjm` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_szyvdllnczrfjgzwjysxuvagrifvrponfcfq` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `fk_mnfxfkbbjqojsudxftlmqmmykltuqyvpakhn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zrchmicfeeynfsylwbeucuhwaelhvipcdbop` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_aszqzgfsjcdmnpzkbcmyaoakuendclhyrlwm` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cuhmzsedpdwdjxgaorqosarbxssuaklgslvy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_plnlqnrlvujtlnmkzsvnrpznmultamqnixma` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uzcdjaeqtjhxoqjybrcjfrzswrssjlciushe` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_qxpvhofteelxcqwriqnqbscemtoycqkkaohu` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zrslrwvqevlxzqgqavmgysmhwnzrvcziyiun` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_fmbzoywjwfylckxggkvjjxxdihfbdruukyti` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_hwgqtnrwaqwsemjnojqdvbcncklywtfqstzt` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nhjctfvdcalszbztrluoguubporcnpulabum` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_ykuvehqcirteofoedyepxrzsnzlvmnoidynt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_ynucclrkrynljifaszmdoqgfdhldmijizkoq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_ajwzenldywtiaenortqafebpyzaplahxidnl` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_skbhqllsoeicgxyijrempqqxsfshvoofspwo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uuudamctcaulkihnnftgosnwnzudulmfelne` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_wvsfuwiopojdxyubuabdvkngiocsootrlcco` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_gtugepgmdmzbtivfluuluupjmogyoqggorox` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uvotzkecflzqmpehjkdsbiellgxpmqecvsnd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_qjwljfwttjycikbtdgpjllrkfveltmfhzevs` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zpdhwqtzgzahajaxdhefkcgbahvnhibazzxw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_maqqudygznuskczxwujeozgwfymsogdkbxci` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rtnmdcogfhblwomhxpzkwojpulrwdcpwzdop` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_eaurbwtfivkbjxvsuduoewtngeqpieqbavsi` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jquphwudoozbjkxxatlxvxgirskiszjwftdz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_prqtbftraqpdizfbpomdfibmqwdmntzbijyn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_tjdmpwbchyzgirzgcwgoqhxzoljneflbcmgb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zizooegskghahqaxqmkfrvcxlrqpinqxxedk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_jczqzscjmjipnweeeswnmehikcfshdlonnuv` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_moduudekpoifpromxrpjpmmjmvxssllvratl` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_zekusncrlargstqftuycoddknbnknhxonkqh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Limiti per la tabella `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_ekgrdouwgtzstniqnxjnqjnaettjjiemkgzl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
