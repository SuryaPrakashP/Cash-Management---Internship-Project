-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2024 at 03:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petty_cash`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add expense', 7, 'add_expense'),
(26, 'Can change expense', 7, 'change_expense'),
(27, 'Can delete expense', 7, 'delete_expense'),
(28, 'Can view expense', 7, 'view_expense'),
(29, 'Can add admin expense', 8, 'add_adminexpense'),
(30, 'Can change admin expense', 8, 'change_adminexpense'),
(31, 'Can delete admin expense', 8, 'delete_adminexpense'),
(32, 'Can view admin expense', 8, 'view_adminexpense');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$VgiF7oQr0flpRonT4qcbuP$j9Gxb2gQvuJHcAZpyXWrzzA0tGfpJigrXHG+P0XIO6s=', '2024-03-06 12:13:55.908922', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-02-20 12:22:11.259885'),
(2, 'pbkdf2_sha256$720000$O7VHRTBdJQIe8YEibbjeAg$XG4aAYcnjgo3xHiiNzD9UDEQH9Q6IV8JeQoVv3mSUu0=', '2024-03-06 11:25:13.011377', 0, 'Chennai', '', '', '', 0, 1, '2024-02-23 11:22:40.218604'),
(3, 'pbkdf2_sha256$720000$Hng5exYcrRjgczL043vvrs$tDSzsC+2j9A1FSDx9PnugkEQGPd22lskGcs4AnQ2Z+E=', '2024-03-08 00:54:35.633931', 0, 'Finance', '', '', '', 1, 1, '2024-02-24 00:09:35.000000'),
(4, 'pbkdf2_sha256$720000$gkR1LrEZM5qPy1iqPjPOU2$VFeEeL3G2oSb57SJ0bWZ042lqr57oS8XkY38mop8I+k=', '2024-03-04 23:06:40.089112', 0, 'Kanchipuram', '', '', 'Jp@gmail.com', 0, 1, '2024-02-26 22:50:23.685902'),
(5, 'pbkdf2_sha256$720000$VmlsCzdzE6vmjeKHrSdQQk$1nhmqWYbmPxsQORRBc8GRSyPOh72xqJxJHTbx7rNL3s=', '2024-03-08 00:31:30.561734', 0, 'Madurai', '', '', 'madurai@gmail.com', 0, 1, '2024-02-29 00:05:32.761813'),
(6, 'pbkdf2_sha256$720000$ecP8qVEZ6k95xqIKV6RUpG$AiF/+kpdXNFmK+qVgxT//VRTe8X8Yg3EyLxQTkb2+hA=', '2024-03-08 00:55:09.992331', 0, 'Velloor', '', '', 'velloor@gmail.com', 0, 1, '2024-03-05 14:34:24.578778');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-02-23 11:22:40.687607', '2', 'Chennai', 1, '[{\"added\": {}}]', 4, 1),
(2, '2024-02-24 00:09:37.133306', '3', 'Finance', 1, '[{\"added\": {}}]', 4, 1),
(3, '2024-02-24 00:09:48.389626', '3', 'Finance', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1),
(4, '2024-02-29 01:42:58.651462', '15', 'Expense object (15)', 3, '', 7, 1),
(5, '2024-02-29 01:43:02.667679', '14', 'Expense object (14)', 3, '', 7, 1),
(6, '2024-02-29 01:43:05.987527', '13', 'Expense object (13)', 3, '', 7, 1),
(7, '2024-02-29 01:43:09.794955', '12', 'Expense object (12)', 3, '', 7, 1),
(8, '2024-02-29 01:43:13.644331', '11', 'Expense object (11)', 3, '', 7, 1),
(9, '2024-02-29 01:43:17.947852', '10', 'Expense object (10)', 3, '', 7, 1),
(10, '2024-02-29 01:43:21.454627', '9', 'Expense object (9)', 3, '', 7, 1),
(11, '2024-02-29 02:50:38.910049', '21', 'Expense object (21)', 3, '', 7, 1),
(12, '2024-02-29 02:51:12.654738', '20', 'Expense object (20)', 3, '', 7, 1),
(13, '2024-02-29 02:51:12.657868', '19', 'Expense object (19)', 3, '', 7, 1),
(14, '2024-02-29 02:51:12.660388', '18', 'Expense object (18)', 3, '', 7, 1),
(15, '2024-02-29 02:51:12.662389', '17', 'Expense object (17)', 3, '', 7, 1),
(16, '2024-02-29 02:51:12.665463', '16', 'Expense object (16)', 3, '', 7, 1),
(17, '2024-02-29 09:31:33.405193', '23', 'Expense object (23)', 3, '', 7, 1),
(18, '2024-02-29 09:31:51.588002', '2', 'Expense object (2)', 3, '', 7, 1),
(19, '2024-02-29 09:31:57.100778', '3', 'Expense object (3)', 3, '', 7, 1),
(20, '2024-02-29 09:32:04.836536', '5', 'Expense object (5)', 3, '', 7, 1),
(21, '2024-02-29 09:32:09.280013', '6', 'Expense object (6)', 3, '', 7, 1),
(22, '2024-02-29 09:32:13.354776', '7', 'Expense object (7)', 3, '', 7, 1),
(23, '2024-02-29 23:27:51.540061', '28', 'Expense object (28)', 3, '', 7, 1),
(24, '2024-02-29 23:27:51.544122', '27', 'Expense object (27)', 3, '', 7, 1),
(25, '2024-02-29 23:27:51.546077', '26', 'Expense object (26)', 3, '', 7, 1),
(26, '2024-02-29 23:27:51.548071', '25', 'Expense object (25)', 3, '', 7, 1),
(27, '2024-02-29 23:27:51.550626', '24', 'Expense object (24)', 3, '', 7, 1),
(28, '2024-02-29 23:27:51.552625', '22', 'Expense object (22)', 3, '', 7, 1),
(29, '2024-02-29 23:27:51.554632', '8', 'Expense object (8)', 3, '', 7, 1),
(30, '2024-02-29 23:27:51.557627', '4', 'Expense object (4)', 3, '', 7, 1),
(31, '2024-02-29 23:27:51.559626', '1', 'Expense object (1)', 3, '', 7, 1),
(32, '2024-02-29 23:27:58.910204', '9', 'Finance - 2024-02-29', 3, '', 8, 1),
(33, '2024-02-29 23:27:58.912204', '8', 'Finance - 2024-02-29', 3, '', 8, 1),
(34, '2024-02-29 23:27:58.914204', '7', 'Finance - 2024-02-29', 3, '', 8, 1),
(35, '2024-02-29 23:27:58.915204', '6', 'Finance - 2024-01-01', 3, '', 8, 1),
(36, '2024-02-29 23:27:58.917787', '5', 'Finance - 2024-02-28', 3, '', 8, 1),
(37, '2024-02-29 23:27:58.919238', '4', 'Finance - 2024-02-27', 3, '', 8, 1),
(38, '2024-02-29 23:27:58.920255', '3', 'Finance - 2024-02-28', 3, '', 8, 1),
(39, '2024-02-29 23:27:58.922543', '2', 'Finance - 2024-02-27', 3, '', 8, 1),
(40, '2024-02-29 23:27:58.923552', '1', 'Finance - 2024-02-25', 3, '', 8, 1),
(41, '2024-03-06 12:13:28.111715', '39', 'Madurai - 2000.00 - Jayaprakash', 3, '', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'Petty_Cash', 'adminexpense'),
(7, 'Petty_Cash', 'expense'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-20 12:21:18.586109'),
(2, 'auth', '0001_initial', '2024-02-20 12:21:19.187162'),
(3, 'contenttypes', '0002_remove_content_type_name', '2024-02-20 12:21:19.285815'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-02-20 12:21:19.352782'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-02-20 12:21:19.393713'),
(6, 'auth', '0004_alter_user_username_opts', '2024-02-20 12:21:19.406530'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-02-20 12:21:19.460360'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-02-20 12:21:19.460360'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-02-20 12:21:19.476549'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-02-20 12:21:19.509089'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-02-20 12:21:19.534304'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-02-20 12:21:19.567337'),
(13, 'auth', '0011_update_proxy_permissions', '2024-02-20 12:21:19.576898'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-02-20 12:21:19.607850'),
(15, 'Petty_Cash', '0001_initial', '2024-02-20 12:21:20.091038'),
(16, 'Petty_Cash', '0002_delete_customuser', '2024-02-20 12:21:20.157213'),
(17, 'Petty_Cash', '0003_remove_adminexpense_user_remove_expense_created_at_and_more', '2024-02-20 12:21:21.246603'),
(18, 'Petty_Cash', '0004_adminexpense_user_expense_created_at_expense_user_and_more', '2024-02-20 12:21:21.595589'),
(19, 'Petty_Cash', '0005_alter_expense_created_at', '2024-02-20 12:21:21.611007'),
(20, 'Petty_Cash', '0006_alter_expense_bill_alter_expense_created_at', '2024-02-20 12:21:21.643672'),
(21, 'Petty_Cash', '0007_expense_status_expense_ticket_amount', '2024-02-20 12:21:21.725786'),
(22, 'admin', '0001_initial', '2024-02-20 12:21:21.872262'),
(23, 'admin', '0002_logentry_remove_auto_add', '2024-02-20 12:21:21.888465'),
(24, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-20 12:21:21.910708'),
(25, 'sessions', '0001_initial', '2024-02-20 12:21:21.970974'),
(26, 'Petty_Cash', '0002_expense_remaining_amount', '2024-03-04 23:01:53.558095'),
(27, 'Petty_Cash', '0003_adminexpense_remaining_amount', '2024-03-05 04:31:53.724652'),
(28, 'Petty_Cash', '0004_expense_allocation_id', '2024-03-06 11:19:16.402272');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7i9c8a4pp4w5p9854c3jziv7pu51lrlt', '.eJxVjLsOgjAYRt-lsyGlKaV1U9Q4QIwu6kT-3ixe2oRCjDG-u5CwsH7nnO-LahVb24WH8WiJyvPKF9uPP15Ke6jWm2JHVOHcay_wO8brCS1QDX3n6j6atm70kLD5JkENVyPQd_C3kKjgu7aRyagkE41JFbR5rid3duAguqE2nDIqlMYZo9RmoLlNjeWYCIxNSqTVYBSXLCMpYEaZyXOwgnLgQHKQgH5_9txH6g:1riOVx:vlxyVGAvHWdhUqGhtc4-J4t9nWgyjEGx1Ur5gjoK6Ck', '2024-03-22 00:55:09.994394'),
('9jaovn42e365uiev4amwc7xav7adocym', '.eJxVjbsOgjAYRt-lsyH0BsURTZxk0WCcSC9_uYht0sJkfHdp4qDrd07O90KdXJehWyOEbjRojyja_W5K6ge4BMwkXe8z7d0SRpUlJfvSmJ29gbn-un-BQcYhZQuDGQEgHCjnlhBRVdIUgmpeEcaowFiVxoDGCnS-iVaA1bZQjDIlS5yiOga7-O1i64m6afrD8erEzOWlnULra7Djk-F-zu-3E3p_AN3HR-A:1rebDx:o5wFccHgfLYXCXCUd7O04C9De1kMx60O1iLWTicLB1c', '2024-03-11 13:40:53.149057'),
('hvfj6ercxu87w0tervzspnizivzivd5t', '.eJxVjLsOgkAQRf9la0MYlh1dOxULXzGx0orMzjKCD0gAjdH470JCY3vPOfejUm5qaatrVqqp2tByuyp3s_3tfXpJtI7pAC5Z4P15NJgUSzVSKT3aPH00WZ0Wvkvgf3PE3VUP_IXKcxVwVbZ14YJeCQbaBLvKZ7f54P4d5NTkXT0RB5FHZJgI-ZAt4xjAhpFmQYusjbMi2ltCqzMBFDs2jkCzB2Nio74_vAxHOg:1rgETh:z8NKhQEJMUOgX2Q9RLcehaPwVPJuJ_ta1ZIVJIK71DM', '2024-03-16 01:47:53.731299'),
('qkgvwpsx2mf5llypugvvnnly8r5x1vxi', '.eJxVjF0LgjAYRv_LrmO4L3VdRhARERIRXcm2952apuAmBNF_T8Gbbp9znvMhpQujj0OLPdkShHs7ZbdT16j-hbE6dHgR-8e1St6FKPSRbEhppliXU8CxbGC-iP_NGjenFgBP01cDdUMfx8bSRaErDfQ8AHa71f0L1CbUSzYFJjkiVyiU8pznWhtIc-GU5lKKnDGbAaBjFl0yiz5H73xqpZDWZIx8fzHqSEA:1recEI:uXon7uvq71wxKhoKssakk0-he8kmUMhTcdHcAA0KOXs', '2024-03-11 14:45:18.317467'),
('rfz2een10797sb9dz7hj7pe49cebwagq', '.eJxVjbsOgjAYRt-lsyH0BsVNHVw0ISwYF9LLX4uSNrZlMr67kDjo-p2T873QIOfshjlBHEaDtoiize-mpH6AX4G5S38LhQ4-x1EVq1J8aSrOwcC0_7p_ASeTW7OVwYwAEA6Uc0uIaBppKkE1bwhjVGCsamNAYwW6XEQrwGpbKUaZkjVeozpFm8NysfS6uaNP3WbCL66bDiL6_thX5fVUttyKXY3eH97fR0Q:1reNzI:_Obf54SjliHQRgPLGk2gm9ekM94lyZULtG5wtfvHlAI', '2024-03-10 23:32:52.993170');

-- --------------------------------------------------------

--
-- Table structure for table `petty_cash_adminexpense`
--

CREATE TABLE `petty_cash_adminexpense` (
  `id` bigint(20) NOT NULL,
  `capital` decimal(10,2) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `description` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `remaining_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petty_cash_adminexpense`
--

INSERT INTO `petty_cash_adminexpense` (`id`, `capital`, `branch`, `date`, `description`, `user_id`, `remaining_amount`) VALUES
(10, 2000.00, 'Chennai', '2024-03-01', 'Monthly Amount', 3, 1200.00),
(11, 30000.00, 'Kanchipuram', '2024-03-05', 'Monthly Allocation', 3, 29800.00),
(12, 20000.00, 'Velloor', '2024-03-01', 'Monthly allocation', 3, 20000.00),
(13, 10000.00, 'Madurai', '2024-03-07', 'Monthly Allocation', 3, 9800.00);

-- --------------------------------------------------------

--
-- Table structure for table `petty_cash_expense`
--

CREATE TABLE `petty_cash_expense` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `bill` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `ticket_amount` decimal(10,2) DEFAULT NULL,
  `remaining_amount` decimal(10,2) DEFAULT NULL,
  `Allocation_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petty_cash_expense`
--

INSERT INTO `petty_cash_expense` (`id`, `amount`, `description`, `category`, `bill`, `created_at`, `user_id`, `status`, `ticket_amount`, `remaining_amount`, `Allocation_Id`) VALUES
(29, 200.00, 'Jayaprakash', 'food', 'bill_images/20240301050513source.jpg', '2024-02-29 23:35:12.586154', 2, NULL, 200.00, NULL, NULL),
(30, 200.00, 'Jayaprakash', 'food', 'bill_images/20240301174259Billing-Invoice-Template-Download.jpg', '2024-03-01 12:12:58.720123', 2, NULL, 200.00, NULL, NULL),
(31, 2000.00, 'Jayaprakash', 'food', 'bill_images/20240304204852Billing-Invoice-Template-Download.jpg', '2024-03-04 15:18:51.682676', 2, NULL, 200.00, NULL, NULL),
(32, 2000.00, 'Jayaprakash', 'transportation', 'bill_images/20240304210732Billing-Invoice-Template-Download.jpg', '2024-03-04 15:37:31.687595', 2, NULL, 200.00, NULL, NULL),
(33, 3000.00, 'Jayaprakash', 'food', 'bill_images/20240304210836Billing-Invoice-Template-Download.jpg', '2024-03-04 15:38:36.977796', 2, NULL, NULL, NULL, NULL),
(34, 200.00, 'Jayaprakash', 'food', 'bill_images/20240305043657Billing-Invoice-Template-Download.jpg', '2024-03-04 23:06:57.327127', 4, NULL, 200.00, NULL, NULL),
(35, 2000.00, 'Jayaprakash', 'food', 'bill_images/20240306052817Billing-Invoice-Template-Download.jpg', '2024-03-05 23:58:16.607145', 2, NULL, NULL, NULL, NULL),
(36, 200.00, 'Jayaprakash', 'food', 'bill_images/20240306173509Billing-Invoice-Template-Download.jpg', '2024-03-06 12:05:08.875226', 2, NULL, NULL, NULL, 10),
(37, 2000.00, 'JP', 'transportation', 'bill_images/20240306173836Billing-Invoice-Template-Download.jpg', '2024-03-06 12:08:36.030485', 6, NULL, NULL, NULL, 12),
(38, 200.00, 'Vasanth', 'utilities', 'bill_images/20240306174149Billing-Invoice-Template-Download.jpg', '2024-03-06 12:11:49.051063', 6, NULL, NULL, NULL, 12),
(40, 200.00, 'JP', 'food', 'bill_images/20240307053231Billing-Invoice-Template-Download.jpg', '2024-03-07 00:02:31.125073', 5, NULL, 200.00, NULL, 13),
(41, 30000.00, 'JP', 'insurance', 'bill_images/20240308062553Billing-Invoice-Template-Download.jpg', '2024-03-08 00:55:53.091251', 6, NULL, NULL, NULL, 12),
(42, 200.00, 'JP', 'healthcare', 'bill_images/20240308065157Billing-Invoice-Template-Download.jpg', '2024-03-08 01:21:57.030713', 6, NULL, NULL, NULL, 12),
(43, 30000.00, 'JP', 'healthcare', 'bill_images/20240308065208Billing-Invoice-Template-Download.jpg', '2024-03-08 01:22:08.511249', 6, NULL, NULL, NULL, 12),
(44, 30000.00, 'JP', 'healthcare', 'bill_images/20240308065622Billing-Invoice-Template-Download.jpg', '2024-03-08 01:26:22.455517', 6, NULL, NULL, NULL, 12),
(45, 30000.00, 'JP', 'utilities', 'bill_images/20240308065818Billing-Invoice-Template-Download.jpg', '2024-03-08 01:28:18.458688', 6, NULL, NULL, NULL, 12),
(46, 30000.00, 'JP', 'healthcare', 'bill_images/20240308070229Billing-Invoice-Template-Download.jpg', '2024-03-08 01:32:29.050262', 6, NULL, NULL, NULL, 12),
(47, 30000.00, 'JP', 'insurance', 'bill_images/20240308070500Billing-Invoice-Template-Download.jpg', '2024-03-08 01:35:00.281478', 6, NULL, NULL, NULL, 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `petty_cash_adminexpense`
--
ALTER TABLE `petty_cash_adminexpense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Petty_Cash_adminexpense_user_id_87f98e13_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `petty_cash_expense`
--
ALTER TABLE `petty_cash_expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Petty_Cash_expense_user_id_5b51caed_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `petty_cash_adminexpense`
--
ALTER TABLE `petty_cash_adminexpense`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `petty_cash_expense`
--
ALTER TABLE `petty_cash_expense`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `petty_cash_adminexpense`
--
ALTER TABLE `petty_cash_adminexpense`
  ADD CONSTRAINT `Petty_Cash_adminexpense_user_id_87f98e13_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `petty_cash_expense`
--
ALTER TABLE `petty_cash_expense`
  ADD CONSTRAINT `Petty_Cash_expense_user_id_5b51caed_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
