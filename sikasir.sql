/*
SQLyog Community v11.3 (64 bit)
MySQL - 5.7.19-log : Database - gainpos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `adjust_product_stock_types` */

DROP TABLE IF EXISTS `adjust_product_stock_types`;

CREATE TABLE `adjust_product_stock_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `adjust_product_stock_types` */

insert  into `adjust_product_stock_types`(`id`,`title`,`created_by`,`created_at`,`updated_at`) values (1,'Damaged Product',1,'2022-07-19 01:21:23',NULL);

/*Table structure for table `branches` */

DROP TABLE IF EXISTS `branches`;

CREATE TABLE `branches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taxable` tinyint(4) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `is_cash_register` tinyint(4) NOT NULL,
  `is_shipment` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `branches` */

insert  into `branches`(`id`,`name`,`branch_type`,`taxable`,`is_default`,`tax_id`,`is_cash_register`,`is_shipment`,`user_id`,`created_by`,`created_at`,`updated_at`) values (1,'Main Branch','retail',1,1,1,1,0,0,1,'2022-07-19 01:21:23',NULL);
insert  into `branches`(`id`,`name`,`branch_type`,`taxable`,`is_default`,`tax_id`,`is_cash_register`,`is_shipment`,`user_id`,`created_by`,`created_at`,`updated_at`) values (2,'Cabang pertama','retail',0,0,0,1,1,6,1,'0000-00-00 00:00:00',NULL);
insert  into `branches`(`id`,`name`,`branch_type`,`taxable`,`is_default`,`tax_id`,`is_cash_register`,`is_shipment`,`user_id`,`created_by`,`created_at`,`updated_at`) values (3,'Cabang kedua','retail',0,0,0,1,1,8,1,'0000-00-00 00:00:00',NULL);

/*Table structure for table `cash_register_logs` */

DROP TABLE IF EXISTS `cash_register_logs`;

CREATE TABLE `cash_register_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cash_register_id` int(11) NOT NULL,
  `opening_amount` double DEFAULT NULL,
  `closing_amount` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `opening_time` datetime DEFAULT NULL,
  `closing_time` datetime DEFAULT NULL,
  `opened_by` int(11) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cash_register_logs` */

insert  into `cash_register_logs`(`id`,`user_id`,`cash_register_id`,`opening_amount`,`closing_amount`,`status`,`opening_time`,`closing_time`,`opened_by`,`closed_by`,`note`,`created_at`,`updated_at`) values (1,'6',2,500000,1000,'closed','2022-07-22 20:15:00','2022-08-04 06:38:00',6,1,'ok','2022-07-22 13:15:11','2022-08-03 23:38:05');
insert  into `cash_register_logs`(`id`,`user_id`,`cash_register_id`,`opening_amount`,`closing_amount`,`status`,`opening_time`,`closing_time`,`opened_by`,`closed_by`,`note`,`created_at`,`updated_at`) values (2,'1',1,2000,NULL,'open','2022-08-04 06:38:00',NULL,1,NULL,NULL,'2022-08-03 23:38:24','2022-08-03 23:38:24');

/*Table structure for table `cash_registers` */

DROP TABLE IF EXISTS `cash_registers`;

CREATE TABLE `cash_registers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `sales_invoice_id` int(11) NOT NULL,
  `receiving_invoice_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `multiple_access` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `cash_registers` */

insert  into `cash_registers`(`id`,`title`,`branch_id`,`sales_invoice_id`,`receiving_invoice_id`,`created_by`,`multiple_access`,`created_at`,`updated_at`) values (1,'Main Cash Register',1,1,2,1,0,'2022-07-19 01:21:23',NULL);
insert  into `cash_registers`(`id`,`title`,`branch_id`,`sales_invoice_id`,`receiving_invoice_id`,`created_by`,`multiple_access`,`created_at`,`updated_at`) values (2,'Cpertama Cash Register',2,2,4,1,0,'2022-07-22 13:03:48','2022-07-22 13:07:11');
insert  into `cash_registers`(`id`,`title`,`branch_id`,`sales_invoice_id`,`receiving_invoice_id`,`created_by`,`multiple_access`,`created_at`,`updated_at`) values (3,'Main Cash Register',3,2,4,1,0,'2022-07-22 13:19:29','2022-07-22 13:19:29');

/*Table structure for table `corn_job_logs` */

DROP TABLE IF EXISTS `corn_job_logs`;

CREATE TABLE `corn_job_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `corn_job_logs` */

/*Table structure for table `customer_groups` */

DROP TABLE IF EXISTS `customer_groups`;

CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_default` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer_groups` */

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tin_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `customer_group` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customers` */

/*Table structure for table `email_templates` */

DROP TABLE IF EXISTS `email_templates`;

