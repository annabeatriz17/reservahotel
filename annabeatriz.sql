CREATE DATABASE hotel;

\c hotel;

CREATE TABLE hospedes(
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE quartos(
    id_quarto SERIAL PRIMARY KEY,
    numero DECIMAL(3,0) UNIQUE NOT NULL,
    servico_quarto VARCHAR(50),
    tipo_cama VARCHAR(50)
);

CREATE TABLE reservas(
    id_reserva SERIAL PRIMARY KEY,
    data_inicio_reserva DATE NOT NULL,
    hora_reserva TIME NOT NULL,
    data_termino_reserva DATE NOT NULL,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
    CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

INSERT INTO hospedes(nome, email) VALUES
('Luna Valente', 'luna.valente@gmail.com'),
('Matteo Balsano', 'matteo.balsano@gmail.com'),
('Ambar Smith', 'ambar.smith@gmail.com'),
('Simón Álvarez', 'simon.alvarez@gmail.com');

INSERT INTO quartos(numero, servico_quarto, tipo_cama) VALUES
(1, 'Serviço de quarto', 'Cama King Size'),
(2, 'Serviço de quarto', 'Cama de casal'),
(3, 'Serviço de quarto', 'Cama King Size'),
(4, 'Serviço de quarto', 'Cama Queen Size'),
(5, 'Serviço de quarto', 'Cama King Size'),
(6, 'Serviço de quarto', 'Cama King Size');

INSERT INTO reservas(data_inicio_reserva, hora_reserva, data_termino_reserva, id_hospede, id_quarto) VALUES
('2021-01-01', '10:00:00', '2021-01-02', 1, 1),
('2021-01-01', '10:00:00', '2021-01-02', 2, 2),
('2021-01-01', '11:00:00', '2021-01-02', 3, 3),
('2021-01-01', '09:00:00', '2021-01-02', 4, 4);

SELECT * FROM reservas;

SELECT
    r.id_reserva,
    h.nome AS hospede,
    h.email,
    q.numero AS quarto,
    q.servico_quarto,
    q.tipo_cama,
    r.data_inicio_reserva,
    r.hora_reserva,
    r.data_termino_reserva
FROM
    reservas r
JOIN 
    quartos q ON r.id_quarto = q.id_quarto
JOIN
    hospedes h ON r.id_hospede = h.id_hospede
WHERE
    r.data_termino_reserva <= '2021-01-02';


SELECT
    r.id_reserva,
    h.nome AS hospede,
    h.email,
    q.numero AS quarto,
    q.servico_quarto,
    q.tipo_cama
FROM
    quartos q
LEFT JOIN
    reservas r ON q.id_quarto = r.id_quarto
LEFT JOIN
    hospedes h ON r.id_hospede = h.id_hospede;

SELECT
    r.id_reserva,
    h.nome AS hospede,
    h.email,
    q.numero AS quarto,
    q.servico_quarto,
    q.tipo_cama,
    r.data_inicio_reserva,
    r.hora_reserva,
    r.data_termino_reserva
FROM
    quartos q
LEFT JOIN
    reservas r ON q.id_quarto = r.id_quarto
LEFT JOIN   
    hospedes h ON r.id_hospede = h.id_hospede
WHERE    
    r.id_reserva IS NULL;
