
ALTER TABLE `product` ADD COLUMN `brand_id` INTEGER NOT NULL,
    ADD COLUMN `categoryId` INTEGER NOT NULL;
CREATE TABLE `Product_Promotion` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `product_id` INTEGER NOT NULL,
    `promotion_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE TABLE `Promotion` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `banner_url` VARCHAR(191) NULL,
    `discount` INTEGER NULL,
    `point` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE TABLE `Product_Img` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(191) NOT NULL,
    `productId` INTEGER NOT NULL,
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE TABLE `Category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `count` INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE TABLE `Brand` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `count` INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `Product` ADD CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Product` ADD CONSTRAINT `Product_brand_id_fkey` FOREIGN KEY (`brand_id`) REFERENCES `Brand`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Product_Promotion` ADD CONSTRAINT `Product_Promotion_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Product_Promotion` ADD CONSTRAINT `Product_Promotion_promotion_id_fkey` FOREIGN KEY (`promotion_id`) REFERENCES `Promotion`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Product_Img` ADD CONSTRAINT `Product_Img_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
