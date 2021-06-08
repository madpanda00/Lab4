-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 28 2021 г., 16:50
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `post_id`, `content`, `create_at`, `user_id`) VALUES
(13, 13, 'Современная методология разработки способствует повышению качества системы массового участия.', '2021-05-28 16:46:14', 34),
(14, 14, 'Приятно, граждане, наблюдать, как непосредственные участники технического прогресса представляют собой не что иное, как квинтэссенцию победы маркетинга над разумом и должны быть функционально разнесены на независимые элементы.', '2021-05-28 16:48:37', 35),
(15, 14, 'Как принято считать, независимые государства, инициированные исключительно синтетически, представлены в исключительно положительном свете.', '2021-05-28 16:49:05', 34),
(16, 13, 'Разнообразный и богатый опыт говорит нам, что перспективное планирование требует определения и уточнения позиций, занимаемых участниками в отношении поставленных задач.', '2021-05-28 16:49:37', 35);

-- --------------------------------------------------------

--
-- Структура таблицы `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20210515154101', '2021-05-15 15:42:22'),
('20210522142817', '2021-05-22 14:28:43'),
('20210522143239', '2021-05-22 14:32:45'),
('20210525115824', '2021-05-25 11:58:37'),
('20210525132105', '2021-05-25 13:21:11'),
('20210525132442', '2021-05-25 13:24:46');

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `short_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `user_id`, `title`, `content`, `created_at`, `short_content`, `views`) VALUES
(13, 34, 'Британские ученые заявили, что объем доходов населения сократился!', 'Вот вам яркий пример современных тенденций - начало повседневной работы по формированию позиции в значительной степени обусловливает важность системы массового участия. Предварительные выводы неутешительны: глубокий уровень погружения прекрасно подходит для реализации анализа существующих паттернов поведения. Как принято считать, элементы политического процесса освещают чрезвычайно интересные особенности картины в целом, однако конкретные выводы, разумеется, ограничены исключительно образом мышления. В частности, глубокий уровень погружения влечет за собой процесс внедрения и модернизации укрепления моральных ценностей. Новая модель организационной деятельности в значительной степени обусловливает важность поэтапного и последовательного развития общества.', '2021-05-28 16:43:54', 'от вам яркий пример современных тенденций - начало повседневной работы по формированию позиции в значительной степени обусловливает важность системы массового участия. Предварительные выводы...', 8),
(14, 35, 'Постоянный количественный рост определил дальнейшее развитие', 'В своём стремлении повысить качество жизни, они забывают, что разбавленное изрядной долей эмпатии, рациональное мышление предопределяет высокую востребованность укрепления моральных ценностей. Есть над чем задуматься: тщательные исследования конкурентов представляют собой не что иное, как квинтэссенцию победы маркетинга над разумом и должны быть объективно рассмотрены соответствующими инстанциями. С учётом сложившейся международной обстановки, консультация с широким активом требует определения и уточнения поставленных обществом задач. С учётом сложившейся международной обстановки, понимание сути ресурсосберегающих технологий требует от нас анализа новых предложений. Социально-экономическое развитие, в своём классическом представлении, допускает внедрение соответствующих условий активизации. Следует отметить, что реализация намеченных плановых заданий однозначно фиксирует необходимость приоритизации разума над эмоциями.', '2021-05-28 16:48:05', 'В своём стремлении повысить качество жизни, они забывают, что разбавленное изрядной долей эмпатии, рациональное мышление предопределяет высокую востребованность укрепления моральных ценностей. Есть над чем задуматься...', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(25, 'admin@admin.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$WsJmeE75DkflodRXzAktpg$fafM8XmwBeVCqlwfzZMh9gYXkmU0i5ciLpyUYknKBG4', 'admin'),
(26, 'user@user.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$2VQP4HcW+aTtsbCJ64TDWw$RYp4vHLux5tsfjvFY8RouxG4dHgLO+LtLADLy9rWUC4', 'user'),
(34, 'tema@tema.tema', '[]', '$argon2id$v=19$m=65536,t=4,p=1$bBk03/ITXl8gPSDTzPvFhg$Ok9Qrqw9fv6vLP3zi6lq4F2+O5eZUMWy7cuHTGvqyvY', 'TemaMich'),
(35, 'grimm@grimm.grimm', '[]', '$argon2id$v=19$m=65536,t=4,p=1$8JtPmiXx/JcbcCITkWRdEA$COhYHOSGuklRnzNv3otcJNsNSWtPmvHjmYakg7iIwLc', 'Grimm');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C4B89032C` (`post_id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`);

--
-- Индексы таблицы `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A8A6C8DA76ED395` (`user_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
