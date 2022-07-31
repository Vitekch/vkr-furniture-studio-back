-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 31 2022 г., 14:25
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `furniture_studio`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brigades`
--

CREATE TABLE `brigades` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `brigades`
--

INSERT INTO `brigades` (`id`, `name`) VALUES
(1, 'Бригада 1');

-- --------------------------------------------------------

--
-- Структура таблицы `catalog_furniture`
--

CREATE TABLE `catalog_furniture` (
  `id` int NOT NULL,
  `id_type` int NOT NULL,
  `id_designer` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `catalog_furniture`
--

INSERT INTO `catalog_furniture` (`id`, `id_type`, `id_designer`, `image`, `name`, `price`) VALUES
(1, 9, 8, 'https://www.ikea.com/ru/ru/images/products/bergmund-stul-belyy-nikvarn-seryy__0926644_pe789427_s5.jpg?f=s', 'Копенгаген', 9000),
(2, 1, 8, 'https://www.ikea.com/ru/ru/images/products/knopparp-2-mestnyy-divan-knisa-svetlo-seryy__0713943_pe729858_s5.jpg?f=s', 'Элегантная простота', 30000),
(3, 1, 8, 'https://www.ikea.com/ru/ru/images/products/aepplaryd-epplaryud-4-mestnyy-divan-s-kozetkoy-leyde-svetlo-seryy__1010450_pe828073_s5.jpg?f=s', 'Гигант мысли', 76000),
(4, 1, 8, 'https://www.ikea.com/ru/ru/images/products/ektorp-2-mestnyy-divan-hallarp-bezhevyy__0818539_pe774470_s5.jpg?f=s', 'Деревенский простак', 10000),
(5, 1, 7, 'https://www.ikea.com/ru/ru/images/products/glostad-2-mestnyy-divan-knisa-temno-seryy__0950864_pe800736_s5.jpg?f=s', 'Стул', 9999),
(6, 1, 7, 'https://www.ikea.com/ru/ru/images/products/graellsta-grellsta-2-mestnyy-divan-krovat-sandsbru-seryy__0761356_pe751222_s5.jpg?f=s', 'Абстрактная конструкция №17', 7000),
(7, 1, 7, 'https://www.ikea.com/ru/ru/images/products/ingmarsoe-ingmarse-2-mestnyy-divan-dlya-doma-sada-belyy-zelenyy-bezhevyy__0928417_pe789849_s5.jpg?f=s', 'Ликующая надежность', 19000),
(8, 1, 8, 'https://www.ikea.com/ru/ru/images/products/svensta-2-mestnyy-divan-krovat-temno-siniy__1010073_pe827878_s5.jpg?f=s', 'Скромник', 18000);

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `name`, `phone`, `address`, `email`) VALUES
(1, 'Гертруда Иванова', '+79654619470', NULL, 'vitek123654@bk.ru'),
(8, 'Виталий Витальев', '89658437111', NULL, 'vitek1232654@hotmail.com'),
(9, 'Виктор Чижиков', '+79654619474', 'Ростов-на-Дону, пр. М. Нагибина 6', 'vitek123654@hotmail.com'),
(10, 'Виктор Чижов', '+79654619475', 'Ростов-на-Дону, пр. М. Нагибина 6', 'vitek123651@hotmail.com'),
(11, 'Виктор Чиженя', '+79654619476', 'Ростов-на-Дону, пр. М. Нагибина 6', 'vitek122651@hotmail.com'),
(12, 'Чи Джень', '+79654619478', 'Ростов-на-Дону, пр. М. Нагибина 6', 'vitek122651@hotmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(1, 'Директор'),
(2, 'Старший менеджер'),
(3, 'Менеджер'),
(4, 'Мебельщик'),
(5, 'Главный дизайнер'),
(6, 'Дизайнер'),
(7, 'Грузчик'),
(8, 'Маркетолог');

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `id` int NOT NULL,
  `id_type` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `is_submited` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`id`, `id_type`, `name`, `email`, `feedback`, `is_submited`) VALUES
(1, 2, 'Петров Павел', 'pavel228@gmail.com', 'Очень понравилось обслуживание, сделали все быстро и качественно ', 1),
(2, 2, 'Аксентьева Валентина', 'val@mail.ru', 'Просто вау!', 1),
(3, 1, 'ssss', 'ssss@sss.com', 'sssss', 0),
(4, 1, 'ssss', 'ssss@sss.com', 'sssss', 0),
(5, 1, 'ssss', 'ssss@sss.com', 'sssss', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `feedback_types`
--

CREATE TABLE `feedback_types` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `feedback_types`
--

INSERT INTO `feedback_types` (`id`, `name`) VALUES
(1, 'Вопрос'),
(2, 'Отзыв');

-- --------------------------------------------------------

--
-- Структура таблицы `furniture_types`
--

CREATE TABLE `furniture_types` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `furniture_types`
--

INSERT INTO `furniture_types` (`id`, `name`) VALUES
(1, 'Диван'),
(2, 'Кресло'),
(3, 'Столик журнальный'),
(4, 'Тумба под телевизор'),
(5, 'Кровать'),
(6, 'Тумба прикроватная'),
(7, 'Гардероб'),
(8, 'Стол'),
(9, 'Стул');

-- --------------------------------------------------------

--
-- Структура таблицы `ordered_furniture`
--

CREATE TABLE `ordered_furniture` (
  `id` int NOT NULL,
  `id_furniture` int NOT NULL,
  `id_order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `ordered_furniture`