CREATE TABLE `email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `email_templates` */

insert  into `email_templates`(`id`,`template_type`,`template_subject`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (1,'user_invitation','You are invited','<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi,<br>\n                {invited_by} invited you to join with the team on {app_name}.<br>\n                Please click the link below to accept the invitation!<br>\n                {verification_link}        </div>\n                            </div>\n                        </html>','',NULL,NULL);
insert  into `email_templates`(`id`,`template_type`,`template_subject`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (2,'account_verification','Account verification','<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {first_name},<br>\n                        Your account has been created.<br>\n                        Please click the link below to verify your email.<br>\n                        {verification_link}        </div>\n                            </div>\n                        </html>','',NULL,NULL);
insert  into `email_templates`(`id`,`template_type`,`template_subject`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (3,'reset_password','Reset password','<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi,<br>\n                        You have requested to change your password.<br>\n                        Please click the link below to change your password!<br>\n                        {reset_password_link}        </div>\n                            </div>\n                        </html>','',NULL,NULL);
insert  into `email_templates`(`id`,`template_type`,`template_subject`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (4,'pos_invoice','Invoice','<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {first_name},<br>\n                        Thanks for shopping with us.<br>\n                        Please find the attachment for your purchase ({invoice_id}) details.        </div>\n                            </div>\n                        </html>','',NULL,NULL);
insert  into `email_templates`(`id`,`template_type`,`template_subject`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (5,'low_stock','Low Stock Template','<div style=\"text-align: center; font-family: DejaVu Sans, \'Lato\', sans-serif;\">\n                            <p>{app_logo}</p>\n                            <h1 style=\"font-weight: lighter; margin-bottom: 0;\">{app_name}</h1>\n                            <br>\n                            <small>Low Stock Notification</small>\n                            <br>\n                            <h3 style=\"text-align:center;\">Out Of Stock List</h3>\n                        </div>\n                        <!--header bottom start-->\n                        <div style=\"margin-bottom:-30px; height:170px; width: 100%; overflow: hidden; display: block; font-family: DejaVu Sans, \'Lato\', sans-serif;\">\n                                <div style=\"float:left; width: 50%;\">\n                                    <p style=\"font-weight:bold;\">Branch Name: <span>{branch_name}</span></p>\n                                    <p style=\"font-weight:bold;\">Branch Manager: <span>{branch_manager}</span></p>\n                                </div>\n                                <div style=\"float:right; width: 45%;\">\n                                    <p style=\"font-weight:bold; text-align: right;\">Date : <span>{date}</span></p>\n                                    <p style=\"font-weight:bold; text-align: right;\">Time : <span>{time}</span></p>\n                                </div>\n                        </div>\n                        <table style=\"border-top: 1px solid #bfbfbf; border-bottom: 1px solid #bfbfbf; border-collapse: collapse; font-weight:500; width: 100%; max-width: 100%; margin-bottom: 0; background-color: transparent; font-family: DejaVu Sans, \'Lato\', sans-serif;\">\n                            <tr>\n                                <th style=\"text-align: left; padding: 7px 0; border-bottom: 1px solid #bfbfbf; width: 40%;\">Item</th>\n                                <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Re Order</th>\n                                <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Qty</th>\n                            </tr><br><td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{item_details}</td></table>','',NULL,NULL);

/*Table structure for table `invites` */

DROP TABLE IF EXISTS `invites`;

CREATE TABLE `invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invited_as` int(11) NOT NULL,
  `invited_branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `invited_by` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `invites` */

/*Table structure for table `invoice_templates` */

DROP TABLE IF EXISTS `invoice_templates`;

