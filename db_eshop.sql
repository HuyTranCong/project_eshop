-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 30, 2023 lúc 05:22 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_eshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(7, 4, 2, 3, 200.00, 'new', 1, 200.00, '2022-12-04 23:37:51', '2022-12-05 02:12:51'),
(8, 3, 2, 3, 100.00, 'new', 1, 100.00, '2022-12-04 23:37:55', '2022-12-05 02:12:51'),
(10, 3, 1, 2, 100.00, 'new', 1, 100.00, '2022-12-04 23:42:34', '2022-12-05 01:55:31'),
(11, 2, 1, 2, 200.00, 'new', 1, 200.00, '2022-12-04 23:42:51', '2022-12-05 01:55:31'),
(12, 1, 1, 2, 100.00, 'new', 1, 100.00, '2022-12-04 23:42:56', '2022-12-05 01:55:31'),
(14, 5, 3, 2, 100.00, 'new', 1, 100.00, '2022-12-05 17:08:46', '2022-12-05 17:49:55'),
(15, 4, 3, 2, 200.00, 'new', 1, 200.00, '2022-12-05 17:08:49', '2022-12-05 17:49:55'),
(16, 3, 4, 2, 100.00, 'new', 1, 100.00, '2022-12-05 17:51:21', '2022-12-05 17:51:44'),
(17, 4, 5, 2, 200.00, 'new', 3, 600.00, '2022-12-05 17:52:21', '2022-12-05 18:15:52'),
(18, 1, 6, 2, 100.00, 'new', 3, 300.00, '2022-12-05 18:40:52', '2022-12-05 18:43:31'),
(19, 1, 7, 1, 100.00, 'new', 1, 100.00, '2022-12-15 03:58:24', '2022-12-15 03:58:47'),
(20, 7, 7, 1, 10.00, 'new', 1, 10.00, '2022-12-15 03:58:34', '2022-12-15 03:58:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Accessories Fashion', 'active', '2022-12-02 18:21:09', '2023-01-29 20:47:20'),
(2, 'Woman\'s Fashion', 'active', '2022-12-02 18:21:40', '2022-12-02 18:21:40'),
(3, 'Sneaker', 'active', '2022-12-03 22:09:12', '2023-01-29 20:51:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(512) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(4, 'ORD-YLJILULLBX', 2, 100.00, NULL, 100.00, 1, 'cod', 'unpaid', 'new', 'Lò', 'User', 'user@gmail.com', '09876543211', 'gfdg', '2022-12-05 17:51:44', '2022-12-05 17:51:44'),
(5, 'ORD-WF8HDNFOTI', 2, 600.00, NULL, 600.00, 3, 'cod', 'unpaid', 'new', 'Lò', 'Admin', 'admin@gmail.com', '383747595', 'TP HCM', '2022-12-05 18:15:52', '2022-12-05 18:15:52'),
(6, 'ORD-OBX1Y8VXVB', 2, 300.00, 2, 500.00, 3, 'cod', 'unpaid', 'delivered', 'BABY', 'Tèo', 'user1@gmail.com', '0987654321', 'HA NOI', '2022-12-05 18:43:31', '2022-12-05 18:46:58'),
(7, 'ORD-BGVY7LFZJ2', 1, 110.00, 3, 410.00, 2, 'cod', 'unpaid', 'delivered', 'Lò', 'Admin', 'admin@gmail.com', '383747595', 'TP HCM', '2022-12-15 03:58:47', '2022-12-15 03:59:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(255) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `cat_id`, `created_at`, `updated_at`) VALUES
(1, 'TÚI XÁCH KẺ CHÉO ĐEN', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', '1675050559.jpg', 5, 'S', 'default', 'active', 100.00, 1, '2022-12-02 18:22:11', '2023-01-29 21:17:10'),
(2, 'JUPE LỤA HOA NỀN ĐEN NHÚN LY', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3>', '1675050248.jpg', 9, 'S,L', 'default', 'active', 200.00, 2, '2022-12-02 18:25:11', '2023-01-29 21:17:52'),
(3, 'JUPE GẤM ĐỎ QUẢ TRÁM ĐÍNH CÚC', 'abcefu', '1675050240.jpg', 10, 'S,M,L,XL', 'new', 'active', 100.00, 2, '2022-12-03 09:55:39', '2023-01-29 21:18:30'),
(4, 'TÚI XÁCH DÂY XÍCH TRẮNG', 'ok', '1675050535.jpg', 15, 'S', 'hot', 'active', 200.00, 1, '2022-12-03 10:55:32', '2023-01-29 21:18:13'),
(5, 'TÚI XÁCH DA TRƠN KHAKI', 'abc', '1675050504.jpg', 10, 'S', 'new', 'active', 100.00, 1, '2022-12-03 20:56:27', '2023-01-29 21:17:27'),
(7, 'JUPE ĐỎ XẾP BÈO CHỒNG', 'HEHE', '1675050225.jpg', 10, 'S', 'default', 'active', 10.00, 2, '2022-12-15 03:57:44', '2023-01-29 21:16:30'),
(8, 'GIÀY TRẮNG MŨI VUÔNG', NULL, '1675050723.jpg', 100, '', 'new', 'active', 100.00, 3, '2023-01-29 20:52:03', '2023-01-29 21:14:38'),
(9, 'GIÀY ĐEN VIỀN XÍCH', NULL, '1675050756.jpg', 10, '', 'hot', 'active', 20000.00, 3, '2023-01-29 20:52:36', '2023-01-29 20:52:36'),
(10, 'SM TƠ NHŨ BE CUỐN HOA NGỰC', NULL, '1675052357.jpg', 20, '', 'new', 'active', 3000.00, 2, '2023-01-29 21:19:17', '2023-01-29 21:19:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TIET KIEM', '100.00', 'active', '2022-12-03 03:10:13', '2022-12-03 03:10:13'),
(2, 'NHANH', '200.00', 'active', '2022-12-03 03:10:38', '2022-12-03 03:10:38'),
(3, 'HOA TOC', '300.00', 'active', '2022-12-03 03:10:53', '2022-12-03 03:10:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Văn Ad Minn', 'admin@gmail.com', NULL, '$2y$10$5dkK6/9MynKC23i6pFEXxeuRr8xIJ0NYPxR2.jWrrQtXow3XHMFdC', NULL, 'admin', NULL, NULL, 'active', NULL, '2022-12-02 13:16:42', '2022-12-02 13:16:42'),
(2, 'Lò Văn User', 'user1@gmail.com', NULL, '$2y$10$cmn.aA/7pzP/Owmr8mLHYeC13HkYwV/OKxVLqfvv602LJ82VPYEeO', NULL, 'user', NULL, NULL, 'active', NULL, '2022-12-02 13:23:33', '2022-12-02 13:23:33'),
(3, 'Tèo', 'user2@gmail.com', NULL, '$2y$10$/4wG4QBiAJKDLXCuov2jEOwTBkecAwMXhxUOqgwlxPTAD7oKmeCSS', NULL, 'user', NULL, NULL, 'active', NULL, '2022-12-02 21:58:20', '2022-12-02 21:58:20'),
(4, 'user123', 'user3@gmail.com', NULL, '$2y$10$el.dM41n5TrHJq3KtIu9pOb15vT53x4Z9prSL4L8RAChNFoXW5kOy', NULL, 'user', NULL, NULL, 'active', NULL, '2022-12-05 18:48:04', '2022-12-05 18:48:24');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `email` (`email`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