--

INSERT INTO `ordered_furniture` (`id`, `id_furniture`, `id_order`) VALUES
(1, 2, 13);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `id_service` int NOT NULL,
  `id_manager` int DEFAULT NULL,
  `id_client` int NOT NULL,
  `is_completed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `id_service`, `id_manager`, `id_client`, `is_completed`) VALUES
(1, 2, NULL, 1, 0),
(10, 2, NULL, 8, 0),
(11, 2, NULL, 8, 0),
(12, 2, NULL, 8, 0),
(13, 2, NULL, 8, 0),
(14, 1, NULL, 9, 0),
(15, 1, NULL, 10, 0),
(16, 1, NULL, 10, 0),
(17, 1, NULL, 11, 0),
(18, 1, NULL, 12, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `original_furniture`
--

CREATE TABLE `original_furniture` (
  `id` int NOT NULL,
  `id_order` int NOT NULL,
  `id_brigade` int DEFAULT NULL,
  `id_type` int DEFAULT NULL,
  `price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `original_furniture`
--

INSERT INTO `original_furniture` (`id`, `id_order`, `id_brigade`, `id_type`, `price`) VALUES
(1, 16, NULL, NULL, NULL),
(2, 17, NULL, NULL, NULL),
(3, 18, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `id_order` int NOT NULL,
  `payment_from` varchar(20) NOT NULL,
  `payment_to` varchar(20) NOT NULL,
  `payment_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`) VALUES
(1, 'Оригинальный дизайн'),
(2, 'Мебель из каталога');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `manager_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `manager_id`) VALUES
(1, 'admin', 'YWRtaW4=', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `workers`
--

CREATE TABLE `workers` (
  `id` int NOT NULL,
  `id_department` int NOT NULL,
  `id_brigade` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `pasport` varchar(10) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `start_work` date NOT NULL,
  `salary` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `workers`
--

INSERT INTO `workers` (`id`, `id_department`, `id_brigade`, `name`, `pasport`, `phone`, `start_work`, `salary`) VALUES
(3, 1, NULL, 'Боба Сергей Петрович', '1234998761', '88005553535', '2022-04-14', 135000),
(4, 2, NULL, 'Голова Ирина Альбертовна', '1236123876', '88964211234', '2022-04-14', 78000),
(5, 4, 1, 'Рука Валентин Артемович', '1224098122', '89766551223', '2022-04-14', 59000),
(6, 3, NULL, 'Щебетушка Григорий Демьянович', '6020123123', '89657821321', '2022-04-26', 30000),
(7, 5, NULL, 'Бессмертный Александр Сергеевич', '6010234123', '89679901122', '2022-04-14', 85000),
(8, 6, 1, 'Смертный Николай Александрович', '6012000123', '89123334551', '2022-04-25', 41000),
(9, 7, 1, 'Цибулько Алексей Витальевич', '6000123414', '89582110918', '2022-04-14', 35000),
(10, 7, 1, 'Цибулько Шенгиз Витальевич', '6005890123', '89678123123', '2022-04-14', 35000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brigades`
--
ALTER TABLE `brigades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `catalog_furniture`
--
ALTER TABLE `catalog_furniture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_designer` (`id_designer`),
  ADD KEY `catalog_furniture_ibfk_1` (`id_type`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`);

--
-- Индексы таблицы `feedback_types`
--
ALTER TABLE `feedback_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `furniture_types`
--
ALTER TABLE `furniture_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ordered_furniture`
--
ALTER TABLE `ordered_furniture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_furniture` (`id_furniture`),
  ADD KEY `id_order` (`id_order`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_ibfk_1` (`id_client`),
  ADD KEY `orders_ibfk_2` (`id_manager`),
  ADD KEY `orders_ibfk_3` (`id_service`);

--
-- Индексы таблицы `original_furniture`
--
ALTER TABLE `original_furniture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_brigade` (`id_brigade`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Индексы таблицы `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_department` (`id_department`),
  ADD KEY `workers_ibfk_2` (`id_brigade`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brigades`
--
ALTER TABLE `brigades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `catalog_furniture`
--
ALTER TABLE `catalog_furniture`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `feedback_types`
--
ALTER TABLE `feedback_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `furniture_types`
--
ALTER TABLE `furniture_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `ordered_furniture`
--
ALTER TABLE `ordered_furniture`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `original_furniture`
--
ALTER TABLE `original_furniture`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `workers`
--
ALTER TABLE `workers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `catalog_furniture`
--
ALTER TABLE `catalog_furniture`
  ADD CONSTRAINT `catalog_furniture_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `furniture_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `catalog_furniture_ibfk_2` FOREIGN KEY (`id_designer`) REFERENCES `workers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `feedback_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `ordered_furniture`
--
ALTER TABLE `ordered_furniture`
  ADD CONSTRAINT `ordered_furniture_ibfk_1` FOREIGN KEY (`id_furniture`) REFERENCES `catalog_furniture` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ordered_furniture_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_manager`) REFERENCES `workers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `original_furniture`
--
ALTER TABLE `original_furniture`
  ADD CONSTRAINT `original_furniture_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `original_furniture_ibfk_3` FOREIGN KEY (`id_type`) REFERENCES `furniture_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `original_furniture_ibfk_4` FOREIGN KEY (`id_brigade`) REFERENCES `brigades` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `workers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `workers_ibfk_2` FOREIGN KEY (`id_brigade`) REFERENCES `brigades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
