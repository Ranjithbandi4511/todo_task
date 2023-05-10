-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2023 at 07:45 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `category_name`) VALUES
(1, 'all'),
(15, 'Politic'),
(17, 'sports'),
(18, 'fashion'),
(22, 'Technology'),
(23, 'busniess');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `cmt_id` int(11) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `commentby_id` int(11) NOT NULL,
  `nid` int(11) NOT NULL,
  `newsposted_by` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`cmt_id`, `comment`, `commentby_id`, `nid`, `newsposted_by`, `is_deleted`, `date`) VALUES
(4, 'ajuu bhai', 23, 47, 12, 0, '2021-12-15'),
(5, 'liked by reporter', 12, 47, 12, 0, '2021-12-15'),
(6, 'ajay patidar', 12, 46, 23, 0, '2021-12-15'),
(7, 'ajaypatidar', 12, 47, 12, 0, '2021-12-15'),
(8, 'nice', 12, 44, 23, 0, '2021-12-15'),
(9, 'liked by r', 12, 41, 21, 0, '2021-12-15'),
(10, 'ajua', 12, 47, 12, 0, '2021-12-15'),
(11, 'kvnakdn', 12, 45, 23, 0, '2021-12-15'),
(12, 'ajayajsdkajnd', 12, 45, 23, 0, '2021-12-15'),
(13, 'rtdytfytdsdyuguydred', 1, 44, 23, 0, '2022-01-11'),
(14, 'cggv gkhvyg', 30, 46, 23, 0, '2022-01-11'),
(15, 'kjhgf', 1, 46, 23, 0, '2022-02-28'),
(16, ',;lmknjbhgfdslkjhgf', 1, 46, 23, 0, '2022-02-28'),
(17, '', 1, 38, 12, 0, '2022-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `likednews`
--

CREATE TABLE `likednews` (
  `like_id` int(11) NOT NULL,
  `newslikedby_id` int(11) NOT NULL,
  `n_id` int(11) NOT NULL,
  `newspostedby` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likednews`
--

INSERT INTO `likednews` (`like_id`, `newslikedby_id`, `n_id`, `newspostedby`) VALUES
(10, 12, 41, 21),
(11, 12, 46, 23),
(12, 12, 47, 12),
(13, 1, 44, 23),
(14, 30, 46, 23),
(15, 30, 46, 23),
(16, 1, 0, 0),
(17, 1, 0, 0),
(18, 1, 47, 12),
(19, 1, 27, 12),
(20, 1, 38, 12),
(21, 12, 38, 12);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `lid` int(11) NOT NULL,
  `Location_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`lid`, `Location_name`) VALUES
(1, 'all'),
(4, 'Hyderabad'),
(5, 'bihar'),
(9, 'madhya pradesh'),
(10, 'Delhi'),
(11, 'Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `mid` int(11) NOT NULL,
  `to_id` varchar(200) NOT NULL,
  `from_id` varchar(200) NOT NULL,
  `attachiement` varchar(500) NOT NULL,
  `message` varchar(500) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`mid`, `to_id`, `from_id`, `attachiement`, `message`, `date`) VALUES
(28, '20', '1', 'news (1).sql', 'ajaaaaay', '2021-12-23'),
(43, '12', '1', 'img/a.21.jpg', 'to deep', '2021-12-23'),
(44, '28', '12', 'img/a1.jpg', 'message to anku', '2021-12-23'),
(45, '1', '20', 'img/a.15.jpg', 'sebd email by editor to admin', '2021-12-24');

-- --------------------------------------------------------

--
-- Table structure for table `news.category`
--

CREATE TABLE `news.category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news_detail`
--

CREATE TABLE `news_detail` (
  `nid` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `nheading` varchar(1000) NOT NULL,
  `ncategory` int(11) NOT NULL,
  `nlocation` int(11) NOT NULL,
  `nimg` varchar(200) NOT NULL,
  `ndescription` varchar(10000) NOT NULL,
  `is_verify` int(11) NOT NULL DEFAULT 0,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  `is_breaking` int(11) NOT NULL DEFAULT 0,
  `viewcount` int(20) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news_detail`
--

INSERT INTO `news_detail` (`nid`, `u_id`, `nheading`, `ncategory`, `nlocation`, `nimg`, `ndescription`, `is_verify`, `is_delete`, `is_breaking`, `viewcount`, `date`) VALUES
(27, 12, 'Modi to inaugurate Gorakhpur AIIMS fertiliser unit in', 22, 4, 'img/n3.jpg', ' Gorakhpur (Uttar Pradesh), Nov 29 | Modi to inaugurate Gorakhpur AIIMS fertiliser unit in Dec. Prime Minister Narendra Modi will inaugurate the branch of AIIMS in Gorakhpur in mid- December.According to Chief Minister Yogi Adityanath, in December an All-India Institute of Medical Sciences (AIIMS) will be inaugurated in Gorakhpur and also a fertiliser factory which has been lying closed since 1990, will be restarted.Yogi Adityanath said, “The inauguration of the AIIMS in Gorakhpur will be done next month. Since 2004 there has been a demand for setting up an AIIMS in Gorakhpur.”He also said that the fertiliser factory, which has been lying closed since 1990, will also be restarted next month. Prime Minister Narendra Modi will dedicate both facilities to the public.', 1, 0, 1, 2, '2021-11-29'),
(29, 12, 'Incumbent upon judges to exercise discretion in their utterances in courtrooms: President', 15, 4, 'img/a.13.jpg', ' New Delhi, Nov 27 | President Ram Nath Kovind said on Saturday that it is incumbent upon the judges to exercise utmost discretion in their utterances inside courtrooms, as indiscreet remarks, even if made with good intention, can give space for dubious interpretations to run down the judiciary.Addressing the valedictory function of the Constitution Day programme organised by the Supreme Court, Kovind expressed happiness as he noted that the Indian judiciary has been adhering to the highest standards.He said: “There is no doubt that you have set for yourself a high bar. Hence, it is also incumbent upon the judges to exercise utmost discretion in their utterances in courtrooms. Indiscreet remarks, even if made with good intention, can give space for dubious interpretations to run down the judiciary.”', 1, 0, 0, 1, '2021-11-29'),
(30, 12, 'Govt ready to discuss all issues but dignity of Parliament be maintained: Modi', 15, 4, 'img/a1.1.jpg', ' New Delhi, Nov 29 | Govt ready to discuss all issues but dignity of Parliament be maintained: Modi. Govt ready to discuss all issues, but dignity of Parliament be maintained: ModiPrime Minister Narendra Modi on Monday appealed to all political parties for cooperation to ensure smooth functioning of Parliament and said that the Union government is ready to discuss and answer all issues.\r\n\r\nTalking to media persons on the first day of the winter session of Parliament, Modi said Opposition parties are free to raise their voice against the government, but at the same time dignity of Parliament should be maintained.\r\n\r\nThe Prime Minister suggested that discussions and not the disruptions should be the yardstick on which the success of Parliament should be weighed.', 1, 0, 0, 0, '2021-11-29'),
(32, 12, 'UP BJP welcomes Opposition MLAs to win their seats', 15, 4, 'img/a.1.2.jpg', ' The party is determined to fulfil its ‘Mission 300 Plus’ and is leaving no stone unturned to achieve the target.\r\n\r\nFor instance, the five seats where the securities of BJP candidates were forfeited are — Gauriganj, Sahaswan, Sadabad, Soraon, and Rae Bareli Sadar.\r\n\r\nThe BJP has already welcomed the sitting Rae Bareli legislator Aditi Singh into its fold. Aditi Singh’s father, late Akhilesh Singh wielded considerable influence in the region and she rode to victory in 2017 on this strength. The BJP is confident that she will retain the seat and add it to the saffron kitty.\r\n\r\nBSP’s Ramvir Upadhyay, who defeated the BJP in Sadabad seat in Hathras in 2017, has also joined the BJP and will be the party’s candidate in the upcoming elections.\r\n\r\nRakesh Pratap Singh of Samajwadi Party had won the Gauriganj seat in Amethi.\r\n\r\nHe recently resigned from the membership of the state Assembly, citing lack of development in the area.', 1, 0, 0, 4, '2021-11-29'),
(33, 21, 'It’s time New Zealand also got their spin bowling in shape: Ian Smith', 17, 4, 'img/s2.jpg', ' Auckland, Nov 29 | It’s time New Zealand also got their spin bowling in shape: Ian Smith. Former New Zealand wicketkeeper-batter Ian Smith wants the Kane Williamson-led side to also learn a few spin tricks, which would help them compete more efficiently and effectively on sub-continental pitches suited for slow bowlers.\r\n\r\nAs the tourists’ opening Test against India entered the fifth day with India holding the upper hand on a spin-friendly Green Park wicket in Kanpur, Smith, a veteran of 63 Tests and having scored more than 1800 runs, said that he had no doubt in his mind that “spinners will win the Test”.\r\n\r\n“In these vital spinning Tests, it’s more important and apparent than ever. The spinners will win this Test. That was a given the day this tour was announced way, way back,” said Smith on sen.com.au on Monday.\r\n\r\n“It’s so lopsided in their favour it’s not funny. Just as it is for the quicks when we host teams here. Unfortunately though for us, that is now coming to our detriment in the subcontinent, and we’ll always do so unless we learn to play it better,” he added, indicating that a quality spinner in the New Zealand ranks, which is overflowing with pacers, could have done the trick in India.', 1, 0, 0, 0, '2021-11-29'),
(36, 12, 'Kisan Mahapanchayat in Panipat: Govt should repeal three farm laws at earliest, says Rakesh Tikait', 22, 4, 'img/a3.jpg', ' Addressing a Kisan Mahapanchayat in Panipat, Bharatiya Kisan Union (BKU) leader Rakesh Tikait on September 26 said that the government should repeal the three farm laws at the earliest. “Government of India should repeal the three farm laws at the earliest. If not, Samyukt Kisan Morcha will go every part of the country, hold meetings and protests against the Central government and campaign in poll-bound states,” he said. (ANI)', 1, 0, 1, 0, '2021-11-29'),
(37, 12, 'Earlier in the day, the bill was passed in the Lok Sabha amid din.  \"There was a demand for repeal of the three farm laws. In his large heartedness, Prime Minister Narendra Modi decided to repeal these  ..  Read more at: https://economictimes.indiatimes.com/news/politics-and-nation/bill-to-repeal-farm-laws-to-be-brought-in-rajya-sabha-today-itself-pralhad-joshi/articleshow/87976769.cms?utm_source=contentofinterest&utm_medium=text&utm_campaign=cppst', 23, 4, 'img/s1.jpg', ' 12345Earlier in the day, the bill was passed in the Lok Sabha amid din.\r\n\r\n\"There was a demand for repeal of the three farm laws. In his large heartedness, Prime Minister Narendra Modi decided to repeal these  ..\r\n\r\nRead more at:\r\nhttps://economictimes.indiatimes.com/news/politics-and-nation/bill-to-repeal-farm-laws-to-be-brought-in-rajya-sabha-today-itself-pralhad-joshi/articleshow/87976769.cms?utm_source=contentofinterest&utm_medium=text&utm_campaign=cppstEarlier in the day, the bill was passed in the Lok Sabha amid din.\r\n\r\n\"There was a demand for repeal of the three farm laws. In his large heartedness, Prime Minister Narendra Modi decided to repeal these  ..\r\n\r\nRead more at:\r\nhttps://economictimes.indiatimes.com/news/politics-and-nation/bill-to-repeal-farm-laws-to-be-brought-in-rajya-sabha-today-itself-pralhad-joshi/articleshow/87976769.cms?utm_source=contentofinterest&utm_medium=text&utm_campaign=cppst', 1, 0, 1, 6, '2021-11-30'),
(38, 12, 'Tug-of-war between Aam Aadmi Party, ‘aam aadmi’ CM in Punjab', 15, 4, 'img/a.123.jpg', ' 9893011345sdfer11588548', 1, 0, 0, 17, '2021-11-30'),
(39, 12, 'Oppn likely to boycott session if suspension of 12 MPs not revoked', 15, 4, 'img/b.1.jpg', ' New Delhi, Nov 30 | The floor leaders of opposition are meeting on Tuesday to discuss strategy after the suspension of 12 MPs in the Rajya Sabha. Sources said that if the suspension was not revoked, the opposition may decide to boycott the House.\r\n\r\nThe Congress has alleged that the government wants to pass the Bills and now has created a majority number after the suspension of MPs.\r\n\r\n“By suspending 12 MPs from the #RajyaSabha, BJP has now gone ahead of the majority number. Can easily pass listed bills through the upper house now. This move has no parallel in history of parliamentary democracy and is entirely undemocratic, unlawful, and unconstitutional!” Congress spokesperson Abhishek Manu Singhvi tweeted\r\n\r\nFourteen parties under the signature of Leader of Opposition in the Rajya Sabha, Mallikarjun Kharge issued a statement saying, “The leaders of the opposition parties condemn the unwarranted and undemocratic suspension of 12 members in violation of rules of procedure of Rajya Sabha.”\r\n\r\n', 1, 0, 0, 4, '2021-11-30'),
(40, 12, 'RS Chairman calls for democratic space for productive session', 15, 4, 'img/b.2.jpg', ' New Delhi, Nov 29 | RS Chairman calls for democratic space for productive session. Rajya Sabha Chairman M. Venkaiah Naidu on Monday urged members to follow rules so that the winter session can be productive and the house does not have to witness unruly scenes as was seen during monsoon session.\r\n\r\nNaidu urged all sections of the house to ensure “democratic and parliamentary space” to enable a democratic and parliamentary space and lamented the failure on the part of all concerned to introspect over the unruly incidents during the last monsoon session and commit to do the needful to prevent their recurrence.\r\n\r\nNaidu said this during his observations in the house on the first day of the winter session on Monday.\r\n\r\nNoting that some members were not present during the commemoration of the Constitution Day on the November 26, he referred to the people opting for democracy for peaceful socio-political and economic transformation of the country, and said: “Accordingly, the Constitution prescribed dialogue and debate in the legislatures for negotiated pathways for development based on the will of the people conveyed in succeeding elections to the Parliament and state legislatures”.', 0, 1, 0, 0, '2021-11-30'),
(41, 21, 'IND v NZ: Ashwin and umpire Nitin Menon in argument over vision obstruction', 17, 10, 'img/a12.jpg', ' Kanpur, Nov 27 | IND v NZ: Ashwin and umpire Nitin Menon in argument over vision obstruction. India off-spinner Ravichandran Ashwin and on-field umpire Nitin Menon were seen arguing over allegedly obstructing the vision of the latter during the first session of day three in the first Test against New Zealand on Saturday.\r\n\r\nThe incident happened during the 77th over when Ashwin had completed bowling the fourth ball to New Zealand captain Kane Williamson and went across after finishing his bowling action.\r\n\r\nAfter this, Menon was seen having a word with Ashwin over the off-spinner finishing his bowling action in front of him, which hinted at the umpire being blinded a bit while stepping on the danger area.\r\n\r\nAshwin then beat the outer edge of Williamson’s bat with an around the off-stump delivery which skid after pitching. Immediately after this, India captain Ajinkya Rahane was summoned for a conversation with on-field umpires Menon and Virender Sharma.', 1, 0, 0, 30, '2021-11-30'),
(42, 21, 'Ian Chappell slams Cricket Australia for appointing Smith as vice-captain', 17, 10, 'img/a13.jpg', ' Sydney, Nov 27 | Ian Chappell slams Cricket Australia for appointing Smith as vice-captain. Australian cricketing legend Ian Chappell has slammed Cricket Australia’s (CA) decision to appoint Steve Smith as vice-captain of the team ahead of the five-Test Ashes series beginning at the Gabba on December 8, saying, “If I’d have cheated as an Australian captain, they (CA) would have taken the job away from me and made sure I didn’t continue to play as a player.”\r\n\r\nChappell’s comments have put the spotlight back on the ball-tampering episode that took place during the third Test against South Africa at Newlands, Cape Town in 2018.\r\n\r\nThe-then Australian skipper Smith, his deputy David Warner and team-mate Cameron Bancroft were banned for different periods following the scandal, which came to be known as “Sandpaper-gate”.\r\n\r\nIn addition to a one-year suspension, a two-year leadership ban was also imposed on Smith, while Warner, who was the then vice-captain, also received a year ban, as well as a lifetime leadership ban.\r\n\r\n“I wish that Cricket Australia had made a clean break, but for Cricket Australia to get anything right at the moment is asking a bit much,” Chappell said on 2GB’s Wide World of Sports radio on Saturday.', 0, 0, 0, 0, '2021-11-30'),
(43, 21, 'Indonesia Open: PV Sindhu loses to Ratchanok Intanon in semi-finals', 17, 10, 'img/a.1.jpg', ' There are exceptional cases like those seeking master’s degree or may have a family business to take care of or an entrepreneurial venture in mind. But the exception cases are barely 1%. For the rest 99%, a management degree is a ticket to a dream job through campus placements or leap towards career enhancements. Stakes are high as many of them quit their jobs which essentially means loss of 2 years of income, apprehension and uncertainty of the job market. On top of that, the pressure to pay back the education loans. Hence the returns have to be high. There is more than just the management degree. Colleges need to ensure that they offer quality management education which enables them to be prepared for not just the demands of recruiters and for a decent job but also to sustain and achieve, all along their career path.', 1, 0, 0, 0, '2021-11-30'),
(44, 23, 'Roland Mouret Files For Administration, Shuts Down Carlos Place Store', 18, 11, 'img/FB_IMG_1597075678919 - Copy.jpg', ' The London-based couturier best known for its curve-hugging “Galaxy” dress has entered administration as the market for high-end occasion-wear continues to struggle, BoF has confirmed.Administrators and movers were seen emptying Roland Mouret’s boutique and headquarters in London’s Mayfair of valuable items Thursday, according to the Daily Mail. Around 50 staff are being let go, WWD reported citing unnamed industry sources.French-born Mouret’s frocks, known for their body-smoothing structure and often topped with an origami-folded cap sleeve, became celebrity favourites starting with the release of his “Galaxy” silhouette in 2005. Victoria Beckham, Scarlett Johansson, the Duchesses of Cambridge and countless Real Housewives on Bravo have sported the look, which is at once sexy and ladylike.Mouret made a profit of £950,000 ($1.3 million) on sales of £16 million in 2019, according to the brand’s filing to the U.K. companies register.', 1, 0, 1, 22, '2021-11-30'),
(45, 23, 'Retailers Have Sky-High Expectations for Black Friday. Will Shoppers Show Up?', 18, 11, 'img/a.15.jpg', ' This week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\nThis week, everyone will be talking about Black Friday, earnings from Abercrombie & Fitch and other mall brands, plus House of Gucci.\r\n', 1, 0, 0, 7, '2021-11-30'),
(46, 23, 'Fashion and Art Collide in Miami', 18, 11, 'img/a.14.jpg', ' This week, everyone will be talking about fashion crossovers at Art Basel Miami Beach, London’s Fashion Awards and BoF VOICES.This week, everyone will be talking about fashion crossovers at Art Basel Miami Beach, London’s Fashion Awards and BoF VOICES.This week, everyone will be talking about fashion crossovers at Art Basel Miami Beach, London’s Fashion Awards and BoF VOICES.This week, everyone will be talking about fashion crossovers at Art Basel Miami Beach, London’s Fashion Awards and BoF VOICES.', 1, 0, 0, 28, '2021-11-30'),
(47, 12, 'BJP activist’s security guard goes missing with 2 weapons in J&K’s Kupwara', 15, 4, 'img/ap.jpg', ' Srinagar, Dec 13 | The personal security guard of a BJP activist went missing along with two weapons during Sunday night in Jammu and Kashmir’s Kupwara district.\r\n\r\nPolice said during the intervening night of December 12 and 13, Saqib Ahmad Tantry, special police officer (SPO) deployed as the security guard with BJP activist Abdul Rashid Zargar fled with two weapons.\r\n\r\nSaqib’s associate, Arif Ahmad is also missing.\r\n\r\nPolice said efforts are on to trace the duo.\r\n\r\n“Saqib Ahmad Tantry had come to his house and left. His family told us that they are also searching for him,” police said.\r\n\r\nOriginally a resident of Lolab tehsil in Kupwara district Abdul Rashid Zargar is presently being kept along with other protected persons in the PWD building at Salkoot and it is from here that Saqib and h', 1, 0, 1, 54, '2021-12-13'),
(48, 12, '‘Bigg Boss 15’: Karan, Tejasswi’s relationship turns bitter as duo get into ugly fight', 15, 4, 'img/k.jpg', ' Mumbai, Dec 14 | The latest promo of ‘Bigg Boss 15’ shows Karan Kundraa and Tejasswi Prakash getting into an ugly fight. It seems as if their relationship is going through a rough patch.\r\n\r\nInitially Tejasswi was talking to Umar Riaz and how she saved him from nomination. She asked Rashami why she never saved her and Rashami says that she often saved Karan but the issue was created when Rashami said that Tejasswi is feeling insecure as she is saving Karan.\r\n\r\nBut Tejasswi denied the fact saying she will be rather happy if Karan is saved. This leads to the fight between them.\r\n\r\nLater, wild card contestant Rashami Desai tells Karan that his girlfriend Tejasswi has some problem with her and she is being insecure and it is difficult for Rashami to handle it.\r\n\r\nKaran replies to Rashami, saying: “I don’t appreciate what she said.” Later on the dining table both Tejasswi and Rashami have a heated conversation. Tejasswi gets furious at Rashami as she continues to talk. This infuriates Tejasswi and she shouts at her. Karan intervenes and asks Tejassi to stay calm.', 0, 1, 0, 0, '2021-12-14');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `noti_id` int(11) NOT NULL,
  `noti_event` varchar(200) NOT NULL,
  `noti_object` varchar(200) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `u_id` varchar(200) NOT NULL,
  `n_id` int(11) NOT NULL,
  `to_id` varchar(100) NOT NULL,
  `l_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `role` varchar(200) NOT NULL,
  `A_seen` int(11) NOT NULL DEFAULT 0,
  `R_seen` int(11) NOT NULL DEFAULT 0,
  `E_seen` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`noti_id`, `noti_event`, `noti_object`, `username`, `u_id`, `n_id`, `to_id`, `l_id`, `c_id`, `post_id`, `role`, `A_seen`, `R_seen`, `E_seen`, `date`) VALUES
(53, 'deleted by', 'One reporter', 'reporter', 'Ajay patidar', 0, '1', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-25'),
(54, 'added by', 'One Reporter', 'aalu', 'Ajay patidar', 0, '32', 5, 15, 1, 'admin', 1, 0, 0, '2022-01-25'),
(55, 'deleted by', 'One reporter', 'aalu', 'Ajay patidar', 0, '1', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(56, 'deleted by', 'One editor', 'golu', 'Ajay patidar', 0, 'Array', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(57, 'deleted by', 'One editor', 'golu', 'Ajay patidar', 0, 'Array', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(58, 'deleted by', 'One editor', 'Nasim Ansari', 'Ajay patidar', 0, '22', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(59, 'added by', 'One Reporter', 'aalu', 'Ajay patidar', 0, '33', 10, 17, 1, 'admin', 1, 0, 0, '2022-01-26'),
(60, 'added by', 'One Reporter', 'Ajay patidar', 'Ajay patidar', 0, '34', 5, 22, 1, 'admin', 1, 0, 0, '2022-01-26'),
(61, 'added by', 'One Reporter', 'aalu', 'Ajay patidar', 0, '35', 4, 15, 1, 'admin', 1, 0, 0, '2022-01-26'),
(62, 'suspended by', 'One reporter', 'aalu', 'Ajay patidar', 0, '33', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(63, 'deleted by', 'One reporter', 'aalu', 'Ajay patidar', 0, '33', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(64, 'deleted by', 'One reporter', 'aalu', 'Ajay patidar', 0, '33', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(65, 'deleted by', 'One reporter', 'aalu', 'Ajay patidar', 0, '33', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(66, 'deleted by', 'One reporter', 'aalu', 'Ajay patidar', 0, '33', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(67, 'deleted by', 'One reporter', 'aalu', 'Ajay patidar', 0, '33', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(68, 'deleted by', 'One reporter', 'aalu', 'Ajay patidar', 0, '33', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(69, 'deleted by', 'One reporter', 'aalu', 'Ajay patidar', 0, '33', 1, 1, 1, 'admin', 1, 0, 0, '2022-01-26'),
(70, 'added by', 'One Reporter', 'Ravi kumar', 'Ajay patidar', 0, '36', 4, 22, 1, 'admin', 1, 0, 0, '2022-01-27'),
(71, 'blocked by', 'One user', 'user', 'Ajay patidar', 0, '11', 0, 0, 1, 'user', 1, 0, 0, '2022-01-27'),
(72, 'suspended by', 'One reporter', 'aalu', 'Ajay patidar', 0, '35', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(73, 'suspended by', 'One reporter', 'Ajay patidar', 'Ajay patidar', 0, '34', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(74, 'realsed by', 'One reporter', 'aalu', 'Ajay patidar', 0, '35', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(75, 'suspended by', 'One reporter', 'aalu', 'Ajay patidar', 0, '35', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(76, 'deleted by', 'One reporter', 'aalu', 'Ajay patidar', 0, '35', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(77, 'deleted by', 'One reporter', 'aalu', 'Ajay patidar', 0, '35', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(78, 'realsed by', 'One reporter', 'aalu', 'Ajay patidar', 0, '35', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(79, 'realsed by', 'One reporter', 'aalu', 'Ajay patidar', 0, '33', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(80, 'realsed by', 'One reporter', 'Ajay patidar', 'Ajay patidar', 0, '34', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(81, 'deleted by', 'One reporter', 'reporter', 'Ajay patidar', 0, '31', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(82, 'deleted by', 'One reporter', 'Ajay patidar', 'Ajay patidar', 0, '34', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(83, 'added by', 'One Reporter', 'kittu', 'Ajay patidar', 0, '37', 10, 17, 1, 'admin', 1, 0, 0, '2022-02-06'),
(84, 'realsed by', 'One editor', 'deep', 'Ajay patidar', 0, '24', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-06'),
(85, 'recieved by', 'One Comment', 'kjhgf', 'Ajay patidar', 46, '', 0, 0, 1, 'Ajay patidar', 1, 0, 0, '2022-02-28'),
(86, 'recieved by', 'One Comment', ',;lmknjbhgfdslkjhgf', 'Ajay patidar', 46, '', 0, 0, 1, 'Ajay patidar', 1, 0, 0, '2022-02-28'),
(87, 'suspended by', 'One reporter', 'kittu', 'Ajay patidar', 0, '37', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-28'),
(88, 'realsed by', 'One reporter', 'kittu', 'Ajay patidar', 0, '37', 1, 1, 1, 'admin', 1, 0, 0, '2022-02-28'),
(89, 'recieved by', 'One Comment', '', 'Ajay patidar', 38, '', 0, 0, 1, 'Ajay patidar', 1, 0, 0, '2022-03-01'),
(90, 'suspended by', 'One reporter', 'kittu', 'Ajay patidar', 0, '37', 1, 1, 1, 'admin', 1, 0, 0, '2022-05-18'),
(91, 'realsed by', 'One reporter', 'kittu', 'Ajay patidar', 0, '37', 1, 1, 1, 'admin', 1, 0, 0, '2022-05-18'),
(92, 'suspended by', 'One reporter', 'Ravi kumar', 'Ajay patidar', 0, '36', 1, 1, 1, 'admin', 1, 0, 0, '2022-05-18'),
(93, 'suspended by', 'One reporter', 'Ravi kumar', 'Ajay patidar', 0, '36', 1, 1, 1, 'admin', 1, 0, 0, '2022-05-18'),
(94, 'suspended by', 'One reporter', 'Ravi kumar', 'Ajay patidar', 0, '36', 1, 1, 1, 'admin', 1, 0, 0, '2022-05-18'),
(95, 'registered as', 'One user', 'ranjith', 'self', 0, '', 1, 0, 38, 'user', 1, 0, 0, '2023-04-19'),
(96, 'realsed by', 'One reporter', 'Ravi kumar', 'Admin', 0, '36', 1, 1, 1, 'admin', 1, 0, 0, '2023-04-19');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `rid` int(11) NOT NULL,
  `role` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `todo_data`
--

CREATE TABLE `todo_data` (
  `id` int(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `details` varchar(250) NOT NULL,
  `todo_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `todo_data`
--

INSERT INTO `todo_data` (`id`, `title`, `details`, `todo_date`) VALUES
(12, 'kuytu', 'uiytr', '2023-05-16'),
(13, 'tdod 2', 'detail todod 3', '2023-05-17'),
(14, 'drry', 'sjh', '2023-05-23');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(11) NOT NULL,
  `role` varchar(30) NOT NULL,
  `image` varchar(200) NOT NULL,
  `l_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `address` varchar(500) NOT NULL,
  `is_verify` int(20) NOT NULL DEFAULT 0,
  `is_delete` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `mobile`, `email`, `password`, `role`, `image`, `l_id`, `c_id`, `address`, `is_verify`, `is_delete`, `date`) VALUES
(1, 'Admin', '88888888', 'admin@gmail.com', 'admin', 'admin', 'img/2669879.jpg', 1, 1, 'hyderabad', 0, 0, '2021-11-23'),
(11, 'user', '9852141658', 'user@gmail.com', 'user', 'user', '', 4, 1, '', 1, 0, '2021-11-26'),
(12, 'reporter', '0989 301 1345', 'reporter@gmail.com', 'reporter', 'reporter', 'img/david.jpg', 4, 15, 'khargone', 0, 1, '2021-11-26'),
(20, 'editor', '889865846', 'editor@gmail.com', 'editor', 'editor', 'img/ajju.jpg', 4, 15, '', 0, 0, '2021-11-28'),
(21, 'mayank rajput', '45866654', 'mayank@gmail.com', 'mayank', 'reporter', 'img/Snapchat-140637825.jpg', 10, 17, 'chattisgarh', 0, 1, '2021-11-29'),
(22, 'Nasim Ansari', '5436865858', 'nasim@gmail.com', 'nasim', 'editor', 'img/Snapchat-253988083.jpg', 10, 17, 'Chattisgarh', 0, 1, '2021-11-29'),
(23, 'kishan', '8358085245', 'kishan@gmail.com', 'kishan', 'reporter', 'img/IMG-20210403-WA0017.jpg', 11, 18, '', 0, 1, '2021-11-30'),
(24, 'deepk', '8698985695', 'deep@gmail.com', 'deep', 'editor', 'img/IMG-20210403-WA0019.jpg', 4, 17, '', 0, 0, '2021-11-30'),
(25, 'anju', '983011456', 'anju@gmail.com', 'anju', 'reporter', '', 10, 17, '', 0, 1, '2021-12-13'),
(26, 'lalita', '8748646584', 'lalita@gmail.com', 'lalita', 'reporter', '', 9, 17, '', 0, 1, '2021-12-13'),
(27, 'siddartha', '9893011345', 's@gmail.com', 'anku', 'user', 'img/a.123.jpg', 5, 1, 'khargone ', 0, 0, '2021-12-14'),
(28, 'vinay', '965846568978', 'anku@gmail.com', 'anku', 'reporter', '', 10, 15, '', 0, 1, '2021-12-14'),
(29, 'golu', '0989 301 1345', 'golu@gmail.com', 'golu', 'editor', '', 9, 23, '', 0, 1, '2021-12-14'),
(30, 'hari ', '0989 301 1345', 'hari@gmail.com', '123456', 'user', 'img/DSC_2363.jpg', 9, 1, 'Khargone mangrul road vallabh nagar 7', 0, 0, '2022-01-11'),
(31, 'reporter', '0989 301 1345', 'reporter12@gmail.com', 'reporter', 'reporter', '', 10, 15, '', 0, 1, '2022-01-25'),
(33, 'aalu', '98930113456', 'aalu@gmail.com', 'aalu', 'reporter', '', 10, 17, '', 0, 1, '2022-01-26'),
(34, 'Ajay patidar', '0989 301 1345', 'ajay12@gmail.com', 'ajay', 'reporter', '', 5, 22, '', 0, 1, '2022-01-26'),
(35, 'aalu', '9846584156', 'aalu@gmail.com', 'aalu', 'reporter', '', 4, 15, '', 0, 1, '2022-01-26'),
(36, 'Ravi kumar', '986536', 'ravi@gmail.com', 'ravi', 'reporter', '', 4, 22, '', 0, 0, '2022-01-27'),
(37, 'kittu', '86953', 'kittu@gmail.com', 'kittu', 'reporter', '', 10, 17, '', 0, 0, '2022-02-06'),
(38, 'ranjith', '9398212095', 'r@gmail.com', 'r', 'admin', 'img/pa.jpg', 1, 1, 'hyderabad', 1, 0, '2023-04-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cmt_id`);

--
-- Indexes for table `likednews`
--
ALTER TABLE `likednews`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `news_detail`
--
ALTER TABLE `news_detail`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`noti_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `todo_data`
--
ALTER TABLE `todo_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `likednews`
--
ALTER TABLE `likednews`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `news_detail`
--
ALTER TABLE `news_detail`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `noti_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todo_data`
--
ALTER TABLE `todo_data`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
