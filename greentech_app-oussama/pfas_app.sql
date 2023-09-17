-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 27 août 2023 à 15:40
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pfas_app`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
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
(25, 'Can add article', 7, 'add_article'),
(26, 'Can change article', 7, 'change_article'),
(27, 'Can delete article', 7, 'delete_article'),
(28, 'Can view article', 7, 'view_article'),
(29, 'Can add products', 8, 'add_products'),
(30, 'Can change products', 8, 'change_products'),
(31, 'Can delete products', 8, 'delete_products'),
(32, 'Can view products', 8, 'view_products'),
(33, 'Can add t_ user', 9, 'add_t_user'),
(34, 'Can change t_ user', 9, 'change_t_user'),
(35, 'Can delete t_ user', 9, 'delete_t_user'),
(36, 'Can view t_ user', 9, 'view_t_user'),
(37, 'Can add favorites', 10, 'add_favorites'),
(38, 'Can change favorites', 10, 'change_favorites'),
(39, 'Can delete favorites', 10, 'delete_favorites'),
(40, 'Can view favorites', 10, 'view_favorites');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
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

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
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

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'login', 't_user'),
(7, 'projet', 'article'),
(10, 'projet', 'favorites'),
(8, 'projet', 'products'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'App', '0001_initial', '2023-07-05 18:34:58.914082'),
(2, 'contenttypes', '0001_initial', '2023-07-08 21:10:32.395627'),
(3, 'auth', '0001_initial', '2023-07-08 21:10:32.801497'),
(4, 'admin', '0001_initial', '2023-07-08 21:10:32.893733'),
(5, 'admin', '0002_logentry_remove_auto_add', '2023-07-08 21:10:32.900020'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-08 21:10:32.909551'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-07-08 21:10:32.956684'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-07-08 21:10:33.003022'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-07-08 21:10:33.018350'),
(10, 'auth', '0004_alter_user_username_opts', '2023-07-08 21:10:33.029474'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-07-08 21:10:33.065326'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-07-08 21:10:33.071312'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-07-08 21:10:33.085014'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-07-08 21:10:33.100468'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-07-08 21:10:33.117378'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-07-08 21:10:33.133977'),
(17, 'auth', '0011_update_proxy_permissions', '2023-07-08 21:10:33.146491'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-07-08 21:10:33.166995'),
(19, 'login', '0001_initial', '2023-07-08 21:10:33.185738'),
(20, 'projet', '0001_initial', '2023-07-08 21:10:33.206106'),
(21, 'projet', '0002_product', '2023-07-08 21:10:33.227740'),
(22, 'projet', '0003_auto_20230707_1408', '2023-07-08 21:10:33.255070'),
(23, 'sessions', '0001_initial', '2023-07-08 21:10:33.286397'),
(24, 'projet', '0004_favorites', '2023-08-18 14:43:39.122044'),
(25, 'projet', '0005_alter_products_descriptions_and_more', '2023-08-18 14:43:39.189501');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `login_t_user`
--

CREATE TABLE `login_t_user` (
  `U_Id` int(11) NOT NULL,
  `U_FirstName` varchar(150) NOT NULL,
  `U_LastName` varchar(150) NOT NULL,
  `U_Email` varchar(254) NOT NULL,
  `U_Pwd` varchar(150) NOT NULL,
  `U_Admin` tinyint(1) NOT NULL,
  `U_Client` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `login_t_user`
--

INSERT INTO `login_t_user` (`U_Id`, `U_FirstName`, `U_LastName`, `U_Email`, `U_Pwd`, `U_Admin`, `U_Client`) VALUES
(1, 'eya', 'jery', 'eya@gmail.com', 'pbkdf2_sha256$600000$zV5bWeRZFsVMuGou7DZjnb$BgHJ5ySvCrG65AbOYzcfPcqrKfMKfVRPZ7HezjWvbLc=', 1, 0),
(2, 'ines', 'jemmali', 'ines@gmail.com', 'pbkdf2_sha256$600000$zV5bWeRZFsVMuGou7DZjnb$BgHJ5ySvCrG65AbOYzcfPcqrKfMKfVRPZ7HezjWvbLc=', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `projet_article`
--

CREATE TABLE `projet_article` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `projet_favorites`
--

CREATE TABLE `projet_favorites` (
  `id` bigint(20) NOT NULL,
  `product_id` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `projet_products`
--

CREATE TABLE `projet_products` (
  `id` int(11) NOT NULL,
  `images` varchar(159) DEFAULT NULL,
  `names` varchar(78) DEFAULT NULL,
  `descriptions` varchar(2000) NOT NULL,
  `ingredients` varchar(2000) NOT NULL,
  `brand` varchar(8) DEFAULT NULL,
  `prices` varchar(6) DEFAULT NULL,
  `Type` varchar(19) DEFAULT NULL,
  `Link` varchar(163) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `projet_products`
--

INSERT INTO `projet_products` (`id`, `images`, `names`, `descriptions`, `ingredients`, `brand`, `prices`, `Type`, `Link`) VALUES
(1, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_SEA_FOAM_FACE_WASH_LITTLE_MERMAID_1200x.jpg?v=1680881457', 'DISNEY\'S THE LITTLE MERMAID Sea Foam Complete Face Wash by Pacifica', 'Good for: All skin types Skin situation: Daily dirt & buildup Feels like: Gel-to-creamy foam lather Smells like: Sunkissed creamy coconut Makes skin look: Hydrated & supple Makes skin feel: Soft & smooth Limited-edition Disney\'s The Little Mermaid design Formulated with plant-based surfactants for an ultra-rich lather Gentle enough for daily use Removes dirt, makeup, impurities, and excess oil to support the skin’s natural moisture barriers Formulated without parabens, phthalates, mineral oil, silicones, or talc Made in the USA Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'aqua (eau), cocamidopropyl betaine,sodium cocoyl glutamate, sodium coco sulfoacetate, sodium cocoamphoacetate, decyl glucoside, aloe barbadensis leaf juice, glycerin, magnesium ascorbyl phosphate, glycol stearate, carica papaya (papaya) fruit extract, citrus limon (lemon) peel extract, cocos nucifera (coconut) oil, cocos nucifera (coconut) fruit water, citric acid, tocopheryl acetate (vitamin E), panthenol (vitamin B5), sodium PCA, allantoin, porphyra umbilicalis (nori) extract, garcinia mangostana (mangosteen) peel extract,camellia sinensis (white tea) leaf extract, algae extract, sodium benzoate, potassium sorbate, ethylhexylglycerin, parfum*. *our scent blend with natural and/or essential oils.', 'Pacifica', '$10,00', 'Face wash', 'https://www.pacificabeauty.com/collections/skincare/products/disney-the-little-mermaid-sea-foam-complete-face-wash-by-pacifica?_pos=5&_fid=8e4cd9248&_ss=c'),
(2, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_SEA_AND_C_LOVE_LITTLE_MERMAID_1200x.jpg?v=1680881471', 'DISNEY\'S THE LITTLE MERMAID Sea & C Love Vitamin Serum by Pacifica', 'Good for: All skin types Skin situation: Dullness, dryness, fine lines Feels like: Lightweight serum Smells like: Beachy banana Makes skin look: Plump & dewy Makes skin feel: Nourished Limited-edition Disney\'s The Little Mermaid design Instantly revitalizes dehydrated, dry skin Non-sticky, works well under makeup Help fight the effects of blue light and aid in a brighter, healthier appearance Formulated without parabens, phthalates, mineral oil, silicones or talc Made in the USA Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'aqua (eau), glycerin, 3-o-ethyl ascorbic acid (vitamin C), aloe barbadensis leaf juice, laminaria digitata (sea kelp) extract, camellia sinensis (green tea) extract, saccharomyces/xylinum/ black tea ferment, curcuma longa (turmeric) root extract, hyaluronic acid, spirulina maxima powder, hydrolyzed gardenia florida extract, vaccinium macrocarpon (cranberry) fruit extract, hydroxyethylcellulose, sodium riboflavin phosphate, phenoxyethanol, ethylhexylglycerin, maltodextrin, parfum (natural). ', 'Pacifica', '$18,00', 'Face Serum', 'https://www.pacificabeauty.com/collections/skincare/products/disney-the-little-mermaid-sea-c-love-vitamin-serum-by-pacifica?_pos=6&_fid=8e4cd9248&_ss=c'),
(3, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_DISNEY_REUSABLE_BROW_MASK_BOX_1200x.jpg?v=1680881460', 'DISNEY\'S THE LITTLE MERMAID Reusable Brow Mask by Pacifica', 'Good for: All skin types Skin situation: Fine lines Feels like: Smooth jelly that molds to your skin Smells like: Fragrance-free Makes skin look: Tighter Makes skin feel: Smoother Limited-edition Disney\'s The Little Mermaid design Customizable with your favorite moisturizer or serum 100% silicone masks create a vacuum-like seal between your favorite serum and your skin, helping to “seal” in the ingredients and boost hydration Perfectly sticky texture also allows you to gently lift and flatten skin, helping to minimize the appearance of fine lines and wrinkles Easy to wash, store and reuse over and over – with proper care, these masks should last several uses Comes with breathable tin for easy storage Formulated without parabens, phthalates, mineral oil, talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', '100% high-grade silicone', 'Pacifica', '$15,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/disney-the-little-mermaid-reusable-brow-mask-by-pacifica?_pos=7&_fid=8e4cd9248&_ss=c'),
(4, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_SET_AND_PROTECT_SETTING_MIST_LITTLE_MERMAID_1200x.jpg?v=1680881465', 'DISNEY\'S THE LITTLE MERMAID Set & Protect Matte Sheer Setting Mist by Pacifica', 'Good for:  All skin types Skin situation: Shine/oiliness, dryness Feels like: Weightless mist Smells like: Light citrus Makes skin look: Smooth Makes skin feel: Hydrated & protected Limited-edition Disney\'s The Little Mermaid design Broad spectrum SPF 45 UVA/UVB Can be applied throughout the day on top of your makeup Helps keep the skin hydrated and nourished Formulated without parabens, phthalates, mineral oil, silicones or talc Free of oxybenzone, octinoxate and PABA Made in the USA Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'Active ingredients: Avobenzone 2.9% Sunscreen, Homosalate 9.8% Sunscreen, Octisalate 4.9% Sunscreen, Octocrylene 9.5% Sunscreen. \nInactive ingredients: Alcohol Denat., Butyloctyl Salicylate, Diheptyl Succinate, Silica Silylate, Coconut Alkanes, Parfum (Natural), Tetrahexyldecyl Ascorbate (Vitamin C), Algae Extract, Ascophyllum Nodosum (Seaweed) Extract, Laminaria Digitata (Algae) Extract, Aqua, Helianthus Annuus (Sunflower) Seed Oil, Hydrolyzed Jojoba Esters, Glycerin, Bisabolol, Capryloyl Glycerin/Sebacic Acid Copolymer, Coco-Caprylate/Caprate, Ethyl Ferulate. ', 'Pacifica', '$16,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/disney-the-little-mermaid-set-protect-matte-sheer-setting-mist-by-pacifica?_pos=8&_fid=8e4cd9248&_ss=c'),
(5, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_REUSABLE_EYE_MASK_DISNEY_BOX_1200x.jpg?v=1680881467', 'DISNEY\'S THE LITTLE MERMAID Reusable Undereye Masks by Pacifica', 'Good for: All skin types Skin situation: Fine lines Feels like: Smooth jelly that molds to your skin Smells like: Fragrance-free Makes skin look: Tighter Makes skin feel: Smoother Limited-edition Disney\'s The Little Mermaid Design Customizable with your favorite moisturizer or serum 100% silicone masks create a vacuum-like seal between your favorite serum and your skin, helping to “seal” in the ingredients and boost hydration Perfectly sticky texture also allow you to gently lift and flatten skin, helping to minimize the appearance of fine lines and wrinkles Easy to wash, store and reuse over and over – with proper care, these masks should last several uses Comes with breathable tin for easy storage Formulated without parabens, phthalates, mineral oil, or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', '100% high-grade silicone', 'Pacifica', '$15,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/disney-the-little-mermaid-reusable-undereye-masks-by-pacifica?_pos=9&_fid=8e4cd9248&_ss=c'),
(6, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_WAKE_UP_BEAUTIFUL_WATERLESS_CLEANSING_BALM_BOTH_1200x.jpg?v=1670599826', 'WAKE UP BEAUTIFUL Waterless Cleansing Balm', 'Good for: All skin types Skin situation: Dull, dry, fine lines Feels like: Balm to light milky suds Smells like: Creamy Rose Makes skin look: Restored & radiant Makes skin feel: Clean without any tightness Daily morning and evening cleanser that helps eliminate dryness or dehydration No oily residue Removes makeup & dirt Great for dry or sensitive skin Formulated without parabens, phthalates, mineral oil, silicones or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you.', 'helianthus annuus (sunflower) seed oil, behenyl alcohol, caprylic/capric triglyceride, oryza sativa (rice) bran wax, polyglyceryl-2 caprate, moringa oleifera seed oil, glyceryl stearate, polyhydroxystearic acid, tribehenin, tremella fuciformis sporocarp extract (mushroom), lauryl glucoside, polyglyceryl2 sesquioleate, silica, glyceryl behenate, rosa canina fruit oil, chenopodium quinoa seed oil, glycerin, limnanthes alba (meadowfoam) seed oil, sodium hyaluronate, rosa centifolia flower extract, parfum (natural/naturelle).', 'Pacifica', '$18,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/wake-up-beautiful-waterless-cleansing-balm?_pos=10&_fid=8e4cd9248&_ss=c'),
(7, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_COLLAGEN_EVERYDAY_LOTION_PINK_1200x.jpg?v=1661959820', 'VEGAN COLLAGEN Every Day Lotion SPF 30', 'For all and aging skin types A lightweight, daily moisturizer with broad spectrum SPF 30 protection to hydrate and protect skin Smells like subtle white floral notes Formulated without parabens, silicones, retinyl palmitate or phthalates Made in the USA with the best globally sourced ingredients', 'Active Ingredients: avobenzone 3% • homosalate • 15% • octocrylene 10% • octyl salicylate 5%\nInactive Ingredients: aqua, butyloctyl salicylate, coconut alkanes, coco-caprylate/caprate, aloe barbadensis leaf juice, glycerin, hydrolyzed jojoba esters, glyceryl stearate, glyceryl stearate citrate, sodium stearoyl glutamate, polyglyceryl-4 isostearate, stearic acid, lysolecithin, sclerotium gum, xanthan gum, pullulan, hydrogenated castor oil, sr-hydrozoan polypeptide-1 (vegan collagen), sodium hyaluronate, citrus aurantium dulcis (orange) flower extract, jasminum officinale (jasmine) extract, chamomilla recutita (matricaria) flower extract, arnica montana extract, squalane, oryza sativa (rice) starch, biosaccharide gum-1, phenoxyethanol, ethylhexylglycerin, parfum*. *our scent blend with natural and/or essential oils', 'Pacifica', '$20,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-collagen-spf30-every-day-lotion?_pos=11&_fid=8e4cd9248&_ss=c'),
(8, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_GLOW_BABY_HYDRODEW_MOISTURE_GEL_BOTH_1200x.jpg?v=1670513473', 'GLOW BABY Hydrodew Moisture Gel', 'Good for:  All skin types Skin situation: Fine Lines, Dryness, and Dullness Feels like: Silky, non-sticky gel cream Smells like: Pure sunshine & citrus vanilla Makes skin look: Bright & juicy Makes skin feel: Moisturized & bouncy A vitamin C boost for the skin! Made to brighten the radiance of all skin types Helps improve makeup application, creating a smooth, hydrated canvas Formulated without parabens, phthalates, mineral oil, silicones or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'aqua (eau), glycerin, beta-glucan, algin, xanthan gum, hydrolyzed jojoba esters, cetearyl olivate, sorbitan olivate, coconut alkanes, coco-caprylate/caprate, diheptyl succinate, capryloyl glycerin, sebacic acid copolymer, biosaccharide gum-1, 1, 2-hexanediol, arginine, aloe barbadensis leaf juice, tetrahexyldecyl ascorbate, vitis vinifera (grape) juice, cucurbita pepo (pumpkin) sodium stearoyl glutamateseed oil, bisabolol, tocopherol (vitamin E), boswellia serrata resin extract, terminalia ferdinandiana fruit extract, ascorbic acid, niacinamide, ethylhexylglycerin, hydroxyethylcellulose, gluconolactone, sodium benzoate, parfum (natural/naturelle).  ', 'Pacifica', '$18,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-hydrodew-moisture-gel?_pos=12&_fid=8e4cd9248&_ss=c'),
(9, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_GLOW_BABY_SERUM_BOTTLE_1200x.jpg?v=1667921408', 'GLOW BABY Booster Serum', 'For all skin types Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, glycerin, glycolic acid, terminalia ferdinandiana (kakadu plum) fruit extract, sodium ascorbyl phosphate (vitamin C), silica, phenoxyethanol, ethylhexylglycerin, parfum (natural).', 'Pacifica', '$18,00', 'Face Serum', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-booster-serum?_pos=13&_fid=8e4cd9248&_ss=c'),
(10, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_KALE_YEAH_REDNESS_REHAB_SERUM_1200x.jpg?v=1670599832', 'KALE YEAH! Redness Rehab Serum', 'Good for: Combination and oily-prone skin types Skin situation: Dryness, Redness, and Loss of Firmness and Elasticity Feels like: Soothing serum Smells like: Clean greens Makes skin look: Calm & happy Makes skin feel: Less oily while still hydrated Hydrates combination skin Designed to minimize the appearance of redness Helps mattify oily skin and address excess oil Formulated without parabens, phthalates, mineral oil, silicones or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'aqua (eau), glycerin, aloe barbadensis leaf juice, sorbitanoleate decylglucoside crosspolymer, niacinamide, sclerotium gum, algin, hydrolyzed pea protein, malus domestica fruit cell culture extract, panthenol (vitamin B), xanthan gum, sodium benzoate, titanium dioxide, mica, bisabolol, allantoin, chlorophyllin copper complex, sodium hyaluronate, brassica oleracea acephala (kale) leaf extract, spinacia oleracea (spinach) leaf extract, parfum (natural/naturelle), ethylhexylglycerin, phenoxyethanol, brassica oleraceaitalica (broccoli) seed oil.', 'Pacifica', '$18,00', 'Face Serum', 'https://www.pacificabeauty.com/collections/skincare/products/kale-yeah-redness-rehab-serum?_pos=14&_fid=8e4cd9248&_ss=c'),
(11, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_COLLAGEN_PLUMPING_JELLY_MASK_1200x.jpg?v=1670081468', 'VEGAN COLLAGEN Plumping Jelly Mask', 'Good for:  All skin types Skin situation: Tired skin, dull, dry, fine lines Feels like: The cool side of the pillow Smells like:  White jasmine Makes skin look: Glazed Makes skin feel: Like a soft, plump cloud Can be used as a moisturizer or an overnight treatment Light jelly that doesn’t feel greasy or heavy Plumps the look of skin, adding moisture Lighter alternative to skin slugging in the evening to help seal in other products Formulated without parabens, phthalates, mineral oil, silicones or talc. Always 100% vegan & cruelty-free made with compassion for the planet, animals & you.', 'aqua (eau), glycerin, helianthus annuus (sunflower) seed oil, isopropyl myristate, hydroxypropyl starch phosphate, glyceryl stearate, cetyl alcohol, stearic acid, glyceryl laurate, sr-hydrozoan polypeptide-1 (vegan collagen), glyceryl stearate citrate, tocopheryl acetate, squalane (vegan), parfum (natural/naturelle), allantoin, panthenol (vitamin B), ethylhexylglycerin, lycium barbarum fruit extract, hyaluronic acid, phenoxyethanol, chamomilla recutita (matricaria) flower extract, jasminum ocinale (jasmine) extract, hibiscus sabdaria flower extract, citrus aurantium amara flower oil.  ', 'Pacifica', '$25,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-collagen-plumping-jelly-mask?_pos=15&_fid=8e4cd9248&_ss=c'),
(12, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_COLLAGEN_HYDRATE_PLUMP_FACIAL_MASK_1200x.jpg?v=1670340622', 'VEGAN COLLAGEN Hydrate & Plump Facial Mask', 'Good For: All skin types Skin situation: Dull, dry, fine lines Feels like: Cooling, soothing nourishment Smells like: White jasmine Makes skin look: Post-facial plumped up Makes skin feel: Soft and moisturized Helps to visibly plump & moisturize At-home treatment with immediate results Perfect plumping moisture boost before makeup Formulated without parabens, phthalates, mineral oil, silicones or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'aqua (eau), glycerin, phenoxyethanol, betaine, polyglyceryl-10 laurate, xanthan gum, ethylhexylglycerin, sr-hydrozoan polypeptide 1 (vegan collagen), citric acid, sodium benzoate, sodium hyaluronate, cucumis sativus (cucumber) fruit extract, aloe barbadensis leaf juice, albizia julibrissin bark extract, chamomilla recutita (matricaria) flower extract, laminaria japonica extract, macrocystis pyrifera (kelp) extract, sodium citrate.  ', 'Pacifica', '$5,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-collagen-hydrate-plump-facial-mask?_pos=16&_fid=8e4cd9248&_ss=c'),
(13, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_LOVE_ZIT_ANYTIME_PATCHES_BOX_1200x.jpg?v=1670599843', 'LOVE\'ZIT Anytime Patches', 'Good for: All skin types, especially oily-combination Skin situation: Surfaced acne and whiteheads Feels like: Ultra-thin patch that molds comfortably to face with heat of skin Smells like: Fragrance-free Makes skin look: Clarified Makes skin feel: Soothed and calm Non-drying formula, helps seal in the good, absorbs the bad Protects blemishes from external bacteria Helps minimize scarring by reducing face-picking Formulated without parabens, phthalates, mineral oil, silicones or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'hydrocolloid, niacinamide, salicylic acid, melaleuca alternifolia (tea tree) leaf oil.', 'Pacifica', '$15,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/love-zit-anytime-patches?_pos=17&_fid=8e4cd9248&_ss=c'),
(14, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_KALE_DISSOLVE_DARK_SPOT_MICROPATCHES_1200x.jpg?v=1670599837', 'KALE DISSOLVE Dark Spot Micropatches', 'Good for: All skin types, especially oily-combination Skin situation: Dark Spots, Uneven Texture, and Acne and Blemishes Feels like: Stiff patch that molds comfortably to face with heat of skin Smells like: Fragrance-free Makes skin look: Clearer & brighter Makes skin feel: Like you’re not wearing anything at all Self-dissolving micro-cones Help to visibly fade the appearance of post-zit damage Semi-sheer and discreet, suitable for all skin types Formulated without parabens, phthalates, mineral oil, silicones or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'sodium hyaluronate, cellulose gum, glycerin, trehalose (vegan), niacinamide, 6 propanediol, 1,2-hexanediol, tranexamic acid, caprylyl glycol, glycolic acid, brassica oleracea acephala leaf extract (kale), ethylhexylglycerin, beta-glucan, ascorbic acid.', 'Pacifica', '$15,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/kale-dissolve-dark-spot-micropatches?_pos=19&_fid=8e4cd9248&_ss=c'),
(15, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_KALE_DETOX_PORE_STRIPS_1200x.jpg?v=1670599840', 'KALE DETOX Pore Strips', 'Good for: All skin types, especially oily-combination Skin situation: Pores, oiliness, blackheads Feels like: A comfortable bandage Smells like: Fragrance-free Makes skin look: Clearer & tighter Makes skin feel: Comfortably clean Helps unclogs & balance skin Contoured shape hugs the nose Gentle on skin and natural moisture barrier Formulated without parabens, phthalates, mineral oil, silicones or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'aqua (eau), glycerin, titanium dioxide (CI77891), lithium magnesium sodium silicate, pentylene glycol, butylene glycol, pinus, sylvestris leaf extract/illicium verum (anise) fruit extract, phenoxyethanol, melaleuca alternifolia (tea tree) leaf oil, calendula officinalis flower extract, hamamelis virginiana (witch hazel) leaf extract, niacinamide, brassica oleracea acephala leaf extract.', 'Pacifica', '$9,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/kale-detox-pore-strips?_pos=20&_fid=8e4cd9248&_ss=c'),
(16, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_GLOW_BABY_SUPER_LIT_ENZYME_SCRUB_1200x.jpg?v=1670513470', 'GLOW BABY Super Lit Enzyme Scrub', 'Good for: All skin types Skin situation: Dullness, uneven texture, clogged pores Feels like: Lightweight gel Smells like: Citrus & vanilla Makes skin look: Bright & clean Makes skin feel: Soft & smooth Exfoliates & brightens Designed to remove dead skin buildup Helps to create a smooth canvas before applying makeup Gentle enough for acne-prone skin Formulated without parabens, phthalates, mineral oil, silicones or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'aqua (eau), aloe barbadensis leaf juice, caprylic/capric triglyceride, glycerin, glyceryl stearate, cetyl alcohol, stearyl alcohol, sodium cocoyl isethionate, helianthus annuus (sunflower) seed oil, hydroxypropyl starch phosphate, hydrogenated jojoba esters, perlite, oryza sativa (rice) starch, parfum (natural/naturelle), ethylhexylglycerin, terminalia ferdinandiana fruit extract, ascorbic acid, lactic acid, glycolic acid, papain, bromelain, maltodextrin, tocopherol, malic acid, vanilla planifolia fruit extract, phenoxyethanol, iron oxides(red), galactoarabinan, sodium riboflavin phosphate.', 'Pacifica', '$14,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-super-lit-enzyme-scrub?_pos=21&_fid=8e4cd9248&_ss=c'),
(17, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_GLOW_BABY_SUPER_LIT_SPF_LOTION_1200x.jpg?v=1670513476', 'GLOW BABY Super Lit SPF Lotion', 'Good for: All skin types Skin situation: Dull, dry, fine lines Feels like: Lightweight burst of delicious hydration Smells like: Freshly juiced oranges Makes skin look: Bright & clean Makes skin feel: Moisturized, protected and like you\'re not wearing anything Helps simplify your routine, not your skincare Shields skin from harmful UVA/UVB rays Makeup-gripping finish, but also brings out your best skin on no-makeup days Blends quickly and seamlessly with no to minimal visible white cast Formulated without parabens, phthalates, mineral oil, silicones or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'Inactive ingredients: Aqua (Eau), Allantoin, Ascorbic Acid, Bisabolol, Bismuth Oxychloride, Butyloctyl Salicylate, Caffeine, Caprylhydroxamic acid, Caprylic/ Capric Triglyceride, Citric Acid, Glycerin, Glyceryl Caprylate, Glyceryl Stearate, Iron Oxides (CI 77491, CI 77492, CI 77499), Jojoba Esters, Malus Domestica Fruit Cell Culture Extract, Mica, Parfum*, Polyglyceryl-6 Distearate, Polyglyceryl-6 Polyricinoleate, Polyhydroxystearic Acid, Silica, Simmondsia Chinensis (Jojoba) Seed Oil, Simmondsia Chinensis (Jojoba) Seed Oil (and) Sodium Benzoate, Sodium Stearoyl Glutamate, Sorbitan Sesquioleate, Terminalia Ferdinandiana Fruit Extract, Titanium Dioxide, Tocopherol (Vitamin E), Tocopheryl Acetate, Xanthan Gum', 'Pacifica', '$20,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-glow-baby-super-lit-spf-lotion?_pos=22&_fid=8e4cd9248&_ss=c'),
(18, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_COLLAGEN_BODY_MILK_SPRAY_1200x.jpg?v=1676052964', 'VEGAN COLLAGEN Body Milk Spray', 'Smells like: Jasmine with a hint of warm vanilla Feels like: Light, milky caring hydration Fast-absorbing non-aerosol hydrating mist Infused with vegan collagen & floral extracts for instant hydration Suitable for all skin types Formulated without parabens, phthalates, SLS, mineral oil or talc 100% vegan & cruelty-free', 'aqua (eau), caprylic/capric triglyceride, glycerin, cetearyl alcohol, glyceryl stearate, persea gratissima (avocado) oil, sodium hyaluronate, sr-hydrozoan\npolypeptide-1 (vegan collagen), citrus aurantium dulcis (orange) fruit water, calendula ocinalis flower extract, aloe barbadensis leaf juice, coco-glucoside, xanthan gum, sodium gluconate, caprylhydroxamic acid, sodium benzoate, caprylyl glycol, benzyl alcohol*, amyl cinnamal linalool, parfum (natural/naturelle).', 'Pacifica', '$14,00', NULL, 'https://www.pacificabeauty.com/collections/skincare/products/vegan-collagen-body-milk-spray?_pos=23&_fid=8e4cd9248&_ss=c'),
(19, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_GLOW_BABY_BRIGHTENING_FACIAL_MASK_1200x.jpg?v=1670513481', 'GLOW BABY Brightening Facial Mask', 'Good for: All skin types Skin situation: Dullness, fine lines, dark spots, dryness Feels like: Cool, refreshing, delicious hydration Smells like: Sunny citrus vanilla Makes skin look: Energized Makes skin feel: Nourished & Rejuvenated More hydrated, softer-feeling skin Infused with vitamin C and antioxidants Formulated without parabens, phthalates, mineral oil, silicones or talc Always 100% vegan & cruelty-free made with compassion for the planet, animals & you', 'aqua (eau), aloe barbadensis leaf extract, glycerin, cucumis sativus (cucumber) fruit extract, albizia julibrissin bark extract, chamomilla recutita (matricaria) flower extract, ethylhexylglycerin, laminaria japonica extract, macrocystis pyrifera (kelp) extract, aloe barbadensis leaf juice, xathan gum, betaine, phenoxyethanol, sodium ascorbyl phosphate, polyglyceryl-10 laurate, citric acid, parfum (natural/naturelle), sodium hyaluronate, sodium citrate.', 'Pacifica', '$4,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-brightening-facial-mask?_pos=26&_fid=8e4cd9248&_ss=c'),
(20, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_COLLAGEN_SERUM_1200x.jpg?v=1617217041', 'VEGAN COLLAGEN Complex Serum', 'For all and aging skin types A boost of hydration for a dewy, refreshed look Smells like subtle white floral notes Formulated without parabens, phthalates, SLS or mineral oil Made in the USA with the best globally sourced ingredients', '', 'Pacifica', '$22,00', 'Face Serum', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-collagen-complex-serum?_pos=28&_fid=8e4cd9248&_ss=c'),
(21, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_COLLAGEN_RECOVERY_EYE_CREAM_1200x.jpg?v=1617217098', 'VEGAN COLLAGEN Recovery Eye Cream', 'For all and aging skin types Ultra-hydrating eye cream for the delicate around eyes Smells like subtle white floral notes Formulated without parabens, phthalates, SLS or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, cetearyl olivate, caprylic/capric triglyceride, cetearyl alcohol, glycerin, sorbitan olivate, glyceryl caprylate, glyceryl stearate SE, sr-hydrozoan polypeptide-1 (vegan collagen), chamomilla recutita (matricaria) flower extract, calendula officinalis flower extract, citrus aurantium dulcis (orange) flower extract, rosmarinus officinalis (rosemary) leaf extract, hydrolyzed brassica napus seedcake extract, jasminum officinale (jasmine) flower extract, arnica montana flower extract, leuconostoc/radish root ferment filtrate, camellia oleifera seed oil, hydrolyzed jojoba esters, caffeine, allantoin, panthenol, sodium hyaluronate, tocopherol (vitamin E), quartz, opuntia ficus-indica seed oil, arginine, bentonite, coconut alkanes, coco-caprylate/caprate, cetyl esters, stearic acid, cetearyl glucoside, xanthan gum, maltodextrin, glucose, phenoxyethanol, potassium sorbate, sodium benzoate.', 'Pacifica', '$18,00', 'Cream', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-collagen-recovery-eye-cream?_pos=29&_fid=8e4cd9248&_ss=c'),
(22, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_COLLAGEN_OVERNIGHT_CREAM_1200x.jpg?v=1617217012', 'VEGAN COLLAGEN Overnight Recovery Cream', 'Available in full size (1.7 fl oz) or mini (0.7 fl oz) For all and aging skin types Nourishing nighttime moisturizer to help revive and hydrate skin Smells like subtle white floral notes Formulated without parabens, phthalates, SLS or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, helianthus annuus (sunflower) seed oil, glycerin, sr-hydrozoan polypeptide-1 (vegan collagen), cetyl esters, glyceryl stearate, cetyl alcohol, stearyl alcohol, stearic acid, tocopheryl acetate (vitamin E), diheptyl succinate, capryloyl glycerin/sebacic acid copolymer, magnesium ascorbyl phosphate (vitamin C), citrus aurantium dulcis (orange) flower extract, jasminum officinale (jasmine) extract, chamomilla recutita (matricaria) flower extract, arnica montana extract, allantoin, dipotassium glycyrrhizate, xanthan gum, phenoxyethanol, ethylhexylglycerin, parfum*. *our scent blend with natural and/or essential oils', 'Pacifica', '$10,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-collagen-overnight-recovery-cream?_pos=30&_fid=8e4cd9248&_ss=c'),
(23, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_CREAM_CREAMY_GEL_CLEANSER_2023_1200x.jpg?v=1682004600', 'VEGAN CREAM Creamy Gel Cleanser', 'Great for all skin types. Cleansed skin is left feeling replenished and balanced Smells like subtle white floral notes Formulated without parabens, phthalates, SLS or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, sodium lauroyl methyl isethionate, glycerin, glyceryl stearate SE, xanthan gum, sr-hydrozoan polypeptide-1 (vegan collagen), chamomilla recutita (matricaria) flower extract, citrus aurantium dulcis (orange) flower extract, jasminum officinale (jasmine) flower extract, leuconostoc/radish root ferment filtrate, simmondsia chinensis (jojoba) seed oil, sodium hyaluronate, arnica montana flower extract, hydrolyzed jojoba esters, phospholipids, caprylyl/capryl glucoside, glyceryl undecylenate, glyceryl caprylate, trisodium ethylenediamine disuccinate, glucose, propanediol, maltodextrin, sodium benzoate, ethylhexylglycerin, phenoxyethanol, parfum*. *our scent blend with natural and/or essential oils', 'Pacifica', '$15,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-cream-creamy-gel-cleanser?_pos=31&_fid=8e4cd9248&_ss=c'),
(24, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_COLLAGEN_HYDRATING_MILK_TONIC_2023_1200x.jpg?v=1682004602', 'VEGAN COLLAGEN Hydrating Milk Tonic', 'Great for all skin types. Replenishes skin and prepares it for all of the skin-loving beneficials to come Smells like subtle white floral notes Formulated without parabens, phthalates, SLS or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, glyceryl stearate SE, propanediol, sr-hydrozoan polypeptide-1 (vegan collagen), chamomilla recutita (matricaria) flower extract, citrus aurantium dulcis (orange) flower extract, jasminum officinale (jasmine) flower extract, leuconostoc/radish root ferment filtrate, sodium hyaluronate, arnica montana flower extract, hydrolyzed jojoba esters, pullulan, sclerotium gum, xanthan gum, lecithin, silica, glycerin, polysorbate 20, maltodextrin, phenoxyethanol, ethylhexylglycerin, parfum* *our scent blend with natural and/or essential oils', 'Pacifica', '$16,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-collagen-hydrating-milk-tonic?_pos=32&_fid=8e4cd9248&_ss=c'),
(25, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_COLLAGEN_HYDRO_TREATMENT_1200x.jpg?v=1608669245', 'VEGAN COLLAGEN Hydro-Treatment Undereye & Smile Lines', '2 individual single use undereye spot masks Targeted treatment to help address the signs of aging, smile lines, tired skin and dark circles Great for combination, dry & aging skin types Powered by vegan collagen, known for its hydration properties Unscented Bio-degradable Formulated without parabens, phthalates, SLS or mineral oil', 'aqua, glycerin, sr-hydrozoan polypeptide 1 (vegan collagen), cucumis sativus (cucumber) fruit extract, sodium ascorbyl phosphate (vitamin C), sodium hyaluronate, aloe barbadensis leaf juice, albizia julibrissin bark extract, chamomilla recutita (matricaria) flower extract, laminaria japonica extract, macrocystis pyrifera (kelp) extract, betaine, polyglyceryl-10 laurate, xanthan gum, sodium citrate, phenoxyethanol, ethylhexylglycerin. ', 'Pacifica', '$6,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-collagen-hydro-treatment-undereye-smile-lines?_pos=33&_fid=8e4cd9248&_ss=c'),
(26, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_COLLAGEN_COMPLEX_LIP_BALM_1200x.jpg?v=1655411641', 'VEGAN COLLAGEN Complex Lip Balm', 'Plant-powered formula provides long-lasting, nourishing results Feels silky soft, never-sticky Pink shimmer reflective shine Vanilla cupcake scent Formulated without parabens, phthalates, SLS, mineral oil or talc 100% vegan & cruelty-free', 'Polyglyceryl-2 isostearate, dimer dilinoleate, copolymer, helianthus annuus (sunflower) seed oil, dilinoleic acid, propanediol copolymer, simmondsia chinensis (jojoba) seed oil, caprylic/capric triglyceride, silica, euphorbia cerifera (candelilla) wax, candelilla cera, flavor (natural), sucrose tetrastearate triacetate, caesalpinia sappan bark extract, squalane (vegan), tocopheryl acetate (vitamin E) ,SR-hydrozoan polypeptide-1 (vegan collagen), hydrolyzed corn protein, acacia senegal gum, ipomoea batatas root extract, hydrolyzed wheat protein, maltodextrin, hydrolyzed soy protein, citric acid, leuconostoc/radish root. May contain mica/peut contenir: CI 77019, titanium dioxide CI 77891.', 'Pacifica', '$10,00', 'Lip Balm', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-collagen-complex-lip-balm?_pos=34&_fid=8e4cd9248&_ss=c'),
(27, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_GLOW_BABY_BRIGHTENING_FACE_WASH_cc3119f4-35cb-4c26-9bd6-4b953b16690f_1200x.jpg?v=1667921429', 'GLOW BABY Brightening Face Wash', 'Available in full size (5 fl oz) or mini (1.4 fl oz) Brightens skin tone through gentle exfoliation Great for all skin types Formulated without: parabens, phthalates, SLS or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, cocamidopropyl betaine, sodium methyl 2-sulfolaurate, disodium 2-sulfolaurate, glycolic acid, lactic acid (beet source), glycerin, aloe barbadensis leaf juice, magnesium ascorbyl phosphate (vitamin C), malic acid, allantoin, citric acid, sucrose cocoate, potassium sorbate, sodium riboflavin phosphate, phenoxyethanol, vanilla planifolia fruit extract, parfum*', 'Pacifica', '$5,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-brightening-face-wash?_pos=39&_fid=8e4cd9248&_ss=c'),
(28, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30412_EYE_BRIGHT_UNDEREYE_SPOT_SERUM_MASK_1200x.jpg?v=1594066393', 'EYE BRIGHT Undereye Vitamin C Spot Serum Mask', '2 individual single use undereye spot masks Formulated without parabens, phthalates, SLS, or mineral oil', 'aqua, aloe barbadensis leaf juice, glycerin, phenethyl alcohol, xanthan gum, sodium ascorbyl phosphate (vitamin C), albizia julibrissin bark extract, cucumis sativus (cucumber) fruit extract, sodium hyaluronate, chamomilla recutita (matricaria) flower extract, laminaria digitata extract, darutoside, sodium phytate, caprylhydroxamic acid, phenoxyethanol, ethylhexylglycerin, sodium benzoate, parfum (natural).', 'Pacifica', '$5,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/eye-bright-undereye-vitamin-c-spot-serum-mask?_pos=40&_fid=8e4cd9248&_ss=c'),
(29, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_GLOW_BABY_EYE_CREAM_f1ea2eb5-7055-4f71-9ac6-516f7fab57eb_1200x.jpg?v=1667921439', 'GLOW BABY Eye Bright Cream', 'Lightweight brightening eye cream with Vitamin C Helps de-puff and hydrate with caffeine and hyaluronic acid Day or night formula absorbs quickly into skin Formulated without parabens, phthalates, SLS or mineral oil.', 'None', 'Pacifica', '$16,00', 'Cream', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-eye-bright-cream?_pos=42&_fid=8e4cd9248&_ss=c'),
(30, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_GLOW_BABY_LIQUID_EXFOLIATOR_1200x.jpg?v=1644352407', 'GLOW BABY Liquid Exfoliant 5% AHA + BHA', 'Gentle yet powerful, this liquid exfoliator smooths, brightens, and tones skin Glycolic, lactic, and salicylic acids give skin a clean sweep for a baby soft, even, glowing finish Great for all skin types, especially those needing a glow boost This pretty bottle is made from glass. Recycle it again! Formulated without parabens, phthalates, petroleum, SLS or mineral oil 100% Vegan and cruelty-free', 'aqua (eau), aloe barbadensis leaf juice, glycolic acid, lactic acid, gluconolactone, salicylic acid, niacinamide, betaine, hibiscus sabdaria flower extract, terminalia ferdinandiana fruit extract, sodium hyaluronate, caprylic/caprictriglyceride, citrus aurantium dulcis (orange) peel extract, vanilla planifolia fruit extract, citrus tangerina (tangerine) peel extract, dimethyl isosorbide, evodia rutaecarpa fruit extract, propanediol, sorbitan oleate decylglucoside crosspolymer, sodium pca, sodium hydroxide, sodium benzoate.', 'Pacifica', '$16,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-liquid-exfoliant-5-aha-bha?_pos=43&_fid=8e4cd9248&_ss=c'),
(31, 'https://cdn.shopify.com/s/files/1/1515/0462/files/PAC_GLOW_BABY_BRIGHTENING_PEEL_PADS_2023_1200x.jpg?v=1682609578', 'GLOW BABY Brightening Peel Pads 10% AHA + BHA', 'Helps reveals brighter, more glowing skin Deep cleans pores & improves skin tone & texture Fast-acting multi-acid complex Formulated without: parabens, phthalates, SLS or mineral oil', 'aqua, cocamidopropyl betaine, sodium methyl 2-sulfolaurate, disodium 2-sulfolaurate, glycolic acid, lactic acid (beet source), glycerin, aloe barbadensis leaf juice, magnesium ascorbyl phosphate (vitamin C), malic acid, allantoin, citric acid, sucrose cocoate, potassium sorbate, sodium riboflavin phosphate, phenoxyethanol, vanilla planifolia fruit extract, parfum*', 'Pacifica', '$15,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-brightening-peel-pads?_pos=44&_fid=8e4cd9248&_ss=c'),
(32, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_GLOW_BABY_VITAGLOW_FACE_LOTION_BOTH_a2a899f2-fc0d-48fa-aa7e-d2da1f9e3b56_1200x.jpg?v=1667921423', 'GLOW BABY VitaGlow Face Lotion', 'Available in full size (1.7 fl oz) or mini (1 fl oz) Visibly hydrates & brightens skin Helps to firm skin & reduce signs of photoaging Lightweight non-greasy formula Formulated without parabens, phthalates, SLS or mineral oil', 'aqua, aloe barbadensis leaf juice, caprylic/capric triglyceride, helianthus annuus (sunflower) seed oil, glycerin, ascorbic acid (vitamin C), boswellia serrata resin extract, terminalia ferdinandiana (kakadu plum) fruit extract, glyceryl stearate, cetyl alcohol, stearic acid, glyceryl stearate citrate, phenoxyethanol, tocopherol (vitamin E), xanthan gum, bisabolol, ethylhexylglycerin, citrus aurantium dulcis (orange) peel extract, vanilla planifolia fruit extract, citrus tangerina (tangerine) peel extract.', 'Pacifica', '$5,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-vitaglow-face-lotion?_pos=45&_fid=8e4cd9248&_ss=c'),
(33, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_GLOW_BABY_COMPLEX_LIP_BALM_1200x.jpg?v=1655411644', 'GLOW BABY Complex Lip Balm', 'Plant-powered formula provides long-lasting, nourishing results Feels silky soft, never-sticky Coral shimmer glass-like shine Tangerine dreamsicle scent Formulated without mineral oil, lanolin, parabens, phthalates, or talc 100% vegan & cruelty-free', 'Polyglyceryl-2 isostearate, dimer dilinoleate, copolymer, helianthus annuus (sunflower) seed oil, dilinoleic acid, propanediol copolymer, simmondsia chinensis (jojoba) seed oil, caprylic/capric triglyceride, silica, euphorbia cerifera (candelilla) wax, candelilla cera, flavor (natural), sucrose tetrastearate triacetate, caesalpinia sappan bark extract, citral, squalane (vegan), tocopheryl acetate (vitamin E), SR-hydrozoan polypeptide-1 (vegan collagen), hydrolyzed corn protein, acacia senegal gum, ipomoea batatas root extract, hydrolyzed wheat protein, maltodextrin, hydrolyzed soy protein, citric acid, leuconostoc/radish root ferment filtrate, limonene, ascorbic acid, linalool, geraniol, benzyl benzoate, benzyl salicylate, potassium sorbate. May contain/peut contenir: mica CI 77019, titanium dioxide CI 77891.', 'Pacifica', '$10,00', 'Lip Balm', 'https://www.pacificabeauty.com/collections/skincare/products/glow-baby-complex-lip-balm?_pos=46&_fid=8e4cd9248&_ss=c'),
(34, 'https://cdn.shopify.com/s/files/1/1515/0462/files/PAC_30419_GLOWING_MAKEUP_REMOVING_WIPES_2023_1200x.jpg?v=1682609570', 'GLOWING GLYCOLIC ACID, ORANGE & VANILLA Makeup Removing Wipes', 'Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'Aqua, Sodium Cocoyl Hydrolyzed Soy Protein, Oryza Sativa (Rice) Extract, Glycerin, Potassium Sorbate, Aloe Barbadensis Leaf Extract, Rosa Damascena (Rose) Flower Water, Cocos Nucifera (Coconut) Water, Calendula Officinalis (Calendula) Flower Extract, Carica Papaya (Papaya) Fruit Extract, Glycolic Acid, Parfum (Natural), Polysorbate 20, Phenoxyethanol.', 'Pacifica', '$5,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/glowing-glycolic-acid-orange-vanilla-makeup-removing-wipes-1?_pos=47&_fid=8e4cd9248&_ss=c'),
(35, 'https://cdn.shopify.com/s/files/1/1515/0462/products/WAKE_UP_BEAUTIFUL_DREAMY_JELLY_FACE_WASH_1200x.jpg?v=1609972933', 'WAKE UP BEAUTIFUL Dream Jelly Face Wash', 'Sulfate-free cleanser Potent blend of skin-loving ingredients that help cleanse and hydrate all skin types, especially dry and combo skin types Follow with Wake Up Beautiful Overnight Retinoid Cream Formulated without parabens, phthalates, SLS or mineral oil', 'aqua, sodium cocoyl glutamate, disodium cocoyl glutamate, hydroxypropyl starch phosphate, coco-glucoside, glycerin, decyl glucoside, sodium hyaluronate, hydrolyzed quinoa, melatonin, rosa damascena flower oil, rosa canina fruit extract, tremella fuciformis (mushroom) polysaccharide, thioctic acid, hibiscus sabdariffa flower extract, hydrolyzed rice protein, lauryl glucoside, citric acid, sorbitan oleate decylglucoside crosspolymer, ethylhexylglycerin, phenoxyethanol', 'Pacifica', '$12,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/wake-up-beautiful-dream-jelly-face-wash?_pos=49&_fid=8e4cd9248&_ss=c'),
(36, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_WAKE_UP_BEAUTIFUL_EYE_CREAM_1200x.jpg?v=1624643584', 'WAKE UP BEAUTIFUL Retinoid Eye Cream', 'Age-defying eye cream designed to firm & hydrate undereyes Formulated with potent ingredients to address multiple signs of aging like Granactive Retinoid, mushrooms and melatonin Fast-absorbing, non-greasy formula Formulated without parabens, phthalates, SLS or mineral oil', 'aqua, helianthus annuus (sunflower) seed oil, sorbitan stearate, cetearyl alcohol, hydrogenated lecithin, behenyl alcohol, squalane, coconut alkanes, hydroxypinacolone retinoate, ganoderma lucidum (mushroom) extract, melatonin, inonotus obliquus (mushroom) extract, glycerin, rosmarinus oocinalis (rosemary) leaf extract, chamomilla recutita (matricaria) flower extract, ahnfeltiopsis concinna (algae) extract, coco-caprylate/caprate, cetearyl glucoside, glucose, sorbityl laurate, dimethyl isosorbide*, phenoxyethanol, ethylhexylglycerin.', 'Pacifica', '$18,00', 'Cream', 'https://www.pacificabeauty.com/collections/skincare/products/wake-up-beautiful-retinoid-eye-cream?_pos=50&_fid=8e4cd9248&_ss=c'),
(37, 'https://cdn.shopify.com/s/files/1/1515/0462/products/WAKE_UP_BEAUTIFUL_OVERNIGHT_RETINOID_CREAM_1200x.jpg?v=1609965238', 'WAKE UP BEAUTIFUL Overnight Retinoid Cream', 'Powerful combination of Granactive Retinoid, melatonin and mushrooms that works while you sleep to help combat signs of aging Lightweight, super-hydrating formula perfect for sleeping in Formulated without parabens, phthalates, SLS or mineral oil', 'aqua, glyceryl stearate SE, glycerin, helianthus annuus (sunflower) seed oil, coco-caprylate/caprate, cetyl esters, hydroxypinacolone retinoate, inonotus obliquus (mushroom) extract, melatonin, chenopodium quinoa seed oil, rosa damascena flower water, citrus aurantium amara (bitter orange) flower extract, jasminum officinale (jasmine) flower extract, lavandula angustifolia (lavender) flower extract, rose extract, paeonia officinalis flower extract, prunus serrulata flower extract, sambucus nigra flower extract, rosa damascena flower oil, tocopherol (vitamin E), caprylic/capric triglyceride, dimethyl isosorbide*, sclerotium gum, potassium sorbate, sodium benzoate, citric acid, phenoxyethanol, ethylhexylglycerin.', 'Pacifica', '$25,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/wake-up-beautiful-overnight-retinoid-cream?_pos=51&_fid=beb021398&_ss=c'),
(38, 'https://cdn.shopify.com/s/files/1/1515/0462/files/PAC_WAKE_UP_BEAUTIFUL_RETINOID_SERUM_1200x.jpg?v=1682695822', 'WAKE UP BEAUTIFUL Retinoid Serum', 'Recharge your skin while you sleep with this multi-tasking serum Power packed formula helps fight signs of aging while leaving skin moisturized and supple with petroleum-free retinoid, mushrooms, melatonin & quinoa No fragrance added Great for all skin types, especially aging Formulated without parabens, phthalates, petroleum, SLS or mineral oil 100% Vegan and cruelty-free', 'aqua (eau), propanediol, helianthus annuus (sunflower) seed oil, cetearyl olivate, sorbitan olivate, hydroxypinacolone retinoate, rosa centifolia flower extract, calendula officinalis flower extract, chamomilla recutita (matricaria) flower extract, ganoderma lucidum (mushroom) extract, trametes versicolor extract, chenopodium quinoa seed extract, melatonin, oryza sativa (rice) bran extract, helianthus annuus (sunflower) extract, rosmarinus officinalis (rosemary) leaf extract, tocopherol, glycerin, linoleic acid, phytosterols, phospholipids, jojoba esters, caprylic/capric triglyceride, sodium hyaluronate, xanthan gum, acacia senegal gum, sodium gluconate, dimethyl isosorbide, methylheptylglycerin, caprylhydroxamic acid, caprylyl glycol, citric acid.', 'Pacifica', '$18,00', 'Face Serum', 'https://www.pacificabeauty.com/collections/skincare/products/wake-up-beautiful-retinoid-serum?_pos=52&_fid=beb021398&_ss=c'),
(39, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_WAKE_UP_BEAUTIFUL_MASK_2_OZ_1200x.jpg?v=1677252628', 'WAKE UP BEAUTIFUL Super Hydration Sleepover Mask', 'Available in full size (2 fl oz) or mini (1 fl oz) For dry and combination skin types Smells like geranium and rose absolute A creamy mask to help replenish and quench thirsty, stressed, or sun damaged skin Formulated without parabens, phthalates, SLS, or mineral oil', 'aqua, caprylic/capric triglyceride, helianthus annuus (sunflower) oil, glycerin, glyceryl stearate, stearic acid, aloe barbadensis leaf juice, butyrospermum parkii (shea) butter, xanthan gum, persea gratissima (avocado) oil, rosa centifolia flower extract, jasminum officinale (jasmine) flower water, panthenol (vitamin B), allantoin, tocopherol (vitamin E), hydrolyzed rice protein, oryza sativa (rice) bran oil, hyaluronic acid, ganoderma lucidum (mushroom) stem extract, lentinus edodes (mushroom) extract, chenopodium quinoa seed extract, calendula officinalis flower extract, phenoxyethanol, ethylhexylglycerin, chamomilla recutita (matricaria) flower extract, parfum (natural aromatherapy blend).', 'Pacifica', '$16,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/wake-up-beautiful-mask?_pos=53&_fid=beb021398&_ss=c'),
(40, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_WAKE_UP_BEAUTIFUL_MICRONEEDLING_PATCHES_1200x.jpg?v=1609965232', 'WAKE UP BEAUTIFUL Microneedling Patches', 'Concentrated dose of Granactive Retinoid and hyaluronic acid help fight visible signs of aging Micro-needles self-dissolve into skin, helping skin feel hydrated and plumped Formulated without parabens, phthalates, SLS or mineral oil', 'hydrolyzed hyaluronic acid, glycerin, trehalose, sodium hyaluronate, dimethyl isosorbide*, hydroxypinacolone retinoate, madecassoside, adenosine, polyglyceryl-10 laurate.', 'Pacifica', '$15,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/wake-up-beautiful-microneedling-patches?_pos=54&_fid=beb021398&_ss=c'),
(41, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_WAKE_UP_BEAUTIFUL_FACIAL_MASK_1200x.jpg?v=1658590271', 'WAKE UP BEAUTIFUL Facial Mask', 'A supercharged single use sheet mask made of plant fibers Powered by granactive retinoid, melatonin, mushrooms and celery No-rinse, non-sticky formula Aromatherapeutic benefits for relaxation For all skin situations, especially skin that may be showing signs of aging or thirsty, stressed, dehydrated skin Formulated without parabens, phthalates, SLS or mineral oil 100% vegan & cruelty-free', 'aqua (eau), glycerin, apium graveolens (celery) extract, inonotus obliquus (mushroom) extract, sparassis crispa (mushroom) extract, melatonin, fomes officinalis (mushroom) extract, polyglyceryl-10 laurate, xanthan gum, sodium citrate, citric acid, ethylhexylglycerin, hydroxypinacolone retinoate, phenoxyethanol, lavandula angustifolia (lavender) oil, dimethyl isosorbide, linalool. ', 'Pacifica', '$5,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/wake-up-beautiful-sheet-mask?_pos=55&_fid=beb021398&_ss=c');
INSERT INTO `projet_products` (`id`, `images`, `names`, `descriptions`, `ingredients`, `brand`, `prices`, `Type`, `Link`) VALUES
(42, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_WAKE_UP_BEAUTIFUL_COMPLEX_LIP_BALM_1200x.jpg?v=1655411643', 'WAKE UP BEAUTIFUL Complex Lip Balm', 'Plant-powered formula provides long-lasting, nourishing results Feels silky soft without being sticky Transparent glass-like, reflective shine Lavender lemon scent Formulated without mineral oil, lanolin, parabens, phthalates, or talc 100% vegan & cruelty-free', 'Polyglyceryl-2 isostearate, dimer dilinoleate, copolymer, helianthus annuus (sunflower) seed oil, dilinoleic acid, propanediol copolymer, simmondsia chinensis (jojoba) seed oil, caprylic/capric triglyceride, silica, euphorbia cerifera (candelilla) wax, candelilla cera, flavor (natural), squalane (vegan), sucrose tetrastearate triacetate, tocopheryl acetate (vitamin E), SR-hydrozoan polypeptide-1 (vegan collagen), hydrolyzed corn protein, hydrolyzed wheat protein, hydrolyzed soy protein, quinoa extract, leuconostoc/radish root ferment filtrate, potassium sorbate. May contain/peut contenir: mica CI 7701.', 'Pacifica', '$10,00', 'Lip Balm', 'https://www.pacificabeauty.com/collections/skincare/products/wake-up-beautiful-complex-lip-balm?_pos=58&_fid=beb021398&_ss=c'),
(43, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_CERAMIDE_FACE_WASH-SEAL_1200x.jpg?v=1629405234', 'VEGAN CERAMIDE Extra Gentle Face Wash', 'Available in full size (5 fl oz) and mini (1.4 fl oz) Made for sensitive skin Dermatologist & allergy tested Fragrance-free formula Formulated with vegan ceramides to support & replenish your skin barrier Sulfate-free light foaming cleanser Gently & effectively cleanses skin while supporting skin\'s barrier Marshmallow root extract & calendula help soothe Formulated without parabens, phthalates, SLS or mineral oil', 'Aqua, sodium cocoyl glutamate, disodium cocoyl glutamate, hydroxypropyl starch phosphate, coco-glucoside, glycol distearate, glycerin, ceramide NP, ceramide AP, ceramide EOP, phytosphingosine, cholesterol*, sodium lauroyl lactylate, xanthan gum, althaea ocinalis (marshmallow) leaf/root extract, calendula ocinalis flower extract, arginine, serine, threonine, decyl glucoside, phenoxyethanol, ethylhexylglycerin.', 'Pacifica', '$10,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-ceramide-extra-gentle-face-wash?_pos=59&_fid=beb021398&_ss=c'),
(44, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_CERAMIDE_BARRIER_CREAM-SEAL_1200x.jpg?v=1629405232', 'VEGAN CERAMIDE Barrier Face Cream', 'Made for sensitive skin Dermatologist & allergy tested Fragrance-free formula Formulated with vegan ceramides to support & replenish your skin barrier Vegan ceramides, amino acids and shea butter hydrate skin Oat kernel flour & calendula help soothe Niacinamide helps balance oil Formulated without parabens, phthalates, SLS or mineral oil', 'Aqua, stearyl alcohol, caprylic/capric triglyceride, butyrospermum parkii (shea) butter, glycerin, cetearyl alcohol, glyceryl caprylate, cetyl alcohol, ceramide NP*, ceramide AP*, ceramide EOP*, phytosphingosine, cholesterol*, calendula ocinalis flower extract, niacinamide, avena sativa (oat) kernel flour, palmitoyl hexapeptide-19, althaea ocinalis (marshmallow) leaf/root extract, sodium PCA, sodium lactate*, arginine, aspartic acid, PCA, glycine, alanine, serine, valine, proline, threonine, isoleucine, histidine, phenylalanine, glyceryl stearate citrate, sodium lauroyl lactylate, xanthan gum, phenoxyethanol, ethylhexylglycerin', 'Pacifica', '$18,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-ceramide-barrier-face-cream?_pos=60&_fid=beb021398&_ss=c'),
(45, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_CERAMIDE_BARRIER_EYE_CREAM-SEAL_1200x.jpg?v=1629405231', 'VEGAN CERAMIDE Barrier Eye Cream', 'Made for sensitive skin Dermatologist & allergy tested Fragrance-free formula Formulated with vegan ceramides to support & replenish your skin barrier Lightweight formula acts like a hydrating serum for under-eyes Calendula & marshmallow root extract help soothe Formulated without parabens, phthalates, SLS or mineral oil', 'Aqua, glycerin, palmitoyl tripeptide-5, cetyl alcohol, squalane, helianthus annuus (sunflower) seed oil, tocopheryl acetate (vitamin E), stearyl alcohol, glycolipids, glyceryl stearate citrate, glyceryl laurate, ceramide NP, ceramide AP, ceramide EOP, phytosphingosine, cholesterol*, sodium lauroyl lactylate, calendula ocinalis flower extract, althaea ocinalis (marshmallow) root extract, caeine, aloe barbadensis leaf juice, tocopherol (vitamin E), sorbitan sesquioleate, allantoin, panthenol (vitamin B5), xanthan gum, glyceryl stearate, phenoxyethanol, ethylhexylglycerin.', 'Pacifica', '$16,00', 'Cream', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-ceramide-barrier-eye-cream?_pos=62&_fid=beb021398&_ss=c'),
(46, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_CERAMIDE_SERUM_1200x.jpg?v=1637009836', 'VEGAN CERAMIDE Serum', 'Super-hydrating serum made for dry & sensitive skin Fast-absorbing to help intensely hydrate & visibly improve texture Dermatologist, allergy & sensitive skin tested Fragrance-free formula Formulated with vegan ceramides to support & replenish your skin barrier Marshmallow root & calendula help soothe Formulated without parabens, phthalates, SLS or mineral oil 100% Vegan and cruelty-free', 'aqua (eau), caprylic/capric triglyceride, glycerin, cetearyl olivate, glyceryl stearate, sorbitan olivate, ceramide NP, ceramide AP, ceramide EOP, phytosphingosine, cholesterol, althaea ocinalis (marshmallow) leaf/root extract, calendula ocinalis flower extract, aloe barbadensis leaf juice, hydrolyzed jojoba esters, persea gratissima (avocado) oil, squalane, tocopherol (vitamin E), propanediol, betaine, erythritol, ethylhexyl olivate, caprylhydroxamic acid, caprylyl glycol, propanediol, sodium lauroyl lactylate, cetyl alcohol, carbomer, xanthan gum, citric acid, sodium gluconate, sodium benzoate, potassium sorbate, phenoxyethanol, ethylhexylglycerin.', 'Pacifica', '$18,00', 'Face Serum', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-ceramide-serum?_pos=63&_fid=beb021398&_ss=c'),
(47, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_CERAMIDE_BARRIER_FACE_LOTION_1200x.jpg?v=1637016103', 'VEGAN CERAMIDE Face Lotion', 'Available in full size (1.7 fl oz) and mini (0.7 fl oz) Lightweight daily lotion helps restore your skin\'s protective barrier while hydrating & soothing Dermatologist, allergy & sensitive skin tested Fragrance-free formula Formulated with vegan ceramides to support & replenish your skin barrier and anti-oxident rich sunflower oil Marshmallow root, chamomile and calendula help soothe and smooth Formulated without parabens, phthalates, SLS or mineral oil. 100% Vegan and cruelty-free', 'aqua (eau), helianthus annuus (sunflower) oil, aloe barbadensis leaf juice, glycerin, octyl palmitate, glyceryl stearate, stearic acid, glyceryl laurate, ceramide NP, ceramide AP, ceramide EOP, phytosphingosine, cholesterol, panthenol (vitamin B5), butyrospermum parkii (shea butter) fruit, tocopherol acetate (vitamin E), calendula ocinalis flower extract, chamomilla recutita (matricaria) flower extract, althaea ocinalis (marshmallow) flower extract, sodium hyaluronate, cocos nucifera (coconut) fruit juice, beta-glucan, allantoin, theobroma cacao (cocoa) seed butter, xanthan gum, sodium lauroyl lactylate, carbomer, diheptyl succinate, capryloyl glycerin/sebacic acid copolymer, phenoxyethanol, ethylhexylglycerin.', 'Pacifica', '$16,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-ceramide-barrier-face-lotion?_pos=64&_fid=beb021398&_ss=c'),
(48, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_CERAMIDE_FACE_OIL_1200x.jpg?v=1637016122', 'VEGAN CERAMIDE Facial Oil', 'Fast-absorbing face oil istantly quenches dry skin and provides a dewy, plump appearance Dermatologist, allergy & sensitive skin tested Fragrance-free formula Formulated with vegan ceramides to support & replenish your skin barrier and anti-oxident rich sunflower oil Marshmallow root, calendula and chamomile help soothe and smoothe Formulated without parabens, phthalates, SLS or mineral oil. 100% Vegan and cruelty-free', 'carthamus tinctorius (safflower) seed oil, caprylic/capric triglyceride, helianthus annuus (sunflower) seed oil, simmondsia chinensis (jojoba) seed oil, avena sativa (oat) kernel oil, sorbitan oleate, ceramide NP, ceramide AP, ceramide EOP, althaea ocinalis (marshmallow) leaf/root extract, calendula ocinalis flower extract, rosmarinus ocinalis (rosemary) leaf extract, phytosphingosine, linoleic acid, phytosterols, phospholipids, sodium lauroyl lactylate, cholesterol, carbomer, xanthan gum, propanediol, phenoxyethanol, ethylhexylglycerin.', 'Pacifica', '$18,00', 'Face Oil', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-ceramide-facial-oil?_pos=65&_fid=beb021398&_ss=c'),
(49, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_CERAMIDE_UNDEREYE_SMILE_LINE_PATCHES_1200x.jpg?v=1625847343', 'VEGAN CERAMIDE Hydration Fill Undereye & Smile Jelly Patches', 'Made for sensitive skin Dermatologist & allergy tested Fragrance-free formula 4 bio-cellulose patches in re-sealable pack for multiple uses Soothing jelly patches infused with vegan ceramides, marshmallow root extract & calendula help de-puff & hydrate Can be used under eyes or on smile lines Formulated without parabens, phthalates, SLS or mineral oil', 'Aqua, glycerin, niacinamide, ceramide NP, ceramide AP, ceramide EOP, phytosphingosine, cholesterol*, calendula ocinalis extract, betaine, althaea ocinalis (marshmallow) root extract, palmitoyl tripeptide-38, sodium hyaluronate, hydroxypropyl cyclodextrin, xanthan gum, polyglyceryl-10 laurate, sodium lauroyl lactylate, phenoxyethanol, ethylhexylglycerin, sodium citrate, citric acid', 'Pacifica', '$7,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-ceramide-hydration-fill-undereye-smile-line-jelly-patches?_pos=66&_fid=beb021398&_ss=c'),
(50, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_Dreamy_Youth_FaceCream_2022_1200x.jpg?v=1661959806', 'DREAMY YOUTH Day & Night Face Cream', 'Available in full size (1.7 fl oz) and mini (1 fl oz) For all skin types, especially dry Smells like geranium and rose absolute Disobey time with this superstar in your skincare arsenal Formulated without parabens, phthalates, SLS, or mineral oil', 'aqua, helianthus annuus (sunflower) seed oil, glycerin (vegetable) ethylhexyl palmitate, acetyl hexapeptide-3, glyceryl stearate, cetyl alcohol, palmitoyl tripeptide-3, butyrospermum parkii (shea) nut oil, vitis vinifera (grape) seed oil, aloe barbadensis leaf juice, laminaria hyperborea (kelp) extract, tocopherol acetate (vitamin E), magnesium ascorbyl phosphate, prunus amygdalus dulcis (sweet almond) oil, hyaluronic acid, theobroma cacao (cocoa) seed butter, panthenol (vitamin B5), allantoin, xanthan gum, sodium alginate, avena sativa (oat) beta glucan, cocos nucifera (coconut) water, iris pallida (sweet iris) leaf cell extract, rosa damascena (damascus rose) leaf cell extract, cichorium intybus (chicory) root oligosaccharides, caesalpinia spinosa gum, cucumis sativus (cucumber) fruit extract, phenoxyethanol, ethylhexylglycerin, pelargonium (geranium) oil.', 'Pacifica', '$18,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/dreamy-youth-day-night-face-cream?_pos=68&_fid=beb021398&_ss=c'),
(51, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_DREAMY_YOUTH_COMPLEX_LIP_BALM_1200x.jpg?v=1655411646', 'DREAMY YOUTH Complex Lip Balm', 'Plant-powered formula provides long-lasting, nourishing results Feels silky soft, never-sticky Pinky-red reflective shine Strawberry rose scent Formulated without parabens, phthalates, SLS, mineral oil or talc 100% vegan & cruelty-free', 'Polyglyceryl-2 isostearate, dimer dilinoleate, copolymer, helianthus annuus (sunflower) seed oil, dilinoleic acid, propanediol copolymer, simmondsia chinensis (jojoba) seed oil, caprylic/capric triglyceride, silica, euphorbia cerifera (candelilla) wax, candelilla cera, flavor (natural), raphanus sativus (radish) root extract, sucrose tetrastearate triacetate, maltodextrin, acacia senegal gum, ipomoea batatas root extract, citric acid, squalane (vegan), tocopheryl acetate (vitamin E), SR-hydrozoan polypeptide-1 (vegan collagen), hydrolyzed corn protein, hydrolyzed wheat protein, hydrolyzed soy protein, leuconostoc/radish, potassium sorbate. May contain/peut contenir: mica CI 77019, titanium dioxide CI 77891.', 'Pacifica', '$10,00', 'Lip Balm', 'https://www.pacificabeauty.com/collections/skincare/products/dreamy-youth-complex-lip-balm?_pos=69&_fid=beb021398&_ss=c'),
(52, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_DREAMY_YOUTH_SUPER_PEPTIDE_CREAM_1200x.jpg?v=1629476419', 'DREAMY YOUTH Super Peptide Cream', 'Peptide-packed formula designed to moisturize & rejuvenate skin Age-defying formula powered by our FleuracelTM Complex For all skin types, especially aging skin Formulated without parabens, phthalates, SLS or mineral oil', 'Aqua, helianthus annuus (sunflower) seed oil, myristyl myristate, isopropyl myristate, C12-15 alkyl benzoate, utyrospermum parkii (shea) butter, stearic acid, glyceryl stearate citrate, glycerin, palmitoyl tripeptide-5, dipeptide diaminobutyroyl benzylamide diacetate, propanediol, glyceryl stearate, sodium stearoyl glutamate, cetyl alcohol, stearyl alcohol, betaine, arginine, sodium PCA, hibiscus sabdaria flower extract, iris pallada (sweet iris) stem cell, rosa damascena flower water, pelargonium graveolens (geranium) oil, dibutyl lauroyl glutamide, tocopheryl acetate, xanthan gum, phenoxyethanol, ethylhexylglycerin. ', 'Pacifica', '$24,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/dreamy-youth-super-peptide-cream?_pos=71&_fid=beb021398&_ss=c'),
(53, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30311_ROSE_JELLY_UNDEREYE_GEL_BOX_PINK_1200x.jpg?v=1629491609', 'ROSE JELLY Beauty Sleep Undereye Gel', 'For all skin types Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'hamamelis virginiana (witch hazel) water, glycerin, aqua, carrageenan, caffeine, coffea arabica (coffee) seed extract, rosa canina fruit extract, tanacetum annuum (blue tansy) leaf oil, palmitoyl tripeptide-5, sodium hyaluronate, panthenol, microcrystalline cellulose, dextrose, lecithin, sodium carboxymethylcellulose, polysorbate 20, phenoxyethanol, ethylhexylglycerin, sodium benzoate.', 'Pacifica', '$16,00', 'Gel', 'https://www.pacificabeauty.com/collections/skincare/products/rose-jelly-beauty-sleep-undereye-gel?_pos=73&_fid=beb021398&_ss=c'),
(54, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_ACNE_DEFENSE_FACE_WASH_1200x.jpg?v=1678980669', 'ACNE DEFENSE Face Wash', 'Maximum strength 2% salicylic acid acne medication Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'Active Ingredient: Salicylic Acid 2.0%\nInactive Ingredients: Aqua, Cocamidopropyl Betaine, Sodium C14-16 Olefin Sulfonate, Aloe Barbadensis Leaf Juice*, Glycerin, Niacinamide, Cucumis Sativus (Cucumber) Fruit Extract*, Lavandula Angustifolia (Lavender) Flower/Leaf/Stem Extract*, Chamomilla Recutita (Matricaria) Flower Extract*, Camellia Sinensis (White Tea) Leaf Extract*, Arnica Montana Flower Extract*, Salvia Officinalis (Sage) Oil, Mentha Piperita (Peppermint) Oil, Panthenol, Allantoin, PotassiumSorbate, SodiumBenzoate, Sodium PCA, Ethylhexylglycerin, Parfum**. \n*certified organic \n**our scent blend with natural and/or essential oils\n\n', 'Pacifica', '$12,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/acne-defense?_pos=75&_fid=beb021398&_ss=c'),
(55, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_ACNE_WARRIOR_BODY_WASH_1200x.jpg?v=1655411659', 'ACNE WARRIOR Body Wash', 'Medicated body acne treatment with 2% salicylic acid & niacinamide Dermatologist tested and sensitive skin approvedInfused with skin-loving naturals like cucumber and aloe to help soothe Smells like watermelon & mint Suitable for all skin types, especially blemish-prone & oily Formulated without parabens, phthalates, SLS, mineral oil or talc. 100% vegan & cruelty-free', 'Active ingredient:Salicylic Acid 2.0%\nInactive ingredients: Aqua (Eau), Cocamidopropyl Betaine, Sodium C14-16 Olefin Sulfonate, Aloe Barbadensis Leaf Juice, Glycerin, Fragrance, Citric Acid, Potassium Sorbate,\nSodium Benzoate, Panthenol, Allantoin, Sodium PCA, Ethylhexylglycerin, Niacinamide, Cucumis Sativus (Cucumber) Fruit Extract, Melissa Officinalis\n(Balm Mint) Extract, Hamamelis Virginiana (Witch Hazel) Leaf Extract ', 'Pacifica', '$16,00', 'Body Wash', 'https://www.pacificabeauty.com/collections/skincare/products/acne-warrior-body-wash?_pos=76&_fid=beb021398&_ss=c'),
(56, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30441_ACNE_WARRIOR_CLEARING_ASTRINGENT_1200x.jpg?v=1594066567', 'ACNE WARRIOR Clearing Astringent', 'Maximum strength 2% salicylic acid acne medication Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'Active Ingredients: Salicylic Acid 2.0%\nInactive Ingredients: Aqua, Alcohol Denat., Glycerin, Sorbitol, Hamamelis Virginiana (Witch Hazel) Water, Niacinamide, Cucumis Sativus (Cucumber) Fruit Extract*, Aloe Barbadensis Leaf Juice*, Epilobium Angustifolium Flower/Leaf/Stem Extract, Lavandula Angustifolia (Lavender) Flower/Leaf/Stem Extract*, Chamomilla Recutita (Matricaria) Flower Extract *, Camellia Sinensis (White Tea) Leaf Extract*, Arnica Montana Flower Extract*, Spiraea Ulmaria (Meadowsweet) Extract, Salvia Officinalis (Sage) Oil, Mentha Piperita (Peppermint) Oil, Lens Esculenta (Lentil) Seed Extract, Sodium PCA, Dipotassium Glycyrrhizate, Parfum**.\n*certified organic \n**our scent blend with natural and/or essential oils', 'Pacifica', '$12,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/acne-warrior-clearing-astringent?_pos=77&_fid=beb021398&_ss=c'),
(57, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_DRY_IT_OUT_ACNE_SPOT_TREATMENT_BOTTLE_1200x.jpg?v=1678980674', 'DRY IT OUT Acne Gel Spot Treatment', 'Maximum strength 2% salicylic acid acne medication Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'Active Ingredient: Salicylic Acid 2.0%\nInactive Ingredients: Aqua, Alcohol Denat., Glycerin, Hamamelis Virginiana (Witch Hazel) Extract, Aloe Barbadensis Leaf Juice*, Hydroxyethylcellulose, Niacinamide, Cucumis Sativus (Cucumber) Fruit Extract*, Spiraea Ulmaria (Meadowsweet) Extract, Salvia Officinalis (Sage) Oil, Mentha Piperita (Peppermint) Oil, Lens Esculenta (Lentil) Fruit Extract, Lavandula Angustifolia (Lavender) Flower/Leaf/Stem Extract*, Chamomilla Recutita (Matricaria) Flower Extract*, Camellia Sinensis (White Tea) Leaf Extract*, Arnica Montana Flower Extract*, Dipotassium Glycyrrhizate, Parfum**. \n*certified organic \n**our scent blend with natural and/or essential oils', 'Pacifica', '$10,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/dry-it-out-acne-gel-spot-treatment?_pos=79&_fid=beb021398&_ss=c'),
(58, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_PORE_WARRIOR_SOFT_SCRUB_1200x.jpg?v=1678980671', 'PORE WARRIOR Soft Scrub', 'Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, helianthus annuus (sunflower) seed oil*, jojoba esters, glycerin, cetyl alcohol, glyceryl stearate, stearic acid, benzyl alcohol, niacinamide, tocopherol (vitamin E), cucumis sativus (cucumber) fruit extract*, rosa canina fruit oil*, lavandula angustifolia (lavender) flower/leaf/stem extract*, chamomilla recutita (matricaria) flower extract*, camellia sinensis (white tea) leaf extract*, arnica montana flower extract*, panthenol (vitamin B5), simmondsia chinensis (jojoba) seed oil*, glycine soja (soybean) sterols, allantoin, cannabis sativa (hemp) seed oil, salvia officinalis (sage) oil, mentha piperita (peppermint) oil, borago officinalis (borage) oil*, linum usitatissimum (flaxseed) oil*, jasminum officinale (jasmine) flower extract, coleus forskohlii root oil, pistacia lentiscus (mastic) gum, lecithin, papain, bromelain, maltodextrin, glyceryl laurate, alcohol denat., dipotassium glycyrrhizate, phenoxyethanol, sodium PCA, ethylhexylglycerin, parfum**.\n*certified organic \n**our scent blend with natural and/or essential oils', 'Pacifica', '$12,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/pore-warrior-soft-scrub?_pos=80&_fid=beb021398&_ss=c'),
(59, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_ACNE_WARRIOR_BODY_SCRUB_1200x.jpg?v=1613248435', 'ACNE WARRIOR Body Scrub', 'For all skin types, especially acne prone & oily skin Exfoliates skin to remove dirt and oil Formulated without parabens, phthalates, SLS or mineral oil', 'Active ingredient. Salicylic Acid 2.0% Inactive ingredients. Aqua, Sodium Cocoyl Glutamate, Disodium Cocoyl Glutamate, Hydroxypropyl Starch Phosphate, Hydrolyzed Jojoba Esters, Aloe Barbadensis Leaf Juice*, Decyl Glucoside, Niacinamide, Hamamelis Virginiana (Witch Hazel) Water, Glycerin, Cucumis Sativus (Cucumber) Extract*, Melissa Officinalis Extract, Lavandula Angustifolia (Lavender) Oil, Salvia Officinalis (Sage) Oil, Phenoxyethanol, Ethylhexylglycerin, Parfum**.', 'Pacifica', '$16,00', 'Body Scrub', 'https://www.pacificabeauty.com/collections/skincare/products/acne-warrior-body-scrub?_pos=81&_fid=beb021398&_ss=c'),
(60, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PoreWarriorEverydayLotionRainbows_square_1200x.jpg?v=1624907043', 'PORE WARRIOR Everyday Lotion', 'Dermatologist & allergy-tested and safe for sensitive skin Lightweight daily moisturizer for oily skin Moisturizes skin while helping minimize excess oil With niacinamide, cucumber and hyaluronic acid for balanced hydration Formulated without parabens, phthalates, SLS or mineral oil', 'Aqua, aloe barbadensis leaf juice, glycerin, cetyl alcohol, dicaprylyl carbonate, glyceryl stearate citrate, coconut alkanes, coco-caprylate/caprate, tearic acid, stearyl alcohol, niacinamide, caprylic/capric triglyceride, biosaccharide gum-1, cucumis sativus (cucumber) fruit extract, sodium hyaluronate, tocopherol (vitamin E), melissa ocinalis (balm mint) extract, panthenol, allantoin, betaine, tapioca starch, bixa orellana seed extract, xanthan gum, maltodextrin, phenoxyethanol, ethylhexylglycerin, parfum*. ', 'Pacifica', '$16,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/pore-warrior-everyday-lotion?_pos=84&_fid=beb021398&_ss=c'),
(61, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30519_PORE_WARRIOR_OVERNIGHT_RESCUE_SPOT_DOTS_BOX_2_SIZE_1200x.jpg?v=1644957179', 'PORE WARRIOR Overnight Rescue Spot Dots', 'New Improved performance and non-drying formula More to love: increasing from 12 count to 30 count For all skin types, especially breakout prone skin. Helps cover breakouts, so you reduce your urge to pick - lowering the risk of scarring Formulated without parabens, phthalates, SLS or mineral oil', 'hydrocolloid, melaleuca slternifolia (tea tree) leaf oil', 'Pacifica', '$8,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/pore-warrior-overnight-rescue-spot-dots-1?_pos=85&_fid=beb021398&_ss=c'),
(62, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_KALE_SMOOTHIE_REFINING_LOTION_1200x.jpg?v=1664234633', 'KALE SMOOTHIE Refining Lotion', 'Quick-absorbing, serum-meets-lotion formula Suitable for all skin types, especially combination and oil-prone Targets redness, enlarged pores, texture and tone Glass bottle + FSC Unit Carton Features Copper, niacinamide, pea peptides and super greens Formulated without parabens, phthalates, SLS, mineral oil or talc 100% vegan & cruelty-free', 'water (eau), glycerin,beta-glucan, algin, xanthan gum, hydrolyzed jojoba esters, cetearyl olivate, sorbitan olivate, coconut alkanes, coco-caprylate/caprate, diheptyl succinate, capryloyl glycerin/sebacic acid copolymer, biosaccharide gum-1, 1,2- hexanediol, ethylhexylglycerin, hydroxyethylcellulose, gluconolactone, sodium benzoate, arginine, cocos nucifera (coconut), liquid endosperm, cocos nucifera (coconut) water, cocos nucifera (coconut) fruit juice, tocopherol (vitamin E), brassica oleracea acephala (kale) leaf extract, aloe barbadensis leaf juice, chlorophyllin copper complex, spinacia oleracea (spinach) leaf extract, niacinamide, hydrolyzed pea protein, opuntia ficus-indica stem extract, brassica oleracea italica (broccoli) seed oil', 'Pacifica', '$16,00', 'Moi+F63:G90sturizer', 'https://www.pacificabeauty.com/collections/skincare/products/kale-smoothie-refining-lotion?_pos=86&_fid=beb021398&_ss=c'),
(63, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30172_Kale_Detox_Face_Wash_1200x.jpg?v=1594065061', 'KALE DETOX Deep Cleaning Face Wash', 'Available in full size (5 fl oz) and mini (1.4 fl oz) For oily & blemish prone skin types Smells like kale and green juice Formulated without parabens, phthalates, SLS, or mineral oil One of the best defenses against blemishes and breakouts is consistently clean skin.', 'aqua, cocamidopropyl betaine (coconut source), sodium C14-16 olefin sulfonate, aloe barbadensis leaf juice, (coconut source), glycerin (vegetable), sodium cocoyl glutamate (coconut source), decyl glucoside (corn source), sodium PCA, citric acid, panthenol (vitamin B), citrus medica limonum (lemon) peel extract, allantoin, magnesium ascorbyl phosphate, cocos nucifera (coconut) water, brassica oleracea acephala leaf (kale) extract, potassium sorbate, ethylhexylglycerin, sodium benzoate, crambe maritima leaf (blue seakale) extract, garcinia mangostana (mangosteen) extract, chamomile recutita (matricaria) flower extract, camellia sinensis (white tea) extract, arnica montana flower extract, kaolin, parfum (natural), chlorophyllinum cupreum (chlorophyll).', 'Pacifica', '$10,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/kale-detox-deep-cleaning-face-wash?_pos=87&_fid=beb021398&_ss=c'),
(64, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30516_SUPER_GREEN_DETOX_FACIAL_MASK_EU_1200x.jpg?v=1662823853', 'SUPER GREEN DETOX Kale & Charcoal Detox Facial Mask', 'All skin types, especially clogged pores and blemish prone skin types Your clear skin’s BFF Address clogged pores and blemish prone skin 100% cotton single-use sheet mask Formulated without parabens, phthalates, SLS, or mineral oil', 'aqua, glycerin (vegetable), xanthan gum, sodium hyaluronate, L-ascorbic acid (vitamin C), punica granatum(pomegranate) extract, camellia oleifera (green tea) leaf extract, brassica oleracea acephala (kale) extract, charcoal powder, citric acid, coriandrum sativum (cilantro) leaf extract, macrocystis pyifera (sea kelp) extract, chamomillarecutita (matricaria) flower extract, sodium hydroxide, phenoxyethanol, ethylhexylglycerin, curcuma longa (turmeric) root extract, parfum (natural). ', 'Pacifica', '$4,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/super-green-detox-kale-charcoal-detox-facial-mask?_pos=88&_fid=beb021398&_ss=c'),
(65, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30399_PORE_WARRIOR_SERUM_BOTTLE_1200x.jpg?v=1681227018', 'PORE WARRIOR Oil Fighter Booster Serum', 'Best for oily & combination skin types Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, glycerin, niacinamide, rubus idaeus (raspberry) leaf extract, ribes nigrum (black currant) leaf extract sorbic acid, microcrystalline cellulose, xanthan gum, cellulose gum, silica, phenoxyethanol, ethylhexylglycerin, parfum (natural).', 'Pacifica', '$18,00', 'Face Serum', 'https://www.pacificabeauty.com/collections/skincare/products/pore-warrior-oil-fighter-booster-serum?_pos=89&_fid=beb021398&_ss=c'),
(66, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30183_Kale_Charcoal_1200x.jpg?v=1594065055', 'KALE CHARCOAL Ultimate Detox Mask', 'For all skin types Smells kale and fresh limes Formulated without parabens, phthalates, SLS, or mineral oil', 'aqua, kaolin (clay), bentonite (clay), glycerin, epilobium angustifolium (willowherb) leaf extract, charcoal, brassica oleracea acephala leaf (kale) extract, camellia sinensis (green tea) extract, xanthan gum, aloe barbadensis leaf juice, potassium sorbate, moringa oleifera seed oil, undaria pinnatifida extract, fucus vesiculosus (bladderwrack) extract, cucumis sativus (cucumber) fruit extract, panthenol, methyl lactate, phenoxyethanol, ethylhexylglycerin, parfum (natural).\nCommon Sense Caution: Avoid contact with eyes.', 'Pacifica', '$15,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/kale-charcoal-ultimate-detox-mask?_pos=90&_fid=beb021398&_ss=c'),
(67, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_80035_SET_PROTECT_SETTING_MIST_SPF_45_1200x.jpg?v=1594066720', 'SEA & C Set & Protect Matte Sheer Setting Mist SPF 45', 'Great for all skin types Suncare + skincare Smells like light citrus Balanced mineral blend designed to apply evenly Broad spectrum UVA/UVB and blue light protection Formulated without talc, parabens, phthalates or mineral oil', 'Active ingredients: Avobenzone 2.9% • Homosalate 9.8% • Octisalate 4.9% • Octocrylene 9.5%\nInactive ingredients: Alcohol Denat., Butyloctyl Salicylate, Diheptyl Succinate, Silica Silylate, Coconut Alkanes, Parfum (Natural), Tetrahexyldecyl Ascorbate (Vitamin C), Algae Extract, Ascophyllum Nodosum (Seaweed) Extract, Laminaria Digitata (Algae) Extract, Aqua, Helianthus Annuus (Sunflower) Seed Oil, Hydrolyzed Jojoba Esters, Glycerin, Bisabolol, Capryloyl Glycerin/Sebacic Acid Copolymer, Coco-Caprylate/Caprate, Ethyl Ferulate.', 'Pacifica', '$16,00', NULL, 'https://www.pacificabeauty.com/collections/skincare/products/sea-c-set-protect-matte-sheer-setting-mist-spf-45?_pos=91&_fid=beb021398&_ss=c'),
(68, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_80036_SEA___C_SHEER_FACE_SERUM_BOTTLE_BOX_1200x.jpg?v=1594066722', 'SEA & C Sheer Face Serum SPF 55', 'Suncare + skincare for your face Smells like light citrus Lightweight balanced blend applies evenly Broad spectrum UVA/UVB and blue light protection', 'Active ingredients: Avobenzone 2.9% • Homosalate 9.8% • Octisalate 4.9% • Octocrylene 9.5%\nInactive Ingredients: Aqua, Butyloctyl Salicylate, Coconut Alkanes, Calcium Sodium Borosilicate, Cetearyl Alcohol, Parfum (Natural), Propanediol, Ascorbate (Vitamin C), Tocopherol (Vitamin E), Ascophyllum Nodosum (Kelp) Extract, Algae Extract, Withania Somnifera (Ashwagandha) Root Extract, Aloe Barbadensis Leaf Juice, Caffeine, Caprylhydroxamic Acid, Caprylyl Glycol, Cellulose Gum, Coco-Caprylate/ Caprate, Coco-Glucoside, Ethyl Ferulate, Fructose, Glycerin, Glyceryl Stearate, Lauroyl Lysine, Microcrystalline Cellulose, Sodium Gluconate, Sodium Stearoyl Glutamate, Xanthan Gum.', 'Pacifica', '$18,00', 'Face Serum', 'https://www.pacificabeauty.com/collections/skincare/products/sea-c-sheer-face-serum-spf55?_pos=92&_fid=beb021398&_ss=c'),
(69, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_80031_SEA___C_SHEER_SUNSCREEN_SPF30_1200x.jpg?v=1594066703', 'SEA & C Sheer Sunscreen Spray SPF 30', 'Suncare + skincare for your body Vanilla & orange natural scent Balanced formula designed to apply evenly Broad spectrum UVA/UVB protection Water-resistant up to 80 minutes Non-propellant continuous spray Continuous spray aluminum spray bottle', 'Active Ingredients: Octisalate 4.9% • Octocrylene 7.6% • Zinc Oxide 7.0%\nInactive ingredients: Aqua, Butyloctyl Salicylate, Caprylic/Capric Triglyceride, Acrylates Copolymer, Cetearyl Alcohol, Sodium Stearoyl Glutamate, Propanediol, Parfum (Natural), Tetrahexyldecyl Ascorbate (Vitamin C), Tocopherol (Vitamin E), Ascophyllum Nodosum Extract, Laminaria Digitata (Algae) Extract, Jojoba Esters, Caprylhydroxamic Acid, Caprylyl Glycol, Cellulose Gum, Citric Acid, Coco-Glucoside, Ethyl Ferulate, Glycerin, Glyceryl Stearate, Methyl Dihydroabietate, Microcrystalline Cellulose, Sodium Gluconate, Xanthan Gum.', 'Pacifica', '$16,00', 'Sunscreen', 'https://www.pacificabeauty.com/collections/skincare/products/sea-c-sheer-sunscreen-spray-spf30?_pos=93&_fid=beb021398&_ss=c'),
(70, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_80033_MATTIFY___PROTECT_DAILY_PRIMING_LOTION_BOX_1200x.jpg?v=1594066711', 'SEA & C Mattify & Protect Daily Priming Lotion SPF 35', 'Great for oily skin Suncare + skincare Smells like light citrus Balanced mineral blend designed to apply evenly Broad spectrum UVA/UVB and blue light protection', 'Active Ingredients: Octocrylene 7.6% • Zinc Oxide 6%\nInactive ingredients: Aqua, Coconut Alkanes, Calcium Sodium Borosilicate, Butyloctyl Salicylate, Propanediol, Cetearyl Alcohol, Parfum (Natural), Niacinamide, Tetrahexyldecyl Ascorbate (Vitamin C), Jojoba Esters, Laminaria Digitata (Algae) Extract, Ascophyllum Nodosum Extract, Tocopherol (Vitamin E), Caprylhydroxamic Acid, Caprylyl Glycol, Cetyl Alcohol, Citric Acid, Coco-Caprylate/ Caprate, Coco-Glucoside, Ethyl Ferulate, Glycerin, Montmorillonite, Sclerotium Gum, Sodium Gluconate, Sodium Stearoyl Glutamate, Sucrose Distearate, Sucrose Stearate, Xanthan Gum.', 'Pacifica', '$18,00', 'Sunscreen', 'https://www.pacificabeauty.com/collections/skincare/products/sea-c-mattify-protect-daily-priming-lotion-spf-35?_pos=94&_fid=beb021398&_ss=c'),
(71, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30101_Sea_Foam_Complete-Face_Wash_1200x.jpg?v=1644967434', 'SEA FOAM Complete Face Wash', 'Available in full size (5 fl oz) or mini (1.4 fl oz) For all skin types Smells like fresh coconut Coconut water & sea algae complex Remove makeup, cleanse & tone Powerhouse antioxidants Sulfate-free Formulated without parabens, phthalates, SLS, or mineral oil', 'aqua, cocomidopropyl betaine, sodium cocoyl glutamate, sodium cocoyl sulfoacetate, sodium cocoamphoacetate, decyl glucoside, aloe barbadensis leaf juice, glycerin (vegetable), magnesium ascorbyl phosphate, glycol stearate, carica papaya extract, lemon bioflavonoids, cocos nucifera (coconut) oil, cocos nucifera (coconut) water, citric acid, tocopherol acetate (vitamin E), panthenol (vitamin B), sodium PCA, allantoin, porphyra umbilicalis (nori) extract, garcinia mangostana (mangosteen) peel extract, camellia sinensis (white tea) leaf extract, sea algae extract, sodium benzoate, potassium sorbate, ethylhexylglycerin, parfum (natural).', 'Pacifica', '$5,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/sea-foam-complete-face-wash?_pos=95&_fid=beb021398&_ss=c'),
(72, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30317_SEA___C_LOVE_VITAMIN_SERUM_1200x.jpg?v=1594065767', 'SEA & C LOVE Vitamin Serum', 'For all skin types Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients Due to the fact that we use naturals, the viscosity of this product can change. It does not affect the effectiveness.', 'aqua, glycerin, 3-o-ethyl ascorbic acid (vitamin C), aloe barbadensis leaf juice, laminaria digitata (sea kelp) extract, camellia sinensis (green tea) extract, saccharomyces/xylinum/black tea ferment, curcuma longa (turmeric) root extract, hyaluronic acid, spirulina maxima extract, hydrolyzed gardenia florida extract, vaccinium macrocarpon (cranberry) fruit extract, hydroxyethylcellulose, sodium riboflavin phosphate, phenoxyethanol, ethylhexylglycerin, maltodextrin, parfum*.*our scent blend with natural and/or essential oils', 'Pacifica', '$18,00', 'Face Serum', 'https://www.pacificabeauty.com/collections/skincare/products/sea-c-love-vitamin-serum?_pos=96&_fid=beb021398&_ss=c'),
(73, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30514_STRESS_REHAB_FACIAL_MASK_1200x.jpg?v=1662823848', 'STRESS REHAB Coconut & Caffeine Facial Mask', 'All skin types, especially stressed. Party then, rehab stressed skin now Helps fight redness and puffiness from too many late nights or stress 100% cotton single-use sheet mask', 'aqua, glycerin (vegetable), xanthan gum, camellia oleifera (green tea) leaf extract, caffeine, cocos nucifera (coconut) fruit extract, chamomilla recutita (matricaria) flower extract, citric acid, phenoxyethanol, ethylhexylglycerin, curcuma longa (turmeric) root extract, parfum (natural).', 'Pacifica', '$4,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/stress-rehab-coconut-caffeine-facial-mask?_pos=97&_fid=beb021398&_ss=c'),
(74, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30515_DISOBEY_TIME_FACIAL_MASK_EU_1200x.jpg?v=1662823850', 'DISOBEY TIME Rose & Peptide Facial Mask', 'All skin types especially dry and those who wish to fight the look of time Hydration & the look of dreamy youth is yours Calm dry skin 100% cotton single-use sheet mask Formulated without parabens, phthalates, SLS, or mineral oil', 'aqua, glycerin (vegetable), polyglyceryl-l laurate, xanthan gum, punica granatum (pomegranate) extract, camellia oleifera (green tea) leaf extract, orvza saliva (rice) extract, rosa canina seed oil, chamomilla recutita (matricaria) flower extract, curcuma longa (turmeric) root extract, citric acid, phenoxyethanol, ethylhexylglycerin. hydroxypropyl cyclodextrin. sodium hyaluronate. palmitoyl tripeptide-38, polysorbate 20, partum (natural). ', 'Pacifica', '$4,00', 'Mask', 'https://www.pacificabeauty.com/collections/skincare/products/glowing-glycolic-acid-orange-vanilla-makeup-removing-wipes-10ct?_pos=99&_fid=beb021398&_ss=c'),
(75, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_31419_GLOWING_MAKEUP_REMOVING_WIPES_10_CT_1200x.jpg?v=1594066202', 'GLOWING GLYCOLIC ACID, ORANGE & VANILLA Makeup Removing Wipes (10ct)', 'Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'Aqua, Sodium Cocoyl Hydrolyzed Soy Protein, Oryza Sativa (Rice) Extract, Glycerin, Potassium Sorbate, Aloe Barbadensis Leaf Extract, Rosa Damascena (Rose) Flower Water, Cocos Nucifera (Coconut) Water, Calendula Officinalis (Calendula) Flower Extract, Carica Papaya (Papaya) Fruit Extract, Glycolic Acid, Parfum (Natural), Polysorbate 20, Phenoxyethanol.', 'Pacifica', '$3,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/bali-coconut-natural-lip-balm?_pos=100&_fid=beb021398&_ss=c'),
(76, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_62800_LIP_BALM_BALI_COCONUT_BOX_1200x.jpg?v=1597782795', 'BALI COCONUT Lip Balm', 'N/A', 'cocos nucifera (coconut) oil, euphorbia cerifera (candelilla) wax, olea europaea (olive) fruit oil, simmondsia chinensis (jojoba) seed oil, ricinus communis (castor) seed oil, flavor (natural), theobroma cacao (cocoa) seed butter, rosmarinus officinalis (rosemary) leaf extract, helianthus annuus (sunflower) seed oil, stevia rebaudiana extract, tocopherol (vitamin E).', 'Pacifica', '$5,00', 'Lip Balm', 'https://www.pacificabeauty.com/collections/skincare/products/bali-coconut-natural-lip-balm?_pos=100&_fid=beb021398&_ss=c'),
(77, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30433_LAVENDER_MOON_BEDTIME_LIP_TREATMENT_JAR_1200x.jpg?v=1594066570', 'LAVENDER MOON Bedtime Lip Treatment', 'Smells like lavender with a hint of rose Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'prunus amygdalus dulcis (sweet almond) oil, simmondsia chinensis (jojoba) seed oil, butyrospermum parkii (shea) butter, jojoba esters, euphorbia cerifera (candelilla) wax, trihydroxystearin, soybean glycerides, helianthus annuus (sunflower) seed wax, aqua, flavor*, butyrospermum parkii (shea) butter unsaponifiables, behenyl behenate, glycerin, stevia rebaudiana extract, rosa centifolia flower extract, acacia decurrens flower wax , sodium hyaluronate, mica, iron oxides, tocopherol (vitamin E), titanium dioxide, polyglycerin-3, caprylhydroxamic acid, caprylyl glycol.', 'Pacifica', '$13,00', 'Lip Balm', 'https://www.pacificabeauty.com/collections/skincare/products/rainbow-melon-natural-lip-balm?_pos=103&_fid=4f4d1651c&_ss=c'),
(78, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGN_LIP_BALM_RAINBOW_WATERMELON_BOX_1200x.jpg?v=1678894274', 'RAINBOW MELON Lip Balm', 'Smells like watermelon Formulated without parabens, phthalates, SLS, or mineral oil', 'cocos nucifera (coconut) oil, carthamus tinctorius (safflower) seed oil, euphorbia cerifera (candelilla) wax, oryza sativa (rice) bran wax, flavor (natural/naturelle), theobroma cocoa (cocoa) seed butter, copernicia cerifera (carnauba) wax, tocopherol (vitamin E).', 'Pacifica', '$5,00', 'Lip Balm', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-lip-balm-set?_pos=102&_fid=4f4d1651c&_ss=c'),
(79, 'https://cdn.shopify.com/s/files/1/1515/0462/products/COCONUT_ESSENCE_MINI_1200x.jpg?v=1569164057', 'COCONUT ESSENCE Hydro Mist Mini', 'For all skin types, especially stressed Smells like coconut and vanilla 2 fl oz Formulated without parabens, phthalates, SLS, or mineral oil', 'aqua, glycerin, sodium hyaluronate, aloe barbadensis leaf extract, panthenol (vitamin B), allantoin, potassium sorbate, camellia sinensis (green tea) leaf extract, hamamelis virginiana (witch hazel), cocos nucifera (coconut) water, sodium ascorbyl phosphate, caffeine, selaginella lepidophylla extract, phenoxyethanol, ethylhexylglycerin, parfum (natural).', 'Pacifica', '$5,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/coconut-essence-hydro-mist-travel?_pos=104&_fid=4f4d1651c&_ss=c'),
(80, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_62604_NAKED_QUENCH_COCONUT_CHERRY_1200x.jpg?v=1594065489', 'NAKED QUENCH Coconut Cherry Lip Balm', 'Smells like coconut Formulated without parabens, phthalates, SLS, or mineral oil', 'cocos nucifera (coconut) oil, euphorbia cerifera (candelilla) wax, glycine soja (soy) bean wax, persea gratissima (avocado) oil, theobroma cacao (cocoa) butter, tocopherol (vitamin E), rosmarinus officinalis (rosemary) extract, all natural flavor.', 'Pacifica', '$5,00', 'Lip Balm', 'https://www.pacificabeauty.com/collections/skincare/products/naked-quench-lip-balm-coconut-cherry?_pos=105&_fid=4f4d1651c&_ss=c'),
(81, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30421_MOISTURE_REHAB_MAKEUP_REMOVING_WIPES_0f03e271-ea94-468f-b1d3-9b89bb51dbdb_1200x.jpg?v=1594066044', 'MOISTURE REHAB ROSE & COCONUT Makeup Removing Wipes', 'Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, aloe barbadensis leaf extract, rosa damascena (rose) flower water, cocos nucifera (coconut) water, calendula officinalis (calendula) flower extract, carica papaya (papaya) fruit extract, decyl glucoside, glycerin, parfum (natural), polysorbate 20, phenoxyethanol, potassium sorbate, citric acid.', 'Pacifica', '$5,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/moisture-rehab-rose-coconut-makeup-removing-wipes?_pos=106&_fid=4f4d1651c&_ss=c'),
(82, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_30324_LEAVE_PRETTY_EYE_MASKS_1200x.jpg?v=1594065779', 'LEAVE PRETTY Anti-Puff Eye Patches', 'For all skin types Formulated without parabens, phthalates, SLS, or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, glycerin, tanacetum annuum (blue tansy) flower extract, ascophyllum nodosum (kelp) extract, tilia cordata leaf extract, sodium hyaluronate, xanthan gum, phenoxyethanol, ethylhexylglycerin, parfum (natural), polysorbate 20, citric acid.', 'Pacifica', '$5,00', NULL, 'https://www.pacificabeauty.com/collections/skincare/products/leave-pretty-anti-puff-eye-patches?_pos=107&_fid=4f4d1651c&_ss=c'),
(83, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_CLEAN_SHOT_NIACINAMIDE_ZINC_HEMP_BOTTLE_1200x.jpg?v=1594241136', 'CLEAN SHOT Niacinamide, Zinc & Hemp 10% Complex', 'For all skin types, especially oily skin Smells like lemongrass Formulated without parabens, phthalates, petroleum, SLS or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, niacinamide, aloe barbadensis leaf juice, zinc PCA, cannabis sativa (hemp) seed oil, hydroxyethylcellulose, sclerotium gum, xanthan gum, disodium phosphate, citric acid, potassium sorbate, sodium benzoate, sodium phosphate, polysorbate 20, ethylhexylglycerin, phenoxyethanol, parfum*. *our scent blend with natural and/or essential oils', 'Pacifica', '$12,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/clean-shot-bha-aha-25-peel-solution?_pos=109&_fid=4f4d1651c&_ss=c'),
(84, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_CLEAN_SHOT_BHA_AHA_BOTTLE_1200x.jpg?v=1594241137', 'CLEAN SHOT BHA/AHA 25% Peel Solution', 'For all skin types A powerful AHA/BHA peel that helps reveal radiant skin Smells like mandarin Formulated without parabens, phthalates, petroleum, SLS or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, glycolic acid, lactic acid, sodium hydroxide, salix alba (willow) bark extract, aloe barbadensis leaf juice, salicylic acid, curcuma longa (turmeric) root extract, ocimum basilicum (basil) flower/leaf extract, ocimum sanctum leaf extract, melia azadirachta leaf extract, melia azadirachta flower extract, corallina officinalis extract, coccinia indica fruit extract, aloe barbadensis flower extract, solanum melongena (eggplant) fruit extract, glycerin, hydroxyethylcellulose, sclerotium gum, xanthan gum, sodium carbonate, citric acid, potassium sorbate, sodium benzoate, sodium phosphate, disodium phosphate, polysorbate 20, ethylhexylglycerin, phenoxyethanol, parfum*. *our scent blend with natural and/or essential oils', 'Pacifica', '$12,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/clean-shot-bha-aha-25-peel-solution?_pos=109&_fid=4f4d1651c&_ss=c'),
(85, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_CLEAN_SHOT_HYALURONIC_FLOWERS_BOTTLE_1200x.jpg?v=1594066762', 'CLEAN SHOT Hyaluronic & Flowers 5% Solution', 'For all skin types Helps hydrate Smells like rose Formulated without parabens, phthalates, petroleum, SLS or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, glycine soja (soybean) oil, sodium hyaluronate, citrus aurantium amara (bitter orange) flower extract, jasminum officinale (jasmine) flower extract, lavandula angustifolia (lavender) flower extract, paeonia officinalis flower extract, prunus serrulata flower extract, sambucus nigra flower extract, rosa damascena flower oil, malus domestica fruit cell culture extract, helianthus annuus (sunflower) seed oil, tocopherol (vitamin E), xanthan gum, glycerin, lecithin, polysorbate 20, phenoxyethanol, ethylhexylglycerin, parfum*. *our scent blend with natural and/or essential oils', 'Pacifica', '$12,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/clean-shot-hyaluronic-flowers-5-solution?_pos=110&_fid=4f4d1651c&_ss=c'),
(86, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_CLEAN_SHOT_RETINOID_BAKUCHIOL_BOTTLE_1200x.jpg?v=1594241135', 'CLEAN SHOT Retinoid + Bakuchiol 3% in Seawater', 'For all skin types Addresses multiple signs of aging Smells like jasmine Formulated without parabens, phthalates, petroleum, SLS or mineral oil Made in the USA with the best globally sourced ingredients', 'aqua, sea water, propanediol, caprylic/capric triglyceride, hydroxypinacolone retinoate, bakuchiol, glycerin, picea abies extract, silica, xanthan gum, sclerotium gum, lecithin, pullulan, sodium phytate, caprylyl glycol, ethanol, dimethyl isosorbide**, parfum*. *our scent blend with natural and/or essential oils **vegetable source', 'Pacifica', '$16,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/clean-shot-retinoid-bakuchiol?_pos=111&_fid=4f4d1651c&_ss=c'),
(87, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_CLEAN_SHOT_GRANACTIVE_RETINOID_BOTTLE_1200x.jpg?v=1594241134', 'CLEAN SHOT Granactive Retinoid 5% in Seawater', 'For all skin types Addresses multiple signs of aging Smells like jasmine Formulated without parabens, phthalates, petroleum, SLS or mineral oil Made in the USA with the best globally sourced ingredients.', 'aqua, sea water, propanediol, caprylic/capric triglyceride, hydroxypinacolone retinoate, glycerin, picea abies extract, silica, xanthan gum, sclerotium gum, lecithin, pullulan, sodium phytate, caprylyl glycol, ethanol, dimethyl isosorbide**, parfum* *our scent blend with natural and/or essential oils **vegetable source', 'Pacifica', '$16,00', 'Face Treatment', 'https://www.pacificabeauty.com/collections/skincare/products/clean-shot-granactive-retinoid?_pos=112&_fid=4f4d1651c&_ss=c');
INSERT INTO `projet_products` (`id`, `images`, `names`, `descriptions`, `ingredients`, `brand`, `prices`, `Type`, `Link`) VALUES
(88, 'https://cdn.shopify.com/s/files/1/1515/0462/products/Dreamy_Youth_1_oz_1200x.jpg?v=1594066026', 'DREAMY YOUTH Day and Night Cream Mini', 'Disobey time with this superstar in your skincare arsenal. Smells like geranium and rose absolute 1 fl oz Formulated without parabens, phthalates, SLS, or mineral oil', 'aqua, helianthus annuus (sunflower) seed oil, glycerin (vegetable) ethylhexyl palmitate, acetyl hexapeptide-3, glyceryl stearate, cetyl alcohol, palmitoyl tripeptide-3, butyrospermum parkii (shea) nut oil, vitis vinifera (grape) seed oil, aloe barbadensis leaf juice, laminaria hyperborea (kelp) extract, tocopherol acetate (vitamin E), magnesium ascorbyl phosphate, prunus amygdalus dulcis (sweet almond) oil, hyaluronic acid, theobroma cacao (cocoa) seed butter, panthenol (vitamin B5), allantoin, xanthan gum, sodium alginate, avena sativa (oat) beta glucan, cocos nucifera (coconut) water, iris pallida (sweet iris) leaf cell extract, rosa damascena (damascus rose) leaf cell extract, cichorium intybus (chicory) root oligosaccharides, caesalpinia spinosa gum, cucumis sativus (cucumber) fruit extract, phenoxyethanol, ethylhexylglycerin, pelargonium (geranium) oil.', 'Pacifica', '$10,00', 'Moisturizer', 'https://www.pacificabeauty.com/collections/skincare/products/dreamy-youth-day-and-night-face-cream-mini-1-fl-oz?_pos=113&_fid=4f4d1651c&_ss=c'),
(89, 'https://cdn.shopify.com/s/files/1/1515/0462/products/PAC_VEGAN_CERAMIDE_FACE_WASH_MINI_be881187-314f-44de-aa0e-87aa3289cbc8_1200x.jpg?v=1673473213', 'VEGAN CERAMIDE Extra Gentle Face Wash Mini', 'Available in full size (5 fl oz) and mini (1.4 fl oz) Made for sensitive skin Dermatologist & allergy tested Fragrance-free formula Formulated with vegan ceramides to support & replenish your skin barrier Sulfate-free light foaming cleanser Gently & effectively cleanses skin while supporting skin\'s barrier Marshmallow root extract & calendula help soothe Formulated without parabens, phthalates, SLS or mineral oil', 'Aqua, sodium cocoyl glutamate, disodium cocoyl glutamate, hydroxypropyl starch phosphate, coco-glucoside, glycol distearate, glycerin, ceramide NP, ceramide AP, ceramide EOP, phytosphingosine, cholesterol*, sodium lauroyl lactylate, xanthan gum, althaea ocinalis (marshmallow) leaf/root extract, calendula ocinalis flower extract, arginine, serine, threonine, decyl glucoside, phenoxyethanol, ethylhexylglycerin. *plant source', 'Pacifica', '$5,00', 'Cleansing', 'https://www.pacificabeauty.com/collections/skincare/products/vegan-ceramide-extra-gentle-face-wash-mini?_pos=114&_fid=4f4d1651c&_ss=c');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `login_t_user`
--
ALTER TABLE `login_t_user`
  ADD PRIMARY KEY (`U_Id`);

--
-- Index pour la table `projet_article`
--
ALTER TABLE `projet_article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `projet_favorites`
--
ALTER TABLE `projet_favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projet_favorites_user_id_product_id_23aef495_uniq` (`user_id`,`product_id`);

--
-- Index pour la table `projet_products`
--
ALTER TABLE `projet_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `login_t_user`
--
ALTER TABLE `login_t_user`
  MODIFY `U_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `projet_article`
--
ALTER TABLE `projet_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projet_favorites`
--
ALTER TABLE `projet_favorites`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projet_products`
--
ALTER TABLE `projet_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `projet_favorites`
--
ALTER TABLE `projet_favorites`
  ADD CONSTRAINT `projet_favorites_user_id_b23a02e9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
