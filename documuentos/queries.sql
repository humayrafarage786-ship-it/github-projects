USE h_eco;

-- Visualizar tdos municipios
SELECT * FROM municipalities;

-- Visualizar quantos contentores tem por municipio
SELECT m.name, COUNT(c.id)  FROM municipalities m
JOIN containers c ON c.municipality_id = m.id
GROUP BY (m.name);

-- Visualizar todos contentores com os respectivos estados atual
SELECT  p.name AS province, m.name AS municipality, c.id AS container_id, c.current_state AS state, c.latitude, c.longitude
FROM containers c
JOIN municipalities m ON c.municipality_id = m.id
JOIN provinces p ON m.province_id = p.id;

-- Visualizar todos relatorios de alta prioridade para a recolha
SELECT 
	r.id AS report_id,
	u.name AS user_name,
	c.id AS container_id,
	r.state AS reported_state,
	r.priority,
	r.description,
	r.created_at
FROM reports r
JOIN users u ON u.id = r.user_id
JOIN containers c ON c.id = r.container_id
WHERE r.status = 'approved' AND r.priority = 'high';