CREATE TABLE `invoice_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default_template` tinyint(4) NOT NULL,
  `invoice_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `invoice_templates` */

insert  into `invoice_templates`(`id`,`template_title`,`template_type`,`is_default_template`,`invoice_size`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (1,'Thermal Sales Invoice','sales',1,'thermal','<div class=\"pos\">\n                <div class=\"pos__item pos__item--header\">\n                    <!--Invoice Logo-->\n                    <img src=\"{logo_source}\" class=\"img-fluid\"\n                        alt=\"\">\n                    <div class=\"pos__item--header__title\">\n                        <h3>{app_name}</h3>\n                        <p>Sales Invoice</p>\n                        <small>{date} - {time}</small>\n                    </div>\n                    <!--Invoice Info-->\n                    <div class=\"pos__item--header__info\">\n                        <p> <span>Invoice ID: {invoice_id}</span> </p>\n                        <p> <span>Sold To: {customer_name}</span> </p>\n                        <p> <span>Sold By: {employee_name}</span> </p>\n                        <p> <span>Phone: {phone_number}</span> </p>\n                        <p> <span>Address: {address}</span> </p>\n                        <p> <span>TIN: {tin}</span> </p>\n                        <p> <span>Note: {note}</span> </p>\n                    </div>\n                </div>\n                <!--Invoice Body-->\n                <div class=\"pos__item pos__item--body\">\n                    <div class=\"pos__item--body__content\">\n                        <table class=\"\">\n                            <thead>\n                                <tr>\n                                    <th>Price</th>\n                                    <th>Disc%</th>\n                                    <th>Total</th>\n                                </tr>\n                            </thead>\n                            <tbody>\n                                <tr><td>{item_details}</td></tr>\n                            </tbody>\n                        </table>\n                        <div class=\"dashed-separator\"></div>\n                        <table>\n                            <tbody>\n                                <tr>\n                                    <td>Subtotal</td>\n                                    <td>{sub_total}</td>\n                                </tr>\n                                <tr>\n                                    <td>Shipment</td>\n                                    <td>{shipment_amount}</td>\n                                </tr>\n                                <tr>\n                                    <td>Tax</td>\n                                    <td>{tax}</td>\n                                </tr>\n                                <tr>\n                                    <td>Discount</td>\n                                    <td>{discount}</td>\n                                </tr>\n                                <tr>\n                                    <td>Total</td>\n                                    <td>{total}</td>\n                                </tr>\n                                <tr>{payment_details}</tr>\n                                <tr>\n                                    <td>Exchange</td>\n                                    <td>{exchange}</td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </div>\n                </div>\n                <div class=\"pos__item pos__item--footer\">\n                    <div class=\"shipment-address\">{shipment_address}</div>\n                    <div class=\"barcode\">{barcode}</div>\n                </div>\n            </div>\n            ','',NULL,NULL);
insert  into `invoice_templates`(`id`,`template_title`,`template_type`,`is_default_template`,`invoice_size`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (2,'Thermal Purchase Invoice','receiving',1,'thermal','\n               <div class=\"pos\">\n                <div class=\"pos__item pos__item--header\">\n                    <!--Invoice Logo-->\n                    <img src=\"{logo_source}\" class=\"img-fluid\"\n                        alt=\"\">\n                    <div class=\"pos__item--header__title\">\n                        <h3>{app_name}</h3>\n                        <p>Purchase Invoice</p>\n                        <small>{date} - {time}</small>\n                    </div>\n                    <!--Invoice Info-->\n                    <div class=\"pos__item--header__info\">\n                        <p> <span>Invoice ID: {invoice_id}</span> </p>\n                        <p> <span>Supplier: {supplier_name}</span> </p>\n                        <p> <span>TIN: {tin}</span> </p>\n                        <p> <span>Purchased By: {employee_name}</span> </p>\n                    </div>\n                </div>\n                <!--Invoice Body-->\n                <div class=\"pos__item pos__item--body\">\n                    <div class=\"pos__item--body__content\">\n                        <table class=\"\">\n                            <thead>\n                                <tr>\n                                    <th>Price</th>\n                                    <th>Disc%</th>\n                                    <th>Total</th>\n                                </tr>\n                            </thead>\n                            <tbody>\n                                <tr><td>{item_details}</td></tr>\n                            </tbody>\n                        </table>\n                        <div class=\"dashed-separator\"></div>\n                        <table>\n                            <tbody>\n                                <tr>\n                                    <td>Subtotal</td>\n                                    <td>{sub_total}</td>\n                                </tr>\n                                <tr>\n                                    <td>Tax</td>\n                                    <td>{tax}</td>\n                                </tr>\n                                <tr>\n                                    <td>Discount</td>\n                                    <td>{discount}</td>\n                                </tr>\n                                <tr>\n                                    <td>Total</td>\n                                    <td>{total}</td>\n                                </tr>\n                                <tr>{payment_details}</tr>\n                                <tr>\n                                    <td>Exchange</td>\n                                    <td>{exchange}</td>\n                                </tr>\n                            </tbody>\n                        </table>\n                    </div>\n                </div>\n                <div class=\"pos__item pos__item--footer\">\n                    <div class=\"barcode\">{barcode}</div>\n                </div>\n            </div>\n            ','',NULL,NULL);
insert  into `invoice_templates`(`id`,`template_title`,`template_type`,`is_default_template`,`invoice_size`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (3,'Small Sales Invoice','sales',0,'small','<div class=\"invoice-page-wrapper\">\n                <div class=\"thermal-invoice\" style=\"width: 70mm;\">\n                    <!--Invoice Header-->\n                    <div class=\"text-center invoice-header mb-3\">\n                    \n                        <!--Invoice Logo-->\n                        <img src=\"{logo_source}\" class=\"img-fluid\" alt=\"\">\n                        <div class=\"app-name my-2\">{app_name}</div>\n                        <div class=\"invoice-type my-2\">\n                            <span class=\"text-uppercase font-weight-bold\">Sales Invoice</span>\n                        </div>\n                        <small class=\"invoice-date\">\n                            {date} - {time}\n                        </small>\n                    </div>\n    \n                    <!--Invoice Info-->\n                    <div class=\"mb-3 font-weight-bold invoice-info\">\n                        <p>\n                            <span>Invoice ID: {invoice_id}</span> \n                        </p>\n                         <p >\n                            <span>Sold To: {customer_name}</span> \n                        </p>\n                        <p>\n                            <span>Sold By: {employee_name}</span> \n                        </p>\n                        <p>\n                            <span>Phone: {phone_number}</span> \n                        </p>\n                        <p>\n                            <span>Address: {address}</span> \n                        </p>\n                        <p>\n                            <span>TIN: {tin}</span> \n                        </p>\n                        <p>\n                            <span>Note: {note}</span> \n                        </p>\n                    </div>\n    \n                    <!--Invoice Body-->\n                    <table class=\"table table-borderless\">\n                        <tbody class=\"font-weight-bold\">\n                            <tr class=\"border-top border-bottom t-header\">\n                                <th class=\"w-25 pl-0\">Price</th>\n                                <th class=\"text-right\">Qty</th>\n                                <th class=\"text-right\">Disc%</th>\n                                <th class=\"text-right pr-0\">Total</th>\n                            </tr>\n                            <tr><td>{item_details}</td></tr>\n                            <tr class=\"t-footer border-top\">\n                                <td class=\"text-left\">Subtotal</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{sub_total}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Shipment</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{shipment_amount}</td>\n                            </tr>\n                            <tr class=\"t-footer\"> \n                                <td class=\"text-left\">Tax</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{tax}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Discount</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{discount}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Total</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{total}</td>\n                            </tr>\n                            <tr><td>{payment_details}</td></tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Exchange</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{exchange}</td>\n                            </tr>\n                        </tbody>\n                    </table>\n                    <div class=\"shipment-address\">{shipment_address}</div>\n                    <div class=\"text-center\">{barcode}</div>\n                </div>\n            </div>','',NULL,NULL);
insert  into `invoice_templates`(`id`,`template_title`,`template_type`,`is_default_template`,`invoice_size`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (4,'Small Purchase Invoice','receiving',0,'small','<div class=\"invoice-page-wrapper\">\n                <div class=\"thermal-invoice\" style=\"width: 70mm;\">\n                    <!--Invoice Header-->\n                    <div class=\"text-center invoice-header mb-3\">\n                    \n                        <!--Invoice Logo-->\n                         <img src=\"{logo_source}\" width=\"100\" class=\"img-fluid\" alt=\"\">\n                        <div class=\"app-name my-2\">{app_name}</div>\n                        <div>\n                            <h6 class=\"text-uppercase font-weight-bold\">Purchase Invoice</h6>\n                        </div>\n                        <small class=\"font-weight-bold\">\n                            {date} - {time}\n                        </small>\n                    </div>\n    \n                    <!--Invoice Info-->\n                    <div class=\"mb-3 font-weight-bold invoice-info\">\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Invoice ID: </span> {invoice_id}\n                        </p>\n                         <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Supplier: </span> {supplier_name}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">TIN: </span> {tin}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Purchased By: </span> {employee_name}\n                        </p>\n                    </div>\n    \n                    <!--Invoice Body-->\n                    <table class=\"table table-borderless\">\n                        <tbody class=\"font-weight-bold\">\n                            <tr class=\"border-top border-bottom t-header\">\n                                <th class=\"w-25 pl-0\">Price</th>\n                                <th class=\"text-right\">Qty</th>\n                                <th class=\"text-right\">Disc%</th>\n                                <th class=\"text-right pr-0\">Total</th>\n                            </tr>\n                            <tr><td>{item_details}</td></tr>\n                            <tr class=\"t-footer border-top\">\n                                <td>Subtotal</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{sub_total}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Tax</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{tax}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Discount</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{discount}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Total</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{total}</td>\n                            </tr>\n                            <tr><td>{payment_details}</td></tr>\n                            <tr class=\"t-footer\">\n                                <td>Exchange</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{exchange}</td>\n                            </tr>\n                        </tbody>\n                    </table>\n                    <div class=\"text-center\">{barcode}</div>\n                </div>\n            </div>','',NULL,NULL);
insert  into `invoice_templates`(`id`,`template_title`,`template_type`,`is_default_template`,`invoice_size`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (5,'Large Sales Invoice','sales',0,'large','<div class=\"invoice-page-wrapper\">\n                <div class=\"thermal-invoice\" style=\"width: 95mm;\">\n                    <!--Invoice Header-->\n                    <div class=\"text-center invoice-header mb-3\">\n                    \n                        <!--Invoice Logo-->\n                        <img src=\"{logo_source}\" width=\"100\" class=\"img-fluid\" alt=\"\">\n                        <div class=\"app-name my-2\">{app_name}</div>\n                        <div>\n                            <h6 class=\"text-uppercase font-weight-bold\">Sales Invoice</h6>\n                        </div>\n                        <small class=\"font-weight-bold\">\n                            {date} - {time}\n                        </small>\n                    </div>\n    \n                    <!--Invoice Info-->\n                    <div class=\"mb-3 font-weight-bold invoice-info\">\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Invoice ID: </span> {invoice_id}\n                        </p>\n                         <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Sold To: </span> {customer_name}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Sold By: </span> {employee_name}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Phone: </span> {phone_number}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Address: </span> {address}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">TIN: </span> {tin}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Note: </span> {note}\n                        </p>\n                    </div>\n    \n                    <!--Invoice Body-->\n                    <table class=\"table table-borderless\">\n                        <tbody class=\"font-weight-bold\">\n                            <tr class=\"border-top border-bottom t-header\">\n                                <th class=\"pl-0\">Items</th>\n                                <th class=\"text-right\">Qty</th>\n                                <th class=\"text-right\">Price</th>\n                                <th class=\"text-right\">Discount</th>\n                                <th class=\"text-right pr-0\">Total</th>\n                            </tr>\n                            <tr><td>{item_details}</td></tr>\n                            <tr class=\"t-footer border-top\">\n                                <td class=\"text-left\">Subtotal</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{sub_total}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Shipment</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{shipment_amount}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Tax</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{tax}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Discount</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{discount}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Total</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{total}</td>\n                            </tr>\n                            <tr><td>{payment_details}</td></tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Exchange</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{exchange}</td>\n                            </tr>\n                        </tbody>\n                    </table>\n                    <div class=\"shipment-address\">{shipment_address}</div>\n                    <div class=\"text-center\">{barcode}</div>\n                </div>\n            </div>','',NULL,NULL);
insert  into `invoice_templates`(`id`,`template_title`,`template_type`,`is_default_template`,`invoice_size`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (6,'Large Purchase Invoice','receiving',0,'large','<div class=\"invoice-page-wrapper\">\n                <div class=\"thermal-invoice\" style=\"width: 95mm;\">\n                    <!--Invoice Header-->\n                    <div class=\"text-center invoice-header mb-3\">\n                    \n                        <!--Invoice Logo-->\n                       <img src=\"{logo_source}\" width=\"100\" class=\"img-fluid\" alt=\"\">\n                        <div class=\"app-name my-2\">{app_name}</div>\n                        <div>\n                            <h6 class=\"text-uppercase font-weight-bold\">Purchase Invoice</h6>\n                        </div>\n                        <small class=\"font-weight-bold\">\n                            {date} - {time}\n                        </small>\n                    </div>\n    \n                    <!--Invoice Info-->\n                    <div class=\"mb-3 font-weight-bold invoice-info\">\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Invoice ID: </span> {invoice_id}\n                        </p>\n                         <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Supplier: </span> {supplier_name}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">TIN: </span> {tin}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Purchased By: </span> {employee_name}\n                        </p>\n                    </div>\n    \n                    <!--Invoice Body-->\n                    <table class=\"table table-borderless\">\n                        <tbody class=\"font-weight-bold\">\n                            <tr class=\"border-top border-bottom t-header\">\n                                <th class=\"pl-0\">Items</th>\n                                <th class=\"text-right\">Qty</th>\n                                <th class=\"text-right\">Price</th>\n                                <th class=\"text-right\">Discount</th>\n                                <th class=\"text-right pr-0\">Total</th>\n                            </tr>\n                            <tr><td>{item_details}</td></tr>\n                            <tr class=\"t-footer border-top\">\n                                <td>Subtotal</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{sub_total}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Tax</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{tax}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Discount</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{discount}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Total</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{total}</td>\n                            </tr>\n                            <tr><td>{payment_details}</td></tr>\n                            <tr class=\"t-footer\">\n                                <td>Exchange</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{exchange}</td>\n                            </tr>\n                        </tbody>\n                    </table>\n                    <div class=\"text-center\">{barcode}</div>\n                </div>\n            </div>','',NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (2,'2014_10_12_100000_create_password_resets_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (3,'2018_03_04_124154_create_settings_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (4,'2018_03_05_134724_create_roles_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (5,'2018_03_06_125804_create_email_templates_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (6,'2018_03_11_081629_create_invites_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (7,'2018_04_04_122419_create_notifications_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (8,'2018_04_23_093600_create_product_categories_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (9,'2018_04_23_094449_create_payment_types_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (10,'2018_04_23_133454_create_customer_groups_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (11,'2018_04_24_065209_create_product_brands_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (12,'2018_04_24_074704_create_product_groups_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (13,'2018_04_24_114457_create_products_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (14,'2018_04_24_120528_create_product_variants_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (15,'2018_04_24_123129_create_product_attributes_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (16,'2018_04_25_063137_create_taxes_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (17,'2018_04_25_113030_create_branches_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (18,'2018_05_06_093016_create_product_attribute_values_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (19,'2018_09_24_121807_create_orders_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (20,'2018_09_24_122120_create_order_items_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (21,'2018_09_24_122145_create_payments_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (22,'2018_09_25_102442_create_cash_registers_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (23,'2018_10_18_080804_create_cash_register_logs_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (24,'2018_12_26_065902_create_product_units_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (25,'2019_04_15_074946_create_customers_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (26,'2019_04_15_080443_create_suppliers_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (27,'2019_05_29_073208_create_shortcut_keys_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (28,'2019_08_26_071749_invoice_template_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (29,'2019_10_03_110011_create_restaurant_tables_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (30,'2019_11_21_100102_create_adjust_product_stock_types_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (31,'2019_11_26_072652_create_todo_lists_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (32,'2019_12_26_082431_create_corn_job_logs_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (33,'2020_02_17_071037_create_sms_templates_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (34,'2020_03_09_122331_create_shipping_areas_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (35,'2020_03_11_083720_create_shipping_information_table',1);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `booking_id` int(11) NOT NULL,
  `booking_by` int(11) NOT NULL,
  `notify_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `read_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `notifications` */

/*Table structure for table `order_items` */

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double(8,2) NOT NULL,
  `price` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL DEFAULT '0.00',
  `sub_total` double(20,2) NOT NULL DEFAULT '0.00',
  `tax_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `adjust_stock_type_id` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `order_items` */

