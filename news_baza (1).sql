-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 04:03 PM
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
-- Database: `news_baza`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `username` varchar(55) NOT NULL,
  `firstname` varchar(55) DEFAULT NULL,
  `lastname` varchar(55) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `username`, `firstname`, `lastname`, `password`, `admin`) VALUES
(1, 'admin123', 'Katarina', 'Kučinić', '$2y$10$RLTziyxKvhTGxvI8hGF/vuVpiaikPb5xCWqwr1S.utSiwQFJjxPdq', 1),
(2, 'user45', NULL, NULL, '$2y$10$MjoNxpXv4XY0jHRvf.f4IuPeibgJC7Da/ld/KVmDkRtxP7V42aTPO', 0),
(3, 'user123', 'Ana', 'Banana', '$2y$10$iSDFW5D0hwfhCvFBnGWEees484/k0eGw/su9YuvFlRWfWVqyOq8dG', 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `content` text NOT NULL,
  `category` varchar(50) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `display` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `summary`, `content`, `category`, `image_path`, `display`, `created_at`) VALUES
(1, 'Dortmund und Bayern üben sich in Psychospielchen', 'Im Feunduell mit den Münchnern um die Meisterschaft redet sich der BVB stark. Er beansprucht die Position des Teams, das alles zu gewinnen hat. Die Bayern antworten mit selbstbewussten Tönen. von Robert Peters', 'In Düsseldorf spielt sich ein packendes Duell um die deutsche Meisterschaft ab. Borussia Dortmund (BVB) und der FC Bayern München liefern sich ein intensives Kopf-an-Kopf-Rennen um den begehrten Titel. Beide Teams setzen alles daran, am Ende der Saison ganz oben zu stehen, und heizen die Rivalität mit starken Worten weiter an.\r\n\r\nBVB: Entschlossenheit und Selbstvertrauen\r\nBorussia Dortmund geht mit großer Entschlossenheit in den Titelkampf. Das Team redet sich stark und betont seine Position als die Mannschaft, die alles zu gewinnen hat. Die Spieler und das Management des BVB sind überzeugt, dass sie die nötige Qualität und Mentalität besitzen, um die Meisterschaft zu gewinnen. Diese kämpferische Haltung soll nicht nur die eigenen Reihen motivieren, sondern auch den Druck auf die Konkurrenz erhöhen.\r\n\r\nBayern München: Selbstbewusste Antwort\r\nDer FC Bayern München, der in den letzten Jahren die Bundesliga dominiert hat, reagiert auf die Ansprüche des BVB mit selbstbewussten Tönen. Die Bayern sind fest entschlossen, ihren Titel zu verteidigen und lassen keinen Zweifel an ihrem Siegeswillen. Mit ihrer Erfahrung und ihrem starken Kader sehen sie sich gut gerüstet, um die Herausforderung aus Dortmund abzuwehren.\r\n\r\nEin spannendes Rennen bis zum Schluss\r\nDas Duell zwischen Dortmund und München verspricht, bis zum letzten Spieltag spannend zu bleiben. Beide Teams haben in dieser Saison starke Leistungen gezeigt und liefern sich ein enges Rennen um die Meisterschaft. Die Fans können sich auf packende Spiele und dramatische Wendungen freuen, während BVB und Bayern alles daran setzen, den begehrten Titel zu holen.\r\n\r\nIn Düsseldorf und darüber hinaus fiebern die Fußballbegeisterten mit, wenn die beiden Spitzenmannschaften der Bundesliga im Freundschaftsduell um die Meisterschaft kämpfen. Es bleibt abzuwarten, welches Team am Ende die Nase vorn haben wird, doch eines ist sicher: Die Spannung und die Emotionen sind auf einem Höhepunkt.', 'Sport', 'slika 2.png', 1, '2024-06-05 11:03:25'),
(3, 'Zahlreiche EU-Diplomaten sind sauer auf Rumänien', 'Rumänien hat derzeit den Vorsitz unter den EU-Staaten inne. Das Treffen der Finanzminister in Brüssel nutzt das Land nun vor allem für seine eigenen Zwecke. Unter EU-Diplomaten gibt es Kritik.', 'Rumänien hat derzeit den Vorsitz unter den EU-Staaten inne, was für das Land, das der Europäischen Union 2007 beigetreten ist, von großer Bedeutung ist. Als Vorsitzland hat Rumänien die Möglichkeit, die Agenda der EU während seiner sechsmonatigen Amtszeit zu leiten und zu gestalten. Bereits zu Beginn seiner Präsidentschaft ist Rumänien jedoch auf Kritik gestoßen, da es diese Position nutzt, um seine eigenen Interessen zu fördern, insbesondere auf dem jüngsten Treffen der Finanzminister in Brüssel.\r\n\r\nRumänien übernimmt den Vorsitz\r\nDie Übernahme des EU-Vorsitzes bietet Rumänien eine einzigartige Gelegenheit, seine Prioritäten hervorzuheben und seinen Ruf innerhalb der Union zu verbessern. Der Vorsitz ermöglicht es dem Land, wichtige politische Diskussionen zu führen und Einfluss auf Entscheidungen zu nehmen, die die Zukunft der EU prägen werden. Rumänien hat angekündigt, sich auf Themen wie die Stärkung der Kohäsion innerhalb der EU, die Förderung von Sicherheit und die Unterstützung des Wirtschaftswachstums zu konzentrieren.\r\n\r\nDas Treffen der Finanzminister in Brüssel\r\nEin jüngstes Beispiel für die Nutzung des Vorsitzes für eigene Interessen war das Treffen der EU-Finanzminister in Brüssel. Bei diesem Treffen nutzte Rumänien seine Position, um Themen auf die Tagesordnung zu setzen, die für das Land von besonderer Bedeutung sind. Es wurde jedoch Kritik von anderen EU-Diplomaten laut, dass Rumänien die Gelegenheit hauptsächlich für nationale Anliegen nutzt, anstatt sich auf die kollektiven Interessen der EU zu konzentrieren.\r\n\r\nKritik von EU-Diplomaten\r\nUnter EU-Diplomaten gibt es wachsende Bedenken, dass Rumänien seine Rolle als Vorsitzland missbraucht. Kritiker argumentieren, dass der Vorsitz genutzt werden sollte, um die Zusammenarbeit und Einheit innerhalb der EU zu fördern, anstatt nationale Agenden zu priorisieren. Einige Diplomaten haben ihre Besorgnis darüber geäußert, dass Rumänien nicht ausreichend auf die gemeinsamen Herausforderungen und Ziele der EU eingeht.\r\n\r\nReaktionen und Ausblick\r\nDie Reaktionen auf Rumäniens Vorgehen sind gemischt. Während einige Länder Verständnis für die Betonung nationaler Interessen zeigen, fordern andere eine stärkere Ausrichtung auf die kollektiven Ziele der EU. In den kommenden Monaten wird es entscheidend sein, wie Rumänien die Balance zwischen seinen eigenen Interessen und den Erwartungen seiner EU-Partner findet. Der Erfolg oder Misserfolg von Rumäniens Vorsitz könnte weitreichende Auswirkungen auf seine Position innerhalb der EU und auf die zukünftige Zusammenarbeit zwischen den Mitgliedsstaaten haben.\r\n\r\nFazit\r\nRumänien steht als Vorsitzland der EU vor der Herausforderung, sowohl seine nationalen Interessen zu vertreten als auch die kollektiven Ziele der Union zu fördern. Das jüngste Treffen der Finanzminister in Brüssel hat gezeigt, dass dies ein Balanceakt sein kann, der nicht immer reibungslos verläuft. Die Kritik von EU-Diplomaten unterstreicht die Notwendigkeit, die Prioritäten sorgfältig auszubalancieren, um das Vertrauen und die Zusammenarbeit innerhalb der EU zu stärken.', 'Politik', 'slika 1.jpeg', 1, '2024-06-06 06:34:07'),
(5, 'Cacau hält mildes Urteil nach Rassismus-Eklat für „sehr bitter“', 'Drei Männer haben Nationalspieler beim Länderspiel rassistisch beleidigt. Doch die Beschuldigten kamen mit milden Strafen davon. Der DFB-Integrationsbeauftragte Cacau reagiert enttäuscht auf das Urteil. von Philip Oldenburg', 'Milde Strafen für rassistische Beleidigungen: DFB-Integrationsbeauftragter Cacau enttäuscht\r\n\r\nBei einem Länderspiel kam es zu einem Vorfall, der die Fußballwelt erschütterte: Drei Männer haben einen Nationalspieler rassistisch beleidigt. Diese Taten, die nicht nur den betroffenen Spieler, sondern auch das gesamte Konzept des Fairplays und Respekts im Sport verletzen, führten zu breiten Verurteilungen. Doch als die Urteile gegen die Täter bekannt wurden, entbrannte eine neue Welle der Empörung.\r\n\r\nDie Vorfälle und ihre Folgen\r\nWährend des Länderspiels wurde der Nationalspieler zum Ziel abscheulicher rassistischer Beleidigungen. Diese Vorfälle, die von vielen Zuschauern und auch von Kameras aufgezeichnet wurden, lösten sofort eine breite Verurteilung aus. Es wurde erwartet, dass die Täter hart bestraft würden, um ein starkes Zeichen gegen Rassismus zu setzen. Doch die milden Strafen, die gegen die drei Männer verhängt wurden, stießen auf scharfe Kritik.\r\n\r\nEnttäuschung und Kritik\r\nDer Integrationsbeauftragte des Deutschen Fußball-Bundes (DFB), Cacau, äußerte seine tiefe Enttäuschung über das Urteil. In einer Erklärung machte er deutlich, dass solche milden Strafen ein falsches Signal senden und nicht dazu beitragen, Rassismus effektiv zu bekämpfen. \"Diese Urteile spiegeln nicht die Schwere der Tat wider und senden eine beunruhigende Botschaft an alle, die sich gegen Rassismus einsetzen\", sagte Cacau.', 'Politik', 'cacau.jpg', 0, '2024-06-06 06:38:48'),
(6, 'Titelkampf in der Bundesliga: BVB und Bayern liefern sich spannendes Duell', 'In der Bundesliga liefern sich Borussia Dortmund (BVB) und der FC Bayern München ein packendes Duell um die Meisterschaft. Beide Teams sind entschlossen, den Titel zu gewinnen und setzen alles daran, am Ende der Saison ganz oben zu stehen. Während der BVB seine Position als Herausforderer betont, antworten die Bayern selbstbewusst und entschlossen. Die Fans erwartet ein spannendes Rennen bis zum letzten Spieltag.', 'In der aktuellen Bundesliga-Saison ist der Kampf um die Meisterschaft so spannend wie selten zuvor. Borussia Dortmund (BVB) und der FC Bayern München liefern sich ein intensives Kopf-an-Kopf-Rennen um den Titel. Beide Teams haben in dieser Saison starke Leistungen gezeigt und sind fest entschlossen, am Ende der Saison die Meisterschale zu holen.\r\n\r\nBVB: Entschlossenheit und Kampfgeist\r\nBorussia Dortmund geht mit großer Entschlossenheit in den Titelkampf. Das Team um Trainer Edin Terzić betont seine Rolle als Herausforderer und zeigt sich kämpferisch. \"Wir haben die Qualität und den Willen, die Meisterschaft zu gewinnen\", erklärte Kapitän Marco Reus. Diese selbstbewusste Haltung soll die Mannschaft zusätzlich motivieren und den Druck auf die Konkurrenz erhöhen.\r\n\r\nBayern München: Selbstbewusst und erfahren\r\nDer FC Bayern München, der die Bundesliga in den letzten Jahren dominiert hat, reagiert auf die Ansprüche des BVB mit gewohnter Selbstsicherheit. Trainer Thomas Tuchel und seine Spieler sind fest entschlossen, ihren Titel zu verteidigen. \"Wir wissen, was wir können und werden alles geben, um erneut Meister zu werden\", sagte Torwart Manuel Neuer. Mit ihrer Erfahrung und ihrem starken Kader sehen sich die Bayern gut gerüstet, um die Herausforderung aus Dortmund abzuwehren.\r\n\r\nEin spannendes Rennen bis zum Schluss\r\nDas Duell zwischen Dortmund und München verspricht, bis zum letzten Spieltag spannend zu bleiben. Beide Teams haben das Potenzial, die Meisterschaft zu gewinnen, und liefern sich ein enges Rennen um die Spitze. Die Fans können sich auf packende Spiele und dramatische Wendungen freuen, während BVB und Bayern alles daran setzen, den begehrten Titel zu holen.\r\n\r\nIn den kommenden Wochen wird sich zeigen, welches Team die Nerven behält und die entscheidenden Punkte holt. Eines ist sicher: Die Spannung und die Emotionen in der Bundesliga sind auf einem Höhepunkt, und die Fußballbegeisterten fiebern dem Saisonfinale entgegen.', 'Sport', 'duell.jpg', 0, '2024-06-07 18:57:04'),
(7, 'EU-Gipfel: Streit über Asylpolitik eskaliert', 'Beim jüngsten EU-Gipfel in Brüssel eskalierte der Streit über die gemeinsame Asylpolitik. Während einige Mitgliedsstaaten auf eine verstärkte Zusammenarbeit drängen, lehnen andere jegliche Veränderung ab. Der Gipfel endete ohne eine Einigung, und die Spannungen innerhalb der Union nehmen zu.', 'Der jüngste EU-Gipfel in Brüssel hat erneut die tiefen Gräben innerhalb der Europäischen Union bezüglich der Asylpolitik offenbart. Trotz intensiver Diskussionen und Verhandlungen konnten sich die Mitgliedsstaaten nicht auf eine gemeinsame Linie einigen. Die Meinungsverschiedenheiten sind tief verwurzelt und drohen, die Einheit der Union weiter zu belasten.\r\n\r\nVerstärkte Zusammenarbeit gefordert\r\nEine Gruppe von Mitgliedsstaaten, angeführt von Deutschland und Frankreich, drängte auf eine verstärkte Zusammenarbeit in der Asylpolitik. Diese Länder argumentieren, dass nur eine gemeinsame europäische Lösung die aktuellen Herausforderungen bewältigen kann. Bundeskanzler Olaf Scholz betonte: \"Wir brauchen Solidarität und eine gerechte Verteilung der Lasten. Kein Land sollte die Flüchtlingskrise alleine bewältigen müssen.\"\r\n\r\nWiderstand aus Osteuropa\r\nIm Gegensatz dazu lehnen einige osteuropäische Länder jegliche Veränderung in der Asylpolitik strikt ab. Ungarn und Polen führten die Opposition an und machten deutlich, dass sie keine weiteren Flüchtlinge aufnehmen werden. Der ungarische Ministerpräsident Viktor Orbán sagte: \"Unsere Position ist klar: Wir wollen keine verpflichtenden Quoten und keine Einmischung in unsere nationalen Angelegenheiten.\"\r\n\r\nKeine Einigung in Sicht\r\nDer Gipfel endete ohne eine Einigung, was die Spannungen innerhalb der EU weiter verschärft. Die divergierenden Positionen zeigen, wie schwierig es ist, in Fragen der Migration und Asylpolitik einen Konsens zu finden. Die Europäische Kommission kündigte an, weiterhin an einer Lösung zu arbeiten, doch der Weg zu einer gemeinsamen Politik scheint steinig zu bleiben.\r\n\r\nKonsequenzen für die Union\r\nDie Unfähigkeit, sich auf eine gemeinsame Asylpolitik zu einigen, hat weitreichende Konsequenzen für die Europäische Union. Sie untergräbt nicht nur das Vertrauen in die Fähigkeit der EU, große Herausforderungen zu bewältigen, sondern fördert auch nationalistische Tendenzen und das Erstarken euroskeptischer Bewegungen.\r\n\r\nIn den kommenden Monaten wird es entscheidend sein, ob die Mitgliedsstaaten Kompromissbereitschaft zeigen und eine Lösung finden können, die sowohl die humanitären Bedürfnisse als auch die nationalen Interessen berücksichtigt. Andernfalls droht der Union eine weitere Spaltung, die ihre Stabilität und Einheit nachhaltig gefährden könnte.', 'Politik', 'Designer (2).jpeg', 0, '2024-06-07 18:58:02'),
(8, 'Labour erklärt Gespräche ', 'Wochenlang wurde verhandelt, die Gespräche endeten nun in einer Sackgasse..', 'Die Gespräche zwischen der Labour-Partei und der konservativen Regierung über eine gemeinsame Brexit-Strategie sind gescheitert. Nach wochenlangen Verhandlungen verkündete der Labour-Vorsitzende Jeremy Corbyn das Ende der Gespräche. \"Wir konnten keine ausreichenden Fortschritte erzielen, um eine Einigung zu erreichen\", erklärte Corbyn und betonte, dass die Differenzen zwischen den beiden Parteien zu groß seien. Für Premierministerin Theresa May wird es nun noch schwieriger, ihr EU-Austrittsabkommen durch das Parlament zu bringen. Das Abkommen wurde bereits mehrfach abgelehnt, und ohne die Unterstützung der Opposition sind die Chancen auf eine Zustimmung äußerst gering. May steht unter immensem Druck, eine Lösung zu finden, bevor das Brexit-Datum erneut verschoben werden muss. Während May mit den Herausforderungen ihres Amtes kämpft, hat das Rennen um ihre Nachfolge bereits begonnen. Mehrere prominente Mitglieder der Konservativen Partei haben ihre Kandidatur angekündigt. Boris Johnson, der ehemalige Außenminister, gilt als einer der Favoriten. Er hat bereits signalisiert, dass er bereit ist, Großbritannien auch ohne Abkommen aus der EU zu führen, falls es keine neue Einigung geben sollte. Mit dem Scheitern der Gespräche ist die Zukunft des Brexits erneut ungewiss. Die politischen Fronten in Großbritannien sind verhärtet, und eine klare Lösung scheint nicht in Sicht. Experten warnen vor den wirtschaftlichen und politischen Folgen eines ungeordneten Austritts und fordern beide Seiten auf, weiterhin nach einem Kompromiss zu suchen. Die Reaktionen auf das Scheitern der Verhandlungen sind gemischt. Während einige Politiker die Verantwortung bei der Regierung sehen, werfen andere der Labour-Partei vor, nicht genug Kompromissbereitschaft gezeigt zu haben. Die EU beobachtet die Entwicklungen mit Sorge und hat wiederholt betont, dass die Zeit für eine Einigung knapp wird.', 'Politik', 'Jeremy-Corbyn-British.jpg', 1, '2024-06-10 15:55:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
