CREATE TABLE `records` (
	`id` text PRIMARY KEY NOT NULL,
	`kind` text NOT NULL,
	`user_id` text NOT NULL,
	`business_id` text DEFAULT '' NOT NULL,
	`status` text DEFAULT 'pending' NOT NULL,
	`data` text NOT NULL,
	`created_at` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `saved_businesses` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`business_id` text NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `saved_user_business` ON `saved_businesses` (`user_id`,`business_id`);