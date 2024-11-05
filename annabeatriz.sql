CREATE DATABASE hotel;

\c hotel;

CREATE TABLE hospedes(
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE quartos(
    id_quarto SERIAL PRIMARY KEY,
    numero DECIMAL(3,0) UNIQUE NOT NULL
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