insert  into `order_items`(`id`,`product_id`,`variant_id`,`type`,`quantity`,`price`,`discount`,`sub_total`,`tax_id`,`order_id`,`adjust_stock_type_id`,`note`,`created_at`,`updated_at`) values (1,1,1,'receiving',10.00,1100.00,0.00,11000.00,NULL,1,0,NULL,'2022-07-22 13:15:46','2022-07-22 13:15:46');
insert  into `order_items`(`id`,`product_id`,`variant_id`,`type`,`quantity`,`price`,`discount`,`sub_total`,`tax_id`,`order_id`,`adjust_stock_type_id`,`note`,`created_at`,`updated_at`) values (2,1,1,'sales',-1.00,1500.00,0.00,1500.00,NULL,2,0,NULL,'2022-07-22 13:16:41','2022-07-22 13:16:41');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `order_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sales_note` longtext COLLATE utf8_unicode_ci,
  `sub_total` double(20,2) NOT NULL,
  `total_tax` double(20,2) NOT NULL DEFAULT '0.00',
  `due_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `total` double(20,2) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profit` double(20,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `all_discount` double(20,2) NOT NULL DEFAULT '0.00',
  `customer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `transfer_branch_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `returned_invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `return_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orders` */

insert  into `orders`(`id`,`date`,`order_type`,`sales_note`,`sub_total`,`total_tax`,`due_amount`,`total`,`type`,`profit`,`status`,`all_discount`,`customer_id`,`supplier_id`,`branch_id`,`transfer_branch_id`,`table_id`,`created_by`,`returned_invoice`,`return_type`,`invoice_id`,`created_at`,`updated_at`) values (1,'2022-07-22','receiving',NULL,11000.00,0.00,0.00,11000.00,'supplier',0.00,'done',0.00,NULL,NULL,2,NULL,NULL,6,NULL,NULL,'1','2022-07-22 20:15:00','2022-07-22 13:15:46');
insert  into `orders`(`id`,`date`,`order_type`,`sales_note`,`sub_total`,`total_tax`,`due_amount`,`total`,`type`,`profit`,`status`,`all_discount`,`customer_id`,`supplier_id`,`branch_id`,`transfer_branch_id`,`table_id`,`created_by`,`returned_invoice`,`return_type`,`invoice_id`,`created_at`,`updated_at`) values (2,'2022-07-22','sales','beli 1',1500.00,0.00,0.00,1500.00,'customer',400.00,'done',0.00,NULL,NULL,2,NULL,NULL,6,NULL,NULL,'1','2022-07-22 20:16:00','2022-07-22 13:16:41');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `payment_types` */

DROP TABLE IF EXISTS `payment_types`;

CREATE TABLE `payment_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `payment_types` */

insert  into `payment_types`(`id`,`name`,`type`,`status`,`is_default`,`created_by`,`created_at`,`updated_at`) values (1,'Cash','cash','no_round',1,1,NULL,NULL);
insert  into `payment_types`(`id`,`name`,`type`,`status`,`is_default`,`created_by`,`created_at`,`updated_at`) values (2,'Credit','credit','no_round',0,1,NULL,NULL);

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `paid` double(20,2) NOT NULL,
  `exchange` double(20,2) DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `payments` */

insert  into `payments`(`id`,`date`,`paid`,`exchange`,`payment_method`,`options`,`order_id`,`cash_register_id`,`is_active`,`created_at`,`updated_at`) values (1,'2022-07-22',11000.00,0.00,1,'a:0:{}',1,2,1,'2022-07-22 20:15:00',NULL);
insert  into `payments`(`id`,`date`,`paid`,`exchange`,`payment_method`,`options`,`order_id`,`cash_register_id`,`is_active`,`created_at`,`updated_at`) values (2,'2022-07-22',1500.00,0.00,1,'a:0:{}',2,2,1,'2022-07-22 20:16:00',NULL);

/*Table structure for table `product_attribute_values` */

DROP TABLE IF EXISTS `product_attribute_values`;

CREATE TABLE `product_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `values` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `product_attribute_values` */

/*Table structure for table `product_attributes` */

DROP TABLE IF EXISTS `product_attributes`;

CREATE TABLE `product_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `product_attributes` */

/*Table structure for table `product_brands` */

DROP TABLE IF EXISTS `product_brands`;

CREATE TABLE `product_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `product_brands` */

insert  into `product_brands`(`id`,`name`,`created_by`,`created_at`,`updated_at`) values (1,'Mayora',6,'2022-07-22 13:12:25','2022-07-22 13:12:25');

/*Table structure for table `product_categories` */

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `product_categories` */

insert  into `product_categories`(`id`,`name`,`created_by`,`created_at`,`updated_at`) values (1,'Minuman',6,'2022-07-22 13:12:10','2022-07-22 13:12:10');

/*Table structure for table `product_groups` */

DROP TABLE IF EXISTS `product_groups`;

CREATE TABLE `product_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `product_groups` */

insert  into `product_groups`(`id`,`name`,`created_by`,`created_at`,`updated_at`) values (1,'Instan',0,'2022-07-22 13:12:36','2022-07-22 13:12:36');

/*Table structure for table `product_units` */

DROP TABLE IF EXISTS `product_units`;

CREATE TABLE `product_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `product_units` */

insert  into `product_units`(`id`,`name`,`short_name`,`created_by`,`created_at`,`updated_at`) values (1,'Sachet','sct',0,'2022-07-22 13:13:06','2022-07-22 13:13:06');

/*Table structure for table `product_variants` */

DROP TABLE IF EXISTS `product_variants`;

CREATE TABLE `product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variant_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute_values` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `variant_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_price` double(20,2) NOT NULL,
  `selling_price` double(20,2) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `isNotify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imageURL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no_image.png',
  `bar_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `re_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variants_sku_unique` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `product_variants` */

insert  into `product_variants`(`id`,`sku`,`product_id`,`variant_title`,`attribute_values`,`variant_details`,`purchase_price`,`selling_price`,`enabled`,`isNotify`,`imageURL`,`bar_code`,`re_order`,`created_at`,`updated_at`) values (1,'skukopi1',1,'default_variant','default_variant',NULL,1100.00,1500.00,1,NULL,'no_image.png','123323',10,'2022-07-22 13:14:20','2022-07-22 13:16:41');
insert  into `product_variants`(`id`,`sku`,`product_id`,`variant_title`,`attribute_values`,`variant_details`,`purchase_price`,`selling_price`,`enabled`,`isNotify`,`imageURL`,`bar_code`,`re_order`,`created_at`,`updated_at`) values (2,'skusujahe',2,'default_variant','default_variant',NULL,1300.00,2000.00,1,NULL,'no_image.png','1223232',10,'2022-07-25 13:01:00','2022-07-25 13:01:00');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `taxable` tinyint(4) NOT NULL DEFAULT '0',
  `tax_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_id` tinyint(1) DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `imageURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`title`,`description`,`category_id`,`brand_id`,`unit_id`,`group_id`,`taxable`,`tax_type`,`tax_id`,`product_type`,`branch_id`,`imageURL`,`created_by`,`created_at`,`updated_at`) values (1,'Kopi','Kopi arabika',1,1,1,1,0,'',NULL,'standard',2,'product_21056110.png',6,'2022-07-22 13:14:20','2022-07-22 13:14:20');
