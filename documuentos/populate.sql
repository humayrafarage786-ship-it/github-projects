USE h_eco;


-- desativar chaves estrangeiras para apagar registos
SET FOREIGN_KEY_CHECKS = 0;

-- Limpar dados das tabelas
TRUNCATE TABLE h_eco.notifications;
TRUNCATE TABLE h_eco.reports;
TRUNCATE TABLE h_eco.users;
TRUNCATE TABLE h_eco.container_histories;
TRUNCATE TABLE h_eco.containers;
TRUNCATE TABLE h_eco.municipalities;
TRUNCATE TABLE h_eco.provinces;

-- reativar chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 1;

-- Inserir prov'incias
INSERT INTO provinces (id, name)
VALUES (1, 'lisboa');

-- Municipios
INSERT INTO municipalities (id, province_id, name, limite) VALUES
(1, 1, 'lisboa', ST_GeomFromText('MULTIPOLYGON(((9.14 -38.72, 9.16 -38.72, 9.16 -38.74, 9.14 -38.74, 9.14 -38.72)))', 4326)),
(2, 1, 'sintra', ST_GeomFromText('MULTIPOLYGON(((9.38 -38.80, 9.40 -38.80, 9.40 -38.82, 9.38 -38.82, 9.38 -38.80)))', 4326));

-- contentores
INSERT INTO containers (id, municipality_id, current_state, latitude, longitude) VALUES
(1, 1, 'empty', 38.72230000, -9.13930000),
(2, 1, 'full', 38.71690000, -9.13990000),
(3, 2, 'medium', 38.80290000, -9.38170000);

-- users
INSERT INTO users (id, municipality_id, name, email, password, `type`) VALUES
(1, 1, 'humaira farage', 'humaira@heco.com', 'hashed_password', 'admin'),
(2, 1, 'margarida sumbo', 'margarida@heco.com', 'hashed_password', 'municipality'),
(3, 2, 'tiago', 'tiago@sintra.com', 'hashed_password', 'operator'),
(4, null, 'john doe', 'johndoe@example.com', 'hashed_password', 'normal');

-- reports
INSERT INTO reports (id, container_id, user_id, state, priority, description, storage_key, status) VALUES
(1, 1, 4, 'medium', 'high', 'tem um cachoro morto', 'storage_key_uuid', 'pending'),
(2, 3, 4, 'medium', 'high', 'tem um cachoro morto', 'storage_key_uuid', 'approved');

-- notifications
INSERT INTO notifications (id, container_id, message) VALUES 
(1, 2, 'contentor totalmente cheio'),
(2, 3, 'contentor medium, mas recolha necessaria devido a substancias toxicas');