-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Mrz 2020 um 17:51
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_alexander_schaedlich_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_alexander_schaedlich_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_alexander_schaedlich_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adress`
--

CREATE TABLE `adress` (
  `id` int(11) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `adress`
--

INSERT INTO `adress` (`id`, `street`, `city`, `country`) VALUES
(1, 'schweglerstrasse', 'vienna', 'austria'),
(2, 'prasdnichnaja', 'moscow', 'russia'),
(3, 'gartenstrasse', 'berlin', 'germany'),
(4, 'poststrasse', 'bern', 'switzerland'),
(5, 'gummistrasse', 'nuernberg', 'germany');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cust`
--

CREATE TABLE `cust` (
  `id` int(11) NOT NULL,
  `fk_person` int(11) NOT NULL,
  `vip` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cust`
--

INSERT INTO `cust` (`id`, `fk_person`, `vip`) VALUES
(1, 1, 'yes'),
(2, 2, 'no'),
(3, 3, 'no');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cust_joins_p_box`
--

CREATE TABLE `cust_joins_p_box` (
  `id` int(11) NOT NULL,
  `fk_p_box` int(11) NOT NULL,
  `fk_cust` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cust_joins_p_box`
--

INSERT INTO `cust_joins_p_box` (`id`, `fk_p_box`, `fk_cust`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deposited`
--

CREATE TABLE `deposited` (
  `id` int(11) NOT NULL,
  `fk_cust` int(11) NOT NULL,
  `fk_p_box` int(11) NOT NULL,
  `deposited` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `deposited`
--

INSERT INTO `deposited` (`id`, `fk_cust`, `fk_p_box`, `deposited`) VALUES
(1, 1, 1, '2020-02-29 23:00:00'),
(2, 2, 2, '2020-03-02 14:51:46'),
(3, 3, 3, '2020-03-03 14:51:57');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deposited_joins_p_office`
--

CREATE TABLE `deposited_joins_p_office` (
  `id` int(11) NOT NULL,
  `fk_p_office` int(11) NOT NULL,
  `fk_deposited` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `deposited_joins_p_office`
--

INSERT INTO `deposited_joins_p_office` (`id`, `fk_p_office`, `fk_deposited`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `empl`
--

CREATE TABLE `empl` (
  `id` int(11) NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `fk_person` int(11) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `empl`
--

INSERT INTO `empl` (`id`, `code`, `fk_person`, `birth_date`, `from_date`, `to_date`) VALUES
(1, '234567dfg', 1, '1999-01-01', '2010-01-01', '2020-01-01'),
(2, 'wesrg456', 1, '1998-01-01', '2010-01-01', '2011-01-01'),
(3, 'jghk7546', 1, '2000-01-01', '2011-01-01', '2019-01-01');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `empl_joins_proc_syst`
--

CREATE TABLE `empl_joins_proc_syst` (
  `id` int(11) NOT NULL,
  `fk_proc_syst` int(11) NOT NULL,
  `fk_empl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `empl_joins_proc_syst`
--

INSERT INTO `empl_joins_proc_syst` (`id`, `fk_proc_syst`, `fk_empl`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `empl_joins_p_office`
--

CREATE TABLE `empl_joins_p_office` (
  `id` int(11) NOT NULL,
  `fk_empl` int(11) NOT NULL,
  `fk_p_office` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `empl_joins_p_office`
--

INSERT INTO `empl_joins_p_office` (`id`, `fk_empl`, `fk_p_office`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail`
--

CREATE TABLE `mail` (
  `id` int(11) NOT NULL,
  `type` varchar(25) DEFAULT NULL,
  `size` int(5) DEFAULT NULL,
  `weight` int(5) DEFAULT NULL,
  `fk_recipient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `mail`
--

INSERT INTO `mail` (`id`, `type`, `size`, `weight`, `fk_recipient`) VALUES
(1, 'letter', 1, 100, 1),
(2, 'package', 2, 500, 2),
(3, 'postcard', 3, 20, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail_joins_cust`
--

CREATE TABLE `mail_joins_cust` (
  `id` int(11) NOT NULL,
  `fk_mail` int(11) NOT NULL,
  `fk_cust` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `mail_joins_cust`
--

INSERT INTO `mail_joins_cust` (`id`, `fk_mail`, `fk_cust`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `f_name` varchar(25) DEFAULT NULL,
  `l_name` varchar(25) DEFAULT NULL,
  `fk_adress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `person`
--

INSERT INTO `person` (`id`, `f_name`, `l_name`, `fk_adress`) VALUES
(1, 'john', 'doe', 1),
(2, 'oliver', 'stein', 2),
(3, 'bartolomeo', 'rosso', 3),
(4, 'michael', 'baecker', 4),
(5, 'gretchen', 'kusnezowa', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `proc_syst`
--

CREATE TABLE `proc_syst` (
  `id` int(11) NOT NULL,
  `daily_capacity` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `proc_syst`
--

INSERT INTO `proc_syst` (`id`, `daily_capacity`) VALUES
(1, 1000),
(2, 2000),
(3, 3000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `proc_syst_joins_storage`
--

CREATE TABLE `proc_syst_joins_storage` (
  `id` int(11) NOT NULL,
  `fk_proc_syst` int(11) NOT NULL,
  `fk_storage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `proc_syst_joins_storage`
--

INSERT INTO `proc_syst_joins_storage` (`id`, `fk_proc_syst`, `fk_storage`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `p_box`
--

CREATE TABLE `p_box` (
  `id` int(11) NOT NULL,
  `fk_adress` int(11) NOT NULL,
  `emptying_times` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `p_box`
--

INSERT INTO `p_box` (`id`, `fk_adress`, `emptying_times`) VALUES
(1, 5, '0000-00-00'),
(2, 4, '0000-00-00'),
(3, 3, '0000-00-00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `p_office`
--

CREATE TABLE `p_office` (
  `id` int(11) NOT NULL,
  `fk_adress` int(11) NOT NULL,
  `office_hours` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `p_office`
--

INSERT INTO `p_office` (`id`, `fk_adress`, `office_hours`) VALUES
(1, 1, 'monday to friday 9am to 3pm'),
(2, 2, 'monday to friday 9am to 3pm'),
(3, 3, 'monday to friday 9am to 3pm');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `received`
--

CREATE TABLE `received` (
  `id` int(11) NOT NULL,
  `fk_proc_syst` int(11) NOT NULL,
  `fk_storage` int(11) NOT NULL,
  `received` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `received`
--

INSERT INTO `received` (`id`, `fk_proc_syst`, `fk_storage`, `received`) VALUES
(1, 1, 1, '2020-03-08 16:09:38'),
(2, 2, 2, '2020-03-09 16:09:46'),
(3, 3, 3, '2020-03-10 16:09:52');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `id` int(11) NOT NULL,
  `fk_person` int(11) NOT NULL,
  `fk_received` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`id`, `fk_person`, `fk_received`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `storage`
--

CREATE TABLE `storage` (
  `id` int(11) NOT NULL,
  `capacity` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `storage`
--

INSERT INTO `storage` (`id`, `capacity`) VALUES
(1, 200),
(2, 300),
(3, 400);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `v_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `vehicle`
--

INSERT INTO `vehicle` (`id`, `v_name`) VALUES
(1, 'car'),
(2, 'train'),
(3, 'airplane');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vehicle_joins_proc_syst`
--

CREATE TABLE `vehicle_joins_proc_syst` (
  `id` int(11) NOT NULL,
  `fk_proc_syst` int(11) NOT NULL,
  `fk_vehicle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `vehicle_joins_proc_syst`
--

INSERT INTO `vehicle_joins_proc_syst` (`id`, `fk_proc_syst`, `fk_vehicle`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `cust`
--
ALTER TABLE `cust`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_person` (`fk_person`);

--
-- Indizes für die Tabelle `cust_joins_p_box`
--
ALTER TABLE `cust_joins_p_box`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_p_box` (`fk_p_box`),
  ADD KEY `fk_cust` (`fk_cust`);

--
-- Indizes für die Tabelle `deposited`
--
ALTER TABLE `deposited`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_p_box` (`fk_p_box`),
  ADD KEY `fk_cust` (`fk_cust`);

--
-- Indizes für die Tabelle `deposited_joins_p_office`
--
ALTER TABLE `deposited_joins_p_office`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_p_office` (`fk_p_office`),
  ADD KEY `fk_deposited` (`fk_deposited`);

--
-- Indizes für die Tabelle `empl`
--
ALTER TABLE `empl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_person` (`fk_person`);

--
-- Indizes für die Tabelle `empl_joins_proc_syst`
--
ALTER TABLE `empl_joins_proc_syst`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proc_syst` (`fk_proc_syst`),
  ADD KEY `fk_empl` (`fk_empl`);

--
-- Indizes für die Tabelle `empl_joins_p_office`
--
ALTER TABLE `empl_joins_p_office`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_empl` (`fk_empl`),
  ADD KEY `fk_p_office` (`fk_p_office`);

--
-- Indizes für die Tabelle `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recipient` (`fk_recipient`);

--
-- Indizes für die Tabelle `mail_joins_cust`
--
ALTER TABLE `mail_joins_cust`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mail` (`fk_mail`),
  ADD KEY `fk_cust` (`fk_cust`);

--
-- Indizes für die Tabelle `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_adress` (`fk_adress`);

--
-- Indizes für die Tabelle `proc_syst`
--
ALTER TABLE `proc_syst`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `proc_syst_joins_storage`
--
ALTER TABLE `proc_syst_joins_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proc_syst` (`fk_proc_syst`),
  ADD KEY `fk_storage` (`fk_storage`);

--
-- Indizes für die Tabelle `p_box`
--
ALTER TABLE `p_box`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_adress` (`fk_adress`);

--
-- Indizes für die Tabelle `p_office`
--
ALTER TABLE `p_office`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_adress` (`fk_adress`);

--
-- Indizes für die Tabelle `received`
--
ALTER TABLE `received`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proc_syst` (`fk_proc_syst`),
  ADD KEY `fk_storage` (`fk_storage`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_person` (`fk_person`),
  ADD KEY `fk_received` (`fk_received`);

--
-- Indizes für die Tabelle `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `vehicle_joins_proc_syst`
--
ALTER TABLE `vehicle_joins_proc_syst`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proc_syst` (`fk_proc_syst`),
  ADD KEY `fk_vehicle` (`fk_vehicle`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `adress`
--
ALTER TABLE `adress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `cust`
--
ALTER TABLE `cust`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `cust_joins_p_box`
--
ALTER TABLE `cust_joins_p_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `deposited`
--
ALTER TABLE `deposited`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `deposited_joins_p_office`
--
ALTER TABLE `deposited_joins_p_office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `empl`
--
ALTER TABLE `empl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `empl_joins_proc_syst`
--
ALTER TABLE `empl_joins_proc_syst`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `empl_joins_p_office`
--
ALTER TABLE `empl_joins_p_office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `mail_joins_cust`
--
ALTER TABLE `mail_joins_cust`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `proc_syst`
--
ALTER TABLE `proc_syst`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `proc_syst_joins_storage`
--
ALTER TABLE `proc_syst_joins_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `p_box`
--
ALTER TABLE `p_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `p_office`
--
ALTER TABLE `p_office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `received`
--
ALTER TABLE `received`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `recipient`
--
ALTER TABLE `recipient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `storage`
--
ALTER TABLE `storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `vehicle_joins_proc_syst`
--
ALTER TABLE `vehicle_joins_proc_syst`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `cust`
--
ALTER TABLE `cust`
  ADD CONSTRAINT `cust_ibfk_1` FOREIGN KEY (`fk_person`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `cust_joins_p_box`
--
ALTER TABLE `cust_joins_p_box`
  ADD CONSTRAINT `cust_joins_p_box_ibfk_1` FOREIGN KEY (`fk_p_box`) REFERENCES `p_box` (`id`),
  ADD CONSTRAINT `cust_joins_p_box_ibfk_2` FOREIGN KEY (`fk_cust`) REFERENCES `mail_joins_cust` (`id`);

--
-- Constraints der Tabelle `deposited`
--
ALTER TABLE `deposited`
  ADD CONSTRAINT `deposited_ibfk_2` FOREIGN KEY (`fk_p_box`) REFERENCES `cust_joins_p_box` (`id`),
  ADD CONSTRAINT `fk_cust` FOREIGN KEY (`fk_cust`) REFERENCES `mail_joins_cust` (`id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `deposited_joins_p_office`
--
ALTER TABLE `deposited_joins_p_office`
  ADD CONSTRAINT `deposited_joins_p_office_ibfk_1` FOREIGN KEY (`fk_p_office`) REFERENCES `p_office` (`id`),
  ADD CONSTRAINT `deposited_joins_p_office_ibfk_2` FOREIGN KEY (`fk_deposited`) REFERENCES `deposited` (`id`);

--
-- Constraints der Tabelle `empl`
--
ALTER TABLE `empl`
  ADD CONSTRAINT `empl_ibfk_1` FOREIGN KEY (`fk_person`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `empl_joins_proc_syst`
--
ALTER TABLE `empl_joins_proc_syst`
  ADD CONSTRAINT `empl_joins_proc_syst_ibfk_1` FOREIGN KEY (`fk_proc_syst`) REFERENCES `vehicle_joins_proc_syst` (`id`),
  ADD CONSTRAINT `empl_joins_proc_syst_ibfk_2` FOREIGN KEY (`fk_empl`) REFERENCES `empl_joins_p_office` (`id`);

--
-- Constraints der Tabelle `empl_joins_p_office`
--
ALTER TABLE `empl_joins_p_office`
  ADD CONSTRAINT `empl_joins_p_office_ibfk_1` FOREIGN KEY (`fk_empl`) REFERENCES `empl` (`id`),
  ADD CONSTRAINT `empl_joins_p_office_ibfk_2` FOREIGN KEY (`fk_p_office`) REFERENCES `deposited_joins_p_office` (`id`);

--
-- Constraints der Tabelle `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`fk_recipient`) REFERENCES `person` (`id`);

--
-- Constraints der Tabelle `mail_joins_cust`
--
ALTER TABLE `mail_joins_cust`
  ADD CONSTRAINT `mail_joins_cust_ibfk_1` FOREIGN KEY (`fk_mail`) REFERENCES `mail` (`id`),
  ADD CONSTRAINT `mail_joins_cust_ibfk_2` FOREIGN KEY (`fk_cust`) REFERENCES `cust` (`id`);

--
-- Constraints der Tabelle `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`fk_adress`) REFERENCES `adress` (`id`);

--
-- Constraints der Tabelle `proc_syst_joins_storage`
--
ALTER TABLE `proc_syst_joins_storage`
  ADD CONSTRAINT `proc_syst_joins_storage_ibfk_1` FOREIGN KEY (`fk_proc_syst`) REFERENCES `empl_joins_proc_syst` (`id`),
  ADD CONSTRAINT `proc_syst_joins_storage_ibfk_2` FOREIGN KEY (`fk_storage`) REFERENCES `storage` (`id`);

--
-- Constraints der Tabelle `p_box`
--
ALTER TABLE `p_box`
  ADD CONSTRAINT `p_box_ibfk_1` FOREIGN KEY (`fk_adress`) REFERENCES `adress` (`id`);

--
-- Constraints der Tabelle `p_office`
--
ALTER TABLE `p_office`
  ADD CONSTRAINT `p_office_ibfk_1` FOREIGN KEY (`fk_adress`) REFERENCES `adress` (`id`);

--
-- Constraints der Tabelle `received`
--
ALTER TABLE `received`
  ADD CONSTRAINT `received_ibfk_1` FOREIGN KEY (`fk_proc_syst`) REFERENCES `empl_joins_proc_syst` (`id`),
  ADD CONSTRAINT `received_ibfk_2` FOREIGN KEY (`fk_storage`) REFERENCES `proc_syst_joins_storage` (`id`);

--
-- Constraints der Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_person`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `recipient_ibfk_2` FOREIGN KEY (`fk_received`) REFERENCES `received` (`id`);

--
-- Constraints der Tabelle `vehicle_joins_proc_syst`
--
ALTER TABLE `vehicle_joins_proc_syst`
  ADD CONSTRAINT `vehicle_joins_proc_syst_ibfk_1` FOREIGN KEY (`fk_proc_syst`) REFERENCES `proc_syst` (`id`),
  ADD CONSTRAINT `vehicle_joins_proc_syst_ibfk_2` FOREIGN KEY (`fk_vehicle`) REFERENCES `vehicle` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