insert  into `products`(`id`,`title`,`description`,`category_id`,`brand_id`,`unit_id`,`group_id`,`taxable`,`tax_type`,`tax_id`,`product_type`,`branch_id`,`imageURL`,`created_by`,`created_at`,`updated_at`) values (2,'sujahe','susu jahe sehattt bermanfaattt',1,1,1,1,0,'',NULL,'standard',3,'no_image.png',8,'2022-07-25 13:01:00','2022-07-25 13:01:00');

/*Table structure for table `restaurant_tables` */

DROP TABLE IF EXISTS `restaurant_tables`;

CREATE TABLE `restaurant_tables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'available',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `restaurant_tables` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`title`,`permissions`,`created_by`,`created_at`,`updated_at`) values (1,'Manager Branch','a:26:{i:0;s:34:\"can_see_personal_receiving_reports\";i:1;s:30:\"can_see_personal_sales_reports\";i:2;s:30:\"can_close_others_cash_register\";i:3;s:23:\"can_see_customer_groups\";i:4;s:24:\"can_see_customer_details\";i:5;s:26:\"can_manage_customer_groups\";i:6;s:17:\"can_see_customers\";i:7;s:20:\"can_manage_customers\";i:8;s:19:\"can_manage_receives\";i:9;s:24:\"can_see_supplier_details\";i:10;s:17:\"can_see_suppliers\";i:11;s:17:\"can_add_suppliers\";i:12;s:22:\"can_manage_sales_price\";i:13;s:16:\"can_manage_sales\";i:14;s:19:\"can_manage_products\";i:15;s:16:\"can_see_products\";i:16;s:21:\"can_manage_categories\";i:17;s:18:\"can_see_categories\";i:18;s:17:\"can_manage_brands\";i:19;s:14:\"can_see_brands\";i:20;s:17:\"can_manage_groups\";i:21;s:14:\"can_see_groups\";i:22;s:28:\"can_manage_variant_attribute\";i:23;s:25:\"can_see_variant_attribute\";i:24;s:16:\"can_manage_units\";i:25;s:13:\"can_see_units\";}',1,'2022-07-22 13:09:17','2022-07-25 14:33:42');

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `setting_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (1,'time_format','12h','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (2,'date_format','Y-m-d','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (3,'currency_symbol','Rp.','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (4,'currency_format','left-space','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (5,'thousand_separator','space','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (6,'language_setting','english','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (7,'decimal_separator',',','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (8,'number_of_decimal','0','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (9,'offday_setting','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (10,'email_from_name','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (11,'email_from_address','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (12,'email_driver','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (13,'email_smtp_host','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (14,'email_port','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (15,'email_smtp_password','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (16,'email_encryption_type','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (17,'mandrill_api','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (18,'sparkpost_api','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (19,'mailgun_domain','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (20,'mailgun_api','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (21,'max_row_per_table','10','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (22,'app_name','Gain POS','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (23,'app_logo','logo_37973628.png','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (24,'currency_code','usd','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (25,'can_signup','1','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (26,'can_login','1','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (27,'invoice_prefix','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (28,'invoice_suffix','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (29,'last_invoice_number','2','',NULL,0,'0000-00-00 00:00:00','2022-07-22 13:16:41');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (30,'auto_generate_invoice','0','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (31,'auto_email_receive','0','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (32,'invoice_starts_from','1','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (33,'invoiceLogo','default-logo.png','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (34,'purchase_invoice_prefix','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (35,'purchase_invoice_suffix','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (36,'purchase_last_invoice_number','2','',NULL,0,'0000-00-00 00:00:00','2022-07-22 13:15:46');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (37,'purchase_auto_generate_invoice','0','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (38,'purchase_invoice_starts_from','1','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (39,'purchase_invoiceLogo','default-logo.png','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (40,'re_order','10','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (41,'sku_prefix','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (42,'sales_return_status','sales','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (43,'purchase_return_status','purchase','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (44,'offline_mode','0','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (45,'time_zone','UTC','',NULL,0,'0000-00-00 00:00:00','2022-07-19 01:39:17');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (46,'notification_time','2019-12-25T04:00:00.641Z','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (47,'low_stock_notification','0','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (48,'out_of_stock_products','0','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (49,'sales_list_delete_option','0','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (50,'sms_recive_to_customer','0','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (51,'new_customer_welcome_sms','0','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (52,'sms_from_name_phone_number','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (53,'sms_driver','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (54,'key','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (55,'secret_key','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (56,'sales_list_edit_option','0','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (57,'purchase_code','','',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (58,'current_branch','1','user',1,0,'2022-07-19 01:30:32','2022-08-03 23:38:12');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (59,'current_branch','2','user',6,0,'2022-07-22 13:14:47','2022-07-22 13:14:47');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (60,'current_branch','3','user',8,0,'2022-07-25 13:09:36','2022-07-25 13:09:36');
insert  into `settings`(`id`,`setting_name`,`setting_value`,`setting_type`,`user_id`,`created_by`,`created_at`,`updated_at`) values (61,'sales_type','customer','',6,0,'0000-00-00 00:00:00','2022-07-25 23:29:28');

/*Table structure for table `shipping_areas` */

DROP TABLE IF EXISTS `shipping_areas`;

CREATE TABLE `shipping_areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shipping_areas` */

/*Table structure for table `shipping_information` */

DROP TABLE IF EXISTS `shipping_information`;

CREATE TABLE `shipping_information` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_area_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shipping_information` */

/*Table structure for table `shortcut_keys` */

DROP TABLE IF EXISTS `shortcut_keys`;

CREATE TABLE `shortcut_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `defaultShortcuts` longtext COLLATE utf8_unicode_ci NOT NULL,
  `customShortcuts` longtext COLLATE utf8_unicode_ci,
  `created_by` int(11) NOT NULL,
  `shortcutsStatus` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `shortcut_keys` */

insert  into `shortcut_keys`(`id`,`user_id`,`defaultShortcuts`,`customShortcuts`,`created_by`,`shortcutsStatus`,`created_at`,`updated_at`) values (1,1,'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}',NULL,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `shortcut_keys`(`id`,`user_id`,`defaultShortcuts`,`customShortcuts`,`created_by`,`shortcutsStatus`,`created_at`,`updated_at`) values (2,6,'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}',NULL,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `shortcut_keys`(`id`,`user_id`,`defaultShortcuts`,`customShortcuts`,`created_by`,`shortcutsStatus`,`created_at`,`updated_at`) values (3,6,'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}',NULL,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `shortcut_keys`(`id`,`user_id`,`defaultShortcuts`,`customShortcuts`,`created_by`,`shortcutsStatus`,`created_at`,`updated_at`) values (4,6,'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}',NULL,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `shortcut_keys`(`id`,`user_id`,`defaultShortcuts`,`customShortcuts`,`created_by`,`shortcutsStatus`,`created_at`,`updated_at`) values (5,6,'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}',NULL,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `shortcut_keys`(`id`,`user_id`,`defaultShortcuts`,`customShortcuts`,`created_by`,`shortcutsStatus`,`created_at`,`updated_at`) values (6,8,'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}',NULL,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `shortcut_keys`(`id`,`user_id`,`defaultShortcuts`,`customShortcuts`,`created_by`,`shortcutsStatus`,`created_at`,`updated_at`) values (7,8,'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}',NULL,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `shortcut_keys`(`id`,`user_id`,`defaultShortcuts`,`customShortcuts`,`created_by`,`shortcutsStatus`,`created_at`,`updated_at`) values (8,8,'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}',NULL,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `sms_templates` */

DROP TABLE IF EXISTS `sms_templates`;

CREATE TABLE `sms_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sms_templates` */

insert  into `sms_templates`(`id`,`template_type`,`template_subject`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (1,'pos_sms','Sales sms','Hi, {first_name} Thanks for shopping with {app_name}. Your invoice is {invoice_id} Total amount {total}','',NULL,NULL);
insert  into `sms_templates`(`id`,`template_type`,`template_subject`,`default_content`,`custom_content`,`created_at`,`updated_at`) values (2,'customer_welcome_sms','Customer Welcome sms','Hi, {first_name} Thanks for join with {app_name}','',NULL,NULL);

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tin_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `suppliers` */

/*Table structure for table `taxes` */

DROP TABLE IF EXISTS `taxes`;

CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL DEFAULT '0',
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `taxes` */

insert  into `taxes`(`id`,`name`,`percentage`,`is_default`,`created_at`,`updated_at`) values (1,'Zero Tax',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `taxes`(`id`,`name`,`percentage`,`is_default`,`created_at`,`updated_at`) values (2,'5% Tax',5,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `taxes`(`id`,`name`,`percentage`,`is_default`,`created_at`,`updated_at`) values (3,'15% Tax',15,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `todo_lists` */

DROP TABLE IF EXISTS `todo_lists`;

CREATE TABLE `todo_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `due_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `completed` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `todo_lists` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `user_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_excluded` tinyint(4) NOT NULL DEFAULT '1',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `branch_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_check` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`gender`,`date_of_birth`,`company`,`phone_number`,`address`,`avatar`,`verified`,`is_admin`,`role_id`,`user_type`,`tax_excluded`,`enabled`,`created_by`,`branch_id`,`token`,`remember_token`,`notification_check`,`created_at`,`updated_at`) values (1,'John','Doe','admin@demo.com','$2y$10$HYw5jV74zxsNvw/7Y4KUFebpVATh3594n2jeEb97Ep7B/YFrEL2vG',NULL,NULL,NULL,NULL,NULL,'default.jpg',1,1,0,'staff',1,1,0,'1','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`gender`,`date_of_birth`,`company`,`phone_number`,`address`,`avatar`,`verified`,`is_admin`,`role_id`,`user_type`,`tax_excluded`,`enabled`,`created_by`,`branch_id`,`token`,`remember_token`,`notification_check`,`created_at`,`updated_at`) values (2,'Robert','Smith','robert@demo.com','$2y$10$ERyIfnDLRm2TmqHAv.gZ6Oz4pmaS93MsS0YpzSPrfgepl.HuhmPTi',NULL,NULL,NULL,NULL,NULL,'default.jpg',1,0,2,'staff',1,1,0,'1','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`gender`,`date_of_birth`,`company`,`phone_number`,`address`,`avatar`,`verified`,`is_admin`,`role_id`,`user_type`,`tax_excluded`,`enabled`,`created_by`,`branch_id`,`token`,`remember_token`,`notification_check`,`created_at`,`updated_at`) values (3,'Joan','Toy','joan@demo.com','$2y$10$djrFgnYDBHURd56HODfRreKZ27DGTIaT2/hvd6HTiPg78e9Nk6FfO',NULL,NULL,NULL,'123456789',NULL,'default.jpg',1,0,2,'staff',1,1,0,'1','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`gender`,`date_of_birth`,`company`,`phone_number`,`address`,`avatar`,`verified`,`is_admin`,`role_id`,`user_type`,`tax_excluded`,`enabled`,`created_by`,`branch_id`,`token`,`remember_token`,`notification_check`,`created_at`,`updated_at`) values (4,'Kade','Kiehn','kade@demo.com','$2y$10$HJj5.Jtr56eKYrpsiZemx.BjcjPUPuxp4E5aJuD0RD5SC.UDML3Sy',NULL,NULL,NULL,'123456789',NULL,'default.jpg',1,0,1,'staff',1,1,0,'1','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`gender`,`date_of_birth`,`company`,`phone_number`,`address`,`avatar`,`verified`,`is_admin`,`role_id`,`user_type`,`tax_excluded`,`enabled`,`created_by`,`branch_id`,`token`,`remember_token`,`notification_check`,`created_at`,`updated_at`) values (5,'Ali','Banet','banet@demo.com','$2y$10$Rw5I1etMZac3uikuY.R1XeBy5OQfi8.Nql8jF4w.F469dFdeSkAIO',NULL,NULL,'Banet Multimedia','1230456789',NULL,'default.jpg',1,0,1,'staff',1,1,0,'1','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`gender`,`date_of_birth`,`company`,`phone_number`,`address`,`avatar`,`verified`,`is_admin`,`role_id`,`user_type`,`tax_excluded`,`enabled`,`created_by`,`branch_id`,`token`,`remember_token`,`notification_check`,`created_at`,`updated_at`) values (6,'Manajer b1','pertama','mpertama@gmail.com','$2y$10$HYw5jV74zxsNvw/7Y4KUFebpVATh3594n2jeEb97Ep7B/YFrEL2vG',NULL,NULL,'company pertama',NULL,NULL,'default.jpg',1,0,1,'staff',1,1,0,'2',NULL,NULL,NULL,'2022-07-22 20:02:41','2022-07-22 13:09:52');
insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`gender`,`date_of_birth`,`company`,`phone_number`,`address`,`avatar`,`verified`,`is_admin`,`role_id`,`user_type`,`tax_excluded`,`enabled`,`created_by`,`branch_id`,`token`,`remember_token`,`notification_check`,`created_at`,`updated_at`) values (7,'Staff b1','pertama','spertama@gmail.com','$2y$10$HYw5jV74zxsNvw/7Y4KUFebpVATh3594n2jeEb97Ep7B/YFrEL2vG',NULL,NULL,'company pertama',NULL,NULL,'default.jpg',1,0,0,'staff',1,1,0,'2',NULL,NULL,NULL,'2022-07-22 20:02:41','2022-07-22 13:06:10');
insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`gender`,`date_of_birth`,`company`,`phone_number`,`address`,`avatar`,`verified`,`is_admin`,`role_id`,`user_type`,`tax_excluded`,`enabled`,`created_by`,`branch_id`,`token`,`remember_token`,`notification_check`,`created_at`,`updated_at`) values (8,'Manajer b2','kedua','mkedua@gmail.com','$2y$10$HYw5jV74zxsNvw/7Y4KUFebpVATh3594n2jeEb97Ep7B/YFrEL2vG',NULL,NULL,'company pertama',NULL,NULL,'default.jpg',1,0,1,'staff',1,1,0,'3',NULL,NULL,NULL,'2022-07-22 20:02:41','2022-07-22 13:20:09');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
