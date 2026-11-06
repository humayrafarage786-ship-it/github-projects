CREATE DATABASE IF NOT EXISTS h_eco
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE h_eco;


CREATE TABLE IF NOT EXISTS provinces (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS municipalities (
	id INT AUTO_INCREMENT PRIMARY KEY,
	province_id INT NOT NULL,
	name VARCHAR(60) UNIQUE  NOT NULL,
	limite MULTIPOLYGON NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP,
	
	CONSTRAINT fk_municipalities_provinces
		FOREIGN KEY (province_id)
		REFERENCES provinces(id)
);

CREATE TABLE IF NOT EXISTS containers (
	id INT AUTO_INCREMENT PRIMARY KEY,
	municipality_id INT NOT NULL,
	type VARCHAR(50),
	current_state ENUM('empty', 'medium', 'full') NOT NULL DEFAULT  'empty',
	latitude DECIMAL(10, 8) NOT NULL,
	longitude DECIMAL(10, 8) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP,
	
	CONSTRAINT fk_containers_municipalities
		FOREIGN KEY (municipality_id)
		REFERENCES municipalities(id)
);

CREATE TABLE IF NOT EXISTS container_histories (
	id INT AUTO_INCREMENT PRIMARY KEY,
	container_id INT NOT NULL,
	state ENUM('empty', 'medium', 'full') NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	
	CONSTRAINT fk_containers_histories_containers
		FOREIGN KEY (container_id)
		REFERENCES containers (id)
);

CREATE TABLE IF NOT EXISTS users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	municipality_id INT,
	name VARCHAR(60) NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	type ENUM('admin', 'municipality', 'operator', 'normal'),
	is_active BOOL NOT NULL DEFAULT TRUE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP,
	
	CONSTRAINT fk_users_municipalities
		FOREIGN KEY (municipality_id)
		REFERENCES municipalities(id)
);

CREATE TABLE IF NOT EXISTS reports (
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT NOT NULL,
	container_id INT NOT NULL,
	state ENUM('empty', 'medium', 'full') NOT NULL,
	priority ENUM('medium', 'high'),
	description VARCHAR(255),
	storage_key VARCHAR(36) NOT NULL,
	status ENUM('pending', 'rejected', 'approved') DEFAULT 'pending',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	
	CONSTRAINT fk_reports_users
		FOREIGN KEY (user_id)
		REFERENCES users (id),
		
	CONSTRAINT fk_reports_containers
		FOREIGN KEY (container_id)
		REFERENCES containers (id)
);

CREATE TABLE IF NOT EXISTS notifications (
	id INT AUTO_INCREMENT PRIMARY KEY,
	container_id INT NOT NULL,
	message varchar(100) not null,
	delivered_at TIMESTAMP,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	
	CONSTRAINT fk_notifications_containers
		FOREIGN KEY (container_id)
		REFERENCES containers (id)
);
